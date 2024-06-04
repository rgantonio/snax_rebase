package snax.xdma.xdmaFrontend

import chisel3._
import chisel3.util._

import snax.utils._
import snax.xdma.commonCells._
import snax.xdma.commonCells.BitsConcat._


import snax.xdma.xdmaStreamer.{Reader, Writer, AddressGenUnitCfgIO}
import snax.xdma.designParams._

import snax.csr_manager._

class DMACtrlIO(
    readerparam: ReaderWriterDataPathParam,
    writerparam: ReaderWriterDataPathParam,
    axiWidth: Int = 512
) extends Bundle {
    // Local DMADatapath control signal (Which is connected to DMADataPath)
    val localDMADataPath = new Bundle {
        val reader_cfg_o = Output(new ReaderWriterCfgIO(readerparam))
        val writer_cfg_o = Output(new ReaderWriterCfgIO(writerparam))

        val loopBack_o = Output(Bool()) // Unbuffered, pay attention!
        // Two start signal will inform the new cfg is available, trigger agu, and inform all extension that a stream is coming
        val reader_start_o = Output(Bool())
        val writer_start_o = Output(Bool())
        // Two busy signal only go down if a stream fully passthrough the reader / writter.
        // These signals should be readable by the outside; these two will also be used to determine whether the next task can be executed.
        val reader_busy_i = Input(Bool())
        val writer_busy_i = Input(Bool())
    }
    // Remote control signal, which include the signal from other cluster or signal to other cluster. Both of them is AXI related, serialized signal
    val remoteDMADataPath = new Bundle {
        val fromRemote = Flipped(Decoupled(UInt(axiWidth.W)))
        val toRemote = Decoupled(UInt(axiWidth.W))
    }
    // This is the port for CSR Manager
    val csrIO = new CsrManagerIO(
      csrNumReadWrite = 2 + // Reader Pointer needs two CSRs
          readerparam.rwParam.agu_param.dimension * 2 + // Strides + Bounds for read
          {
              if (readerparam.extParam.length == 0) 0
              else readerparam.extParam.map { i => i.io.csr_i.length }.reduce(_ + _)
          } + // The total num of param on reader extension
          2 + // Writer Pointer needs two CSRs
          writerparam.rwParam.agu_param.dimension * 2 + // Strides + Bounds for write
          {
              if (writerparam.extParam.length == 0) 0
              else writerparam.extParam.map { i => i.io.csr_i.length }.reduce(_ + _)
          }, // The total num of param on writer
      csrNumReadOnly = 0,
      // Set to zero at current, but it should be used by returning the finished DMA requests (A simple Counter? )
      csrAddrWidth = 32
    )
}

// The internal sturctured class that used to store the CFG of reader and writer
// The serialized version of this class will be the actual output and input of the DMACtrl (which is to AXI)
// It is the ReaderWriterCfgIO class, with loopBack signal and Ptr of the opposite side (So that the Data can be forwarded to the remote side)
class ReaderWriterCfgInternal(param: ReaderWriterDataPathParam) extends ReaderWriterCfgIO(param: ReaderWriterDataPathParam) {
  val loopBack = Bool()
  val oppositePtr = UInt(param.rwParam.tcdm_param.addrWidth.W)
  override def serialize(): UInt = {
    loopBack.asUInt ++ oppositePtr ++ super.serialize()
  }

  override def deserialize(data: UInt): UInt = {
        var remainingData = super.deserialize(data)

        // Assigning oppositePtr
        oppositePtr := remainingData(oppositePtr.getWidth - 1, 0)
        remainingData = remainingData(remainingData.getWidth - 1, oppositePtr.getWidth)

        // Assigning loopBack
        loopBack := remainingData(0)
        remainingData = remainingData(remainingData.getWidth - 1, 1)
        remainingData
  }

}

