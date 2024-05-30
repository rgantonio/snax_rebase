package snax.xdma.xdmaDataPath

import chisel3._
import chisel3.util._

import snax.utils._

import snax.xdma.commonCells.DecoupledBufferConnect._
import snax.xdma.commonCells._
import snax.xdma.xdmaStreamer.{Reader, Writer, AddressGenUnitCfgIO}
import snax.xdma.designParams._

// Todo: the decoupled signal cut should be added inbetween extensions to avoid long combinatorial path?
// New operand difinition <|> in commonCells.scala

class DMADataPath(param: DMADataPathParam) extends Module {
    val io = IO(new Bundle {
        // All config signal for reader and writer
        val reader_agu_cfg_i = Input(
          new AddressGenUnitCfgIO(param = param.readerparam.agu_param)
        ) // Buffered within AGU
        val writer_agu_cfg_i = Input(
          new AddressGenUnitCfgIO(param = param.writerparam.agu_param)
        ) // Buffered within AGU
        val reader_ext_cfg_i = if (param.readerext.length != 0) {
            Input(
              Vec(
                param.readerext.map { i => i.userCsrNum }.reduce(_ + _) + param.readerext.length,
                UInt(32.W)
              )
            ) // Buffered within Extension Base Module
        } else Input(Vec(0, UInt(32.W)))

        val writer_ext_cfg_i = if (param.readerext.length != 0) {
            Input(
              Vec(
                param.writerext.map { i => i.userCsrNum }.reduce(_ + _) + param.writerext.length,
                UInt(32.W)
              )
            ) // Buffered within Extension Base Module
        } else Input(Vec(0, UInt(32.W)))

        val loopBack_i = Input(Bool()) // Unbuffered
        // Two start signal will inform the new cfg is available, trigger agu, and inform all extension that a stream is coming
        val reader_start_i = Input(Bool())
        val writer_start_i = Input(Bool())
        // Two busy signal only go down if a stream fully passthrough the reader / writter.
        // reader_busy_o signal == 0 indicates that the reader side is available for next task
        val reader_busy_o = Output(Bool())
        // writer_busy_o signal == 0 indicates that the writer side is available for next task
        val writer_busy_o = Output(Bool())

        // TCDM request and response signal
        val tcdm_reader = new Bundle {
            val req = Vec(
              param.readerparam.tcdm_param.numChannel,
              Decoupled(
                new TcdmReq(
                  param.readerparam.tcdm_param.addrWidth,
                  param.readerparam.tcdm_param.dataWidth
                )
              )
            )
            val rsp = Vec(
              param.readerparam.tcdm_param.numChannel,
              Flipped(Valid(new TcdmRsp(tcdmDataWidth = param.readerparam.tcdm_param.dataWidth)))
            )
        }
        val tcdm_writer = new Bundle {
            val req = Vec(
              param.writerparam.tcdm_param.numChannel,
              Decoupled(
                new TcdmReq(
                  param.writerparam.tcdm_param.addrWidth,
                  param.writerparam.tcdm_param.dataWidth
                )
              )
            )
        }

        // The data for the cluster-level in/out
        // Cluster-level input <> Writer
        // Cluster-level output <> Reader
        val cluster_data_i = Flipped(
          Decoupled(
            UInt(
              (param.writerparam.tcdm_param.dataWidth * param.writerparam.tcdm_param.numChannel).W
            )
          )
        )
        val cluster_data_o = Decoupled(
          UInt((param.readerparam.tcdm_param.dataWidth * param.readerparam.tcdm_param.numChannel).W)
        )
    })

    val reader = Module(new Reader(param.readerparam))
    val writer = Module(new Writer(param.writerparam))

    // Connect TCDM memory to reader and writer
    reader.io.tcdm_req <> io.tcdm_reader.req
    reader.io.tcdm_rsp <> io.tcdm_reader.rsp
    writer.io.tcdm_req <> io.tcdm_writer.req

    // Connect the wire (ctrl plane)
    reader.io.cfg := io.reader_agu_cfg_i
    io.reader_busy_o := reader.io.busy
    reader.io.start := io.reader_start_i

    writer.io.cfg := io.writer_agu_cfg_i
    io.writer_busy_o := writer.io.busy
    writer.io.start := io.writer_start_i

    // Connect the extension
    // Reader Side
    val reader_data_after_extension = Wire(chiselTypeOf(reader.io.data))

