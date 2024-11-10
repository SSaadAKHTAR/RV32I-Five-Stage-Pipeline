package SingleCycle
import chisel3._
import chisel3.util._
import chisel3.util.experimental.loadMemoryFromFile
import scala . io . Source
class InstMem(initFile: String) extends Module {
  val io = IO(new Bundle {
    val addr        =   Input(UInt(32.W))      
    val data        =   Output(UInt(32.W))      
  })
  val imem = Mem(1024, UInt(32.W))
  loadMemoryFromFile(imem, initFile)
  io.data := imem(io.addr/4.U)
}
