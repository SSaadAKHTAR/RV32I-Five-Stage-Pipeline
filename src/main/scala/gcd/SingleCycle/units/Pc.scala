package SingleCycle
import chisel3._
import chisel3.util._
class PC extends Module {
    val io = IO (new Bundle {
        val in = Input(SInt(32.W))
        val out = Output(SInt(32.W))
    })
    val PC = RegInit(0.S(32.W))
    io.out := PC
    PC := io.in
}