    // No extension is provided, the reader.io.data is directly connected to the out
    if (param.readerext.length == 0) reader.io.data <> reader_data_after_extension
    else {
        // There is some extension available: connect them
        // Connect CSR interface
        var remainingCSR =
            io.reader_ext_cfg_i.toIndexedSeq // Give an alias to all extension's csr for a easier manipulation
        for (i <- param.readerext) {
            i.io.csr_i := remainingCSR.take(i.io.csr_i.length)
            remainingCSR = remainingCSR.drop(i.io.csr_i.length)
        }
        if (remainingCSR.length != 0)
            println("Debug: Some remaining CSRs are unconnected at reader. Check the code. ")

        // Connect Start signal
        param.readerext.foreach { i => i.io.start_i := io.reader_start_i }

        // Connect Data
        // The new <|> operator to implement a Decoupled Signal Cut in between the connection <> had been implemented, but haven't go through the detailed test. Shall we provide this function to the user?
        reader.io.data <> param.readerext.head.io.data_i
        param.readerext.last.io.data_o <> reader_data_after_extension
        if (param.readerext.length > 1)
            param.readerext.zip(param.readerext.tail).foreach { case (a, b) =>
                a.io.data_o <> b.io.data_i
            }

        // Connect busy
        // Reader side is busy if reader is busy (addressgen is busy or addressgen fifo is non-empty) or data fifo is non-empty or any extension is busy
        io.reader_busy_o := reader.io.busy | (~reader.io.bufferEmpty) | (param.readerext
            .map { _.ext_busy_o }
            .reduce(_ | _))

        // Suggest a name for each extension
        for (i <- 0 until param.readerext.length)
            param
                .readerext(i)
                .suggestName("reader_ext_" + i.toString() + "_" + param.readerext(i).extName)

    }

    // Writer side
    val writer_data_before_extension = Wire(chiselTypeOf(writer.io.data))

    // No extension is provided, the writer_data_before_extension is directly connected to the writer.io.data
    if (param.writerext.length == 0) writer_data_before_extension <> writer.io.data
    else {
        // There is some extension available: connect them
        // Connect CSR interface
        var remainingCSR =
            io.writer_ext_cfg_i.toIndexedSeq // Give an alias to all extension's csr for a easier manipulation
        for (i <- param.writerext) {
            i.io.csr_i := remainingCSR.take(i.io.csr_i.length)
            remainingCSR = remainingCSR.drop(i.io.csr_i.length)
        }
        if (remainingCSR.length != 0)
            println("Debug: Some remaining CSRs are unconnected at writer. Check the code. ")

        // Connect Start signal
        param.writerext.foreach { i => i.io.start_i := io.writer_start_i }

        // Connect Data
        // The new <|> operator to implement a Decoupled Signal Cut in between the connection <> had been implemented, but haven't go through the detailed test. Shall we provide this function to the user?
        writer_data_before_extension <> param.writerext.head.io.data_i
        param.writerext.last.io.data_o <> writer.io.data
        if (param.writerext.length > 1)
            param.writerext.zip(param.writerext.tail).foreach { case (a, b) =>
                a.io.data_o <> b.io.data_i
            }

        // Connect busy
        // Writer side is busy if writer is busy (addressgen is busy or addressgen fifo is non-empty) or data fifo is non-empty or any extension is busy
        io.writer_busy_o := writer.io.busy | (~writer.io.bufferEmpty) | (param.writerext
            .map { _.ext_busy_o }
            .reduce(_ | _))

        // Suggest a name for each extension
        for (i <- 0 until param.writerext.length)
            param
                .writerext(i)
                .suggestName("writer_ext_" + i.toString() + "_" + param.writerext(i).extName)
    }

    // The following code only tackle with reader_data_after_extension and writer_data_before_extension: they should be either loopbacked or forwarded to the external interface (cluster_data_i / cluster_data_o)
    val readerDemux = Module(new DemuxDecoupled(chiselTypeOf(reader_data_after_extension.bits)))
    val writerMux = Module(new MuxDecoupled(chiselTypeOf(writer_data_before_extension.bits)))

    readerDemux.io.sel := io.loopBack_i
    writerMux.io.sel := io.loopBack_i
    readerDemux.io.in <|> reader_data_after_extension
    writerMux.io.out <|> writer_data_before_extension
    // Why there is a problem? 
    readerDemux.io.out(1) <> writerMux.io.in(1)
    readerDemux.io.out(0) <> io.cluster_data_o
    writerMux.io.in(0) <> io.cluster_data_i
}

object DMADataPath_SystemVerilogEmitter extends App {
    println(
      getVerilogString(
        new DMADataPath(
          new DMADataPathParam(
            readerparam = new ReaderWriterParam,
            writerparam = new ReaderWriterParam
          )
        )
      )
    )
}
