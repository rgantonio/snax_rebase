package snax.xdma.xdmaStreamer

import chisel3._
import chisel3.util._

import snax.utils._

// The reader takes the address from the AGU, offer to requestor, and responser collect the data from TCDM and pushed to FIFO packer to recombine into 512 bit data

class Reader(param: AddressGenUnitParam, tcdmDataWidth: Int = 64, tcdmAddressWidth: Int = 16, numChannel: Int = 8, dataBufferDepth: Int = 16) extends Module {
    val io = IO(new Bundle {
        val cfg = Input(new AddressGenUnitCfgIO(param))
        val tcdm_req = Vec(numChannel, Decoupled(new TcdmReq(tcdmAddressWidth, tcdmDataWidth)))
        val tcdm_rsp = Vec(numChannel, Flipped(Valid(new TcdmRsp(tcdmDataWidth = tcdmDataWidth))))
        val data = Decoupled(UInt((tcdmDataWidth * numChannel).W))
        // The signal trigger the stat of Address Generator. The non-empty of address generator will cause data requestor to read the data
        val start = Input(Bool())
        // The module is busy if addressgen is busy or fifo in addressgen is not empty
        val busy = Output(Bool())
        // The reader's buffer is empty
        val bufferEmpty = Output(Bool())

    })

    // Address Generator
    val addressgen = new AddressGenUnit(param)

    // Requestors to send address to TCDM
    val requestors = new DataRequestors(
        tcdmDataWidth = tcdmDataWidth, 
        tcdmAddressWidth = tcdmAddressWidth, 
        isReader = true, 
        numChannel = numChannel
    )

    // Responsors to receive the data from TCDM
    val responsers = new DataResponsers(
        tcdmDataWidth = tcdmDataWidth, 
        numChannel = numChannel
    )

    // Output FIFOs to combine the data from the output of responsers
    val dataBuffer = new snax.xdma.commonCells.complexQueue(
        inputWidth = tcdmDataWidth, 
        outputWidth = tcdmDataWidth * numChannel, 
        depth = dataBufferDepth
    )

    addressgen.io.cfg := io.cfg
    addressgen.io.start := io.start
    requestors.io.in.addr <> addressgen.io.addr
    requestors.io.in.ResponsorReady.get := responsers.io.out.ResponsorReady
    requestors.io.out.tcdm_req <> io.tcdm_req
    responsers.io.tcdm_rsp <> io.tcdm_rsp
    dataBuffer.io.in <> responsers.io.out.data
    dataBuffer.io.out.head <> io.data

    io.busy := addressgen.io.busy | (~addressgen.io.bufferEmpty)
    io.bufferEmpty := dataBuffer.io.out.head.valid      // There are some problems: The bufferEmpty should be derived from each sub buffer, instead of the combine buffer


}
