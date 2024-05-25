package snax.xdma.commonCells

import chisel3._
import chisel3.util._

class tcdmParam(
    val addrWidth: Int = 17, 
    val dataWidth: Int = 64, 
    val numChannel: Int = 8
)

object tcdmParam {
    def apply(addrWidth: Int, dataWidth: Int, numChannel: Int) = new tcdmParam(addrWidth, dataWidth, numChannel)
    def apply() = new tcdmParam(addrWidth = 17, dataWidth = 64, numChannel = 8)
}

class complexQueue(inputWidth: Int, outputWidth: Int, depth: Int) extends Module {
    val bigWidth = Seq(inputWidth, outputWidth).max
    val smallWidth = Seq(inputWidth, outputWidth).min
    require(bigWidth % smallWidth == 0, message = "The Bigger datawidth should be interger times of smaller width! ")
    val numChannel = bigWidth / smallWidth
    require(depth > 0)

    val io = IO(new Bundle {
        val in = Flipped(Vec(
            {
                if(inputWidth == bigWidth) 1 else numChannel 
            }, 
            Decoupled(UInt(inputWidth.W))
        ))
        val out = Vec(
            {
                if(outputWidth == bigWidth) 1 else numChannel 
            }, 
            Decoupled(UInt(outputWidth.W))
        )
        val allEmpty = Output(Bool())
        val anyFull = Output(Bool())
    })

    val queues = for (i <- 0 until numChannel) yield {
        Module(new Queue(UInt(smallWidth.W), depth))
    }

    if (io.in.length != 1) {    // The input port has small width so that the valid signal and ready signal should be connected directly to the input
        io.in.zip(queues).foreach {case (i, j) => i <> j.io.enq}
        }
         else {                    
            // only ready when all signals are ready
            val enq_all_ready = queues.map(_.io.enq.ready).reduce(_ & _)
            io.in.head.ready := enq_all_ready
            // Only when all signals are ready, then valid signals in each channels can be passed to FIFO
            queues.foreach(i => i.io.enq.valid := enq_all_ready & io.in.head.valid)
            // Connect all data
            queues.zipWithIndex.foreach{case(queue, i) => {
                queue.io.enq.bits := io.in.head.bits(i*smallWidth + smallWidth - 1, i*smallWidth)
            }}
    }

    // The same thing for the output
    if (io.out.length != 1) {    // The output port has small width so that the valid signal and ready signal should be connected directly to the input
        io.out.zip(queues).foreach {case (i, j) => i <> j.io.deq}
        }
         else {                    
            // only valid when all signals are valid
            val deq_all_valid = queues.map(_.io.deq.valid).reduce(_ & _)
            io.out.head.valid := deq_all_valid
            // Only when all signals are valid, then ready signals in each channels can be passed to FIFO
            queues.foreach(i => i.io.deq.ready := deq_all_valid & io.out.head.ready)
            // Connect all data
            io.out.foreach(_.bits := queues.map(i => i.io.deq.bits).reduce{(a, b) => Cat(b, a)})
    }

    // All empty signal is a debug signal and derived from sub channels: if all fifo is empty, then this signal is empty
    io.allEmpty := queues.map(queue => ~(queue.io.deq.valid)).reduce(_ & _)

    // Any full signal is a debug signal and derived from sub channels: if any fifo is full, then this signal is full
    io.anyFull := queues.map(queue => ~(queue.io.enq.ready)).reduce(_ | _)
}



