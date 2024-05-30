package snax.xdma.designParams

/* 
 *  This is the collection of all design Params
 *  Design Params is placed all together with companion object to avoid multiple definition of one config & config conflict
 */


 // tcdm Params

class tcdmParam(
    val addrWidth: Int = 17,
    val dataWidth: Int = 64,
    val numChannel: Int = 8
)

object tcdmParam {
    def apply(addrWidth: Int, dataWidth: Int, numChannel: Int) =
        new tcdmParam(addrWidth, dataWidth, numChannel)
    def apply() = new tcdmParam(addrWidth = 17, dataWidth = 64, numChannel = 8)
}

// Streamer Params

class AddressGenUnitParam (
    val dimension: Int, 
    val addressWidth: Int, 
    val spatialUnrollingFactor: Int, 
    val outputBufferDepth: Int
)

object AddressGenUnitParam {
    // The Very Simple instantiation of the Param    
    def apply() = new AddressGenUnitParam(dimension = 2, addressWidth = 48, spatialUnrollingFactor = 8, outputBufferDepth = 8)
    def apply(dimension: Int, addressWidth: Int, spatialUnrollingFactor: Int, outputBufferDepth: Int) = new AddressGenUnitParam(dimension = dimension, addressWidth = addressWidth, spatialUnrollingFactor = spatialUnrollingFactor, outputBufferDepth = outputBufferDepth)
}


class ReaderWriterParam(
    dimension: Int = 3,
    tcdmAddressWidth: Int = 17,
    tcdmDataWidth: Int = 64,
    numChannel: Int = 8,
    addressBufferDepth: Int = 8,
    dataBufferDepth: Int = 8
) {
    val agu_param = AddressGenUnitParam(
      dimension = dimension,
      addressWidth = tcdmAddressWidth,
      spatialUnrollingFactor = numChannel,
      outputBufferDepth = addressBufferDepth
    )

    val tcdm_param = tcdmParam(
      addrWidth = tcdmAddressWidth,
      dataWidth = tcdmDataWidth,
      numChannel = numChannel
    )

    // Data buffer's depth
    val bufferDepth = dataBufferDepth
}


// DMA Params
import snax.xdma.xdmaDataPath._
class DMADataPathParam(
    val readerparam: ReaderWriterParam,
    val writerparam: ReaderWriterParam,
    val readerext: Seq[DMAExtension] = Seq[DMAExtension](),
    val writerext: Seq[DMAExtension] = Seq[DMAExtension]()
)