class DMACtrl(
    readerparam: ReaderWriterDataPathParam,
    writerparam: ReaderWriterDataPathParam,
    axiWidth: Int = 512
) extends Module {
    val io = IO(new Bundle {
        val dmactrl = new DMACtrlIO(
          readerparam = readerparam,
          writerparam = writerparam,
          axiWidth = axiWidth
        )
        val clusterBaseAddress = Output(UInt(readerparam.rwParam.tcdm_param.addrWidth.W))
    })

    // This is used to determine whether the src and dst request is at the same position
    val clusterMask = Cat(
      VecInit(Seq.fill(readerparam.rwParam.tcdm_param.addrWidth)(true.B)).asUInt,
      VecInit(Seq.fill(log2Floor(readerparam.rwParam.tcdm_param.tcdmSize) + 10)(false.B)).asUInt
    )

    val csrmanager = new CsrManager(
      csrNumReadWrite = 2 + // Reader Pointer needs two CSRs
          readerparam.rwParam.agu_param.dimension * 2 + // Strides + Bounds for read
          {
              if (readerparam.extParam.length == 0) 0
              else readerparam.extParam.map { i => i.io.csr_i.length }.reduce(_ + _)
          } + // The total num of param on reader extension
          2 + // Writer Pointer needs two CSRs
          writerparam.rwParam.agu_param.dimension * 2 + // Strides + Bounds for write
          {
              if (writerparam.extParam.length == 0) 0
              else writerparam.extParam.map { i => i.io.csr_i.length }.reduce(_ + _)
          }, // The total num of param on writer
      csrNumReadOnly = 0,
      // Set to zero at current, but it should be used by returning the finished DMA requests (A simple Counter? )
      csrAddrWidth = 32
    )

    csrmanager.io.csr_config_in <> io.dmactrl.csrIO

    val preRuleCheck_src = Wire(new ReaderWriterCfgIO(readerparam))
    val preRuleCheck_dst = Wire(new ReaderWriterCfgIO(writerparam))
    var remainingCSR = csrmanager.io.csr_config_out.bits.toIndexedSeq

    // Pack the unstructured signal from csrManager to structured signal: Src side
    // Connect agu_cfg.Ptr
    preRuleCheck_src.agu_cfg.Ptr := Cat(remainingCSR(1), remainingCSR(0))
    remainingCSR = remainingCSR.tail.tail

    // Connect agu_cfg.Bounds
    for (i <- 0 until preRuleCheck_src.agu_cfg.Bounds.length) {
        preRuleCheck_src.agu_cfg.Bounds(i) := remainingCSR.head
        remainingCSR = remainingCSR.tail
    }

    // Connect agu_cfg.Strides
    for (i <- 0 until preRuleCheck_src.agu_cfg.Strides.length) {
        preRuleCheck_src.agu_cfg.Strides(i) := remainingCSR.head
        remainingCSR = remainingCSR.tail
    }

    // Connect extension signal
    for (i <- 0 until preRuleCheck_src.ext_cfg.length) {
        preRuleCheck_src.ext_cfg(i) := remainingCSR.head
        remainingCSR = remainingCSR.tail
    }

    // Pack the unstructured signal from csrManager to structured signal: Dst side
    // Connect agu_cfg.Ptr
    preRuleCheck_dst.agu_cfg.Ptr := Cat(remainingCSR(1), remainingCSR(0))
    remainingCSR = remainingCSR.tail.tail

    // Connect agu_cfg.Bounds
    for (i <- 0 until preRuleCheck_dst.agu_cfg.Bounds.length) {
        preRuleCheck_dst.agu_cfg.Bounds(i) := remainingCSR.head
        remainingCSR = remainingCSR.tail
    }

    // Connect agu_cfg.Strides
    for (i <- 0 until preRuleCheck_dst.agu_cfg.Strides.length) {
        preRuleCheck_dst.agu_cfg.Strides(i) := remainingCSR.head
        remainingCSR = remainingCSR.tail
    }

    // Connect extension signal
    for (i <- 0 until preRuleCheck_dst.ext_cfg.length) {
        preRuleCheck_dst.ext_cfg(i) := remainingCSR.head
        remainingCSR = remainingCSR.tail
    }

    if (remainingCSR.length > 1) println("There is some error in CSR -> Structured CFG assigning")

    class structuredCFG extends Bundle {
        val src = chiselTypeOf(preRuleCheck_src)
        val dst = chiselTypeOf(preRuleCheck_dst)
        val loopBack = Bool()
    }

    val postRulecheck = Decoupled(new structuredCFG)
    postRulecheck.bits.src := preRuleCheck_src
    postRulecheck.bits.dst := preRuleCheck_dst
    postRulecheck.bits.loopBack := (clusterMask & preRuleCheck_src.agu_cfg.Ptr) === (clusterMask & preRuleCheck_dst.agu_cfg.Ptr)

    // Exact rule check happens below: pop out the data that violate the rules, pass the data that comform the rules
    when(csrmanager.io.csr_config_out.valid) {
        when(
          (preRuleCheck_src.agu_cfg.Bounds.reduce(_ * _) =/= preRuleCheck_dst.agu_cfg.Bounds
              .reduce(_ * _) |
              (postRulecheck.bits.loopBack) && (clusterMask & preRuleCheck_src.agu_cfg.Ptr) =/= (clusterMask & io.clusterBaseAddress))
        ) {
            csrmanager.io.csr_config_out.ready := true.B
            postRulecheck.valid := false.B
        } otherwise {
            csrmanager.io.csr_config_out.ready := postRulecheck.ready
            postRulecheck.valid := csrmanager.io.csr_config_out.valid
        }
    }

    // New class that pack the loopBack signal with the ReaderWriterCfgIO: See above (ReaderWriterCfgInternal)
    val preRoute_src = Decoupled(new ReaderWriterCfgInternal(readerparam))
    val preRoute_dst = Decoupled(new ReaderWriterCfgInternal(writerparam))

    // Connect bits
    preRoute_src.bits := postRulecheck.bits.src
    preRoute_dst.bits := postRulecheck.bits.dst
    preRoute_src.bits.loopBack := postRulecheck.bits.loopBack
    preRoute_src.bits.oppositePtr := postRulecheck.bits.dst.agu_cfg.Ptr
    preRoute_dst.bits.oppositePtr := postRulecheck.bits.src.agu_cfg.Ptr
    
    // Connect Valid and bits: Only when both preRoutes are ready, postRulecheck is ready
    postRulecheck.ready := preRoute_src.ready & preRoute_dst.ready
    preRoute_src.valid := postRulecheck.ready & postRulecheck.valid
    preRoute_dst.valid := postRulecheck.ready & postRulecheck.valid

    

}
