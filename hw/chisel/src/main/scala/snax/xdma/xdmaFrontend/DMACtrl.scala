package snax.xdma.xdmaFrontend

import chisel3._
import chisel3.util._

import snax.xdma.commonCells._
import snax.utils._
import snax.xdma.xdmaStreamer.{Reader, Writer, AddressGenUnitCfgIO}
import snax.xdma.designParams._

class DMACtrlIO(param: DMACtrlParam) extends Bundle {
    val localDMADataPath = new Bundle {
        val reader_agu_cfg_o = Input(
          new AddressGenUnitCfgIO(param = param.readerparam.agu_param)
        ) // Buffered within AGU
        val writer_agu_cfg_o = Input(
          new AddressGenUnitCfgIO(param = param.writerparam.agu_param)
        ) // Buffered within AGU
        val reader_ext_cfg_o = if (param.readerextparam.length != 0) {
            Output(
              Vec(
                param.readerextparam
                    .map { i => i.userCsrNum }
                    .reduce(_ + _) + param.readerextparam.length,
                UInt(32.W)
              )
            ) // Buffered within Extension Base Module
        } else Output(Vec(0, UInt(32.W)))

        val writer_ext_cfg_o = if (param.writerextparam.length != 0) {
            Output(
              Vec(
                param.writerextparam
                    .map { i => i.userCsrNum }
                    .reduce(_ + _) + param.writerextparam.length,
                UInt(32.W)
              )
            ) // Buffered within Extension Base Module
        } else Output(Vec(0, UInt(32.W)))

        val loopBack_o = Input(Bool()) // Unbuffered, pay attention!
        // Two start signal will inform the new cfg is available, trigger agu, and inform all extension that a stream is coming
        val reader_start_o = Output(Bool())
        val writer_start_o = Output(Bool())
        // Two busy signal only go down if a stream fully passthrough the reader / writter.
        // These signals should be readable by the outside; these two will also be used to determine whether the next task can be executed.
        val reader_busy_i = Input(Bool())
        val writer_busy_i = Input(Bool())

    }
}

class DMACtrl(param: DMACtrlParam) extends Module {}
