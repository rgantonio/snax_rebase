package snax.xdma.xdmaStreamer

import chisel3._
import chisel3.util._
import chiseltest._
import org.scalatest.freespec.AnyFreeSpec
import org.scalatest.flatspec.AnyFlatSpec

import chiseltest.internal.TesterThreadList
import scala.util.Random

class Reader_Tester_v2 extends AnyFreeSpec with ChiselScalatestTester {
    "Reader's behavior is as expected" in test(new Reader(new ReaderWriterParam)).withAnnotations(Seq(WriteVcdAnnotation, VerilatorBackendAnnotation)) {dut =>
        // The accessed address is 1KB (0x0 - 0x400)
        // Configure AGU
        dut.io.cfg.Ptr.poke(0x0.U)
        // 8 parfor, 4 tempfor x 4 tempfor
        dut.io.cfg.Bounds(0).poke(8)
        dut.io.cfg.Bounds(1).poke(4)
        dut.io.cfg.Bounds(2).poke(16)
        // 8 parfor continuous, 4 tempfor having the distance of 128B (read one superbank skip one superbank)
        // 4 tempfor having the distance of 1024B (finish read 4 SB in 8 SB, skip the consiquent 8SB)
        dut.io.cfg.Strides(0).poke(8)
        dut.io.cfg.Strides(1).poke(64)
        dut.io.cfg.Strides(2).poke(256)

        dut.io.start.poke(true)
        dut.clock.step()
        dut.io.start.poke(false)
        // Waiting for the AGU to begin 
        while(dut.io.busy.peekBoolean() == false) dut.clock.step()

        // AGU started work. Now we need to create branches to emulate each channels of TCDM ports
        var concurrent_threads = new chiseltest.internal.TesterThreadList(Seq())
        val mem = collection.mutable.Map[Int, BigInt]()
        var testTerminated = false

        // Each individual thread simulate one TCDM port: If TCDM behaves differently, this is only part need to be modified
        for (i <- 0 until 8) {
            concurrent_threads = concurrent_threads.fork {
                while (true) {
                    if (testTerminated) scala.util.control.Breaks.break()
                    if (dut.io.tcdm_req(i).valid.peekBoolean()) {
                        // Generate a value to the emulated memory
                        mem.addOne((
                            dut.io.tcdm_req(i).bits.addr.peekInt().toInt, 
                            BigInt(64, Random)
                        ))

                        println(
                            "[Genrator] Data: "
                            + mem(dut.io.tcdm_req(i).bits.addr.peekInt().toInt) 
                            + " is saved at address: "
                            + dut.io.tcdm_req(i).bits.addr.peekInt().toInt
                        )
                        // Emulate the behavior of TCDM memory under contention: The response
                        dut.clock.step(Random.between(1, 4))
                        dut.io.tcdm_req(i).ready.poke(true)
                        dut.io.tcdm_rsp(i).valid.poke(true)
                        dut.io.tcdm_rsp(i).bits.data.poke(
                            mem(dut.io.tcdm_req(i).bits.addr.peekInt().toInt)
                        )
                        dut.clock.step()
                        dut.io.tcdm_req(i).ready.poke(false)
                        dut.io.tcdm_rsp(i).valid.poke(false)
                    }
                    else dut.clock.step()
                }
            }
        }

        // The output verifier to verify if the output data is correct
        concurrent_threads = concurrent_threads.fork {
            while (true) {
                if (testTerminated) scala.util.control.Breaks.break()
                if (dut.io.data.valid.peekBoolean()) {
                    // retrieve the data back from the emulated rom
                    val expected_output_non_combined = for (i <- 0 until 8) yield {
                        val mem_element = mem.minBy(_._1)
                        mem.remove(mem_element._1)
                        mem_element._2
                    }
                    // Concatenate them into 512-bit value => This is the expected output
                    val expected_output = expected_output_non_combined.reduceRight((a, b) => (b << 64) + a)

                    dut.io.data.ready.poke(true)
                    dut.io.data.bits.expect(expected_output)
                    println("[Output Verifier] Value: " + expected_output + " equals to emulated memory. ")
                    dut.clock.step()
                    dut.io.data.ready.poke(false)
                }
                else dut.clock.step()
            }
        }

        // The monitor to see if the simulation had finished
        concurrent_threads = concurrent_threads.fork {
            println("[Monitor] The monitor is launched. ")
            // Wait for the dut to start
            dut.clock.step(3)
            // Waiting for the addressgen to finish
            while(dut.io.busy.peekBoolean()) dut.clock.step()
            // Waiting for the Tester to readout all the data
            while(mem.size != 0) dut.clock.step()
            // Everything finished: The simulation is ended
            println("[Monitor] The test is finished and all threads are about to be terminated by the monitor. ")
            dut.clock.step()
            testTerminated = true
        }

        concurrent_threads.joinAndStep()
    }
}