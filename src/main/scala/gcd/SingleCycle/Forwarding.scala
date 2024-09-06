package SingleCycle

import chisel3._
import chisel3.util._

class Forwarding extends Module {
    val io = IO(new Bundle {
        val IDEXrs1 = Input(UInt(5.W))
        val IDEXrs2 = Input(UInt(5.W))
        val ExMemRd = Input(UInt(5.W))
        val ExMemRegWr_en = Input(UInt(1.W))
        val MemWbRd = Input(UInt(5.W))
        val MemWbRegWr_en = Input(UInt(1.W))
        
        val Fa = Output(UInt(2.W))
        val Fb = Output(UInt(2.W))
})

io.Fa := "b00".U
io.Fb := "b00".U

// EX HAZARD
when(io.ExMemRegWr_en === "b1".U && io.ExMemRd =/= "b00000".U && 
        (io.ExMemRd === io.IDEXrs1.asUInt) && (io.ExMemRd === io.IDEXrs2)) {
    io.Fa := "b10".U
    io.Fb := "b10".U

}.elsewhen(io.ExMemRegWr_en === "b1".U && io.ExMemRd =/= "b00000".U && 
        (io.ExMemRd === io.IDEXrs2)) {    
    io.Fb := "b10".U
  
}.elsewhen(io.ExMemRegWr_en === "b1".U && io.ExMemRd =/= "b00000".U && 
        (io.ExMemRd === io.IDEXrs1)) {    
    io.Fa := "b10".U
}

// MEM HAZARD
when((io.MemWbRegWr_en === "b1".U) && (io.MemWbRd =/= "b00000".U) && (io.MemWbRd === io.IDEXrs1) && (io.MemWbRd === io.IDEXrs2) && 
        ~(io.ExMemRegWr_en === "b1".U && io.ExMemRd =/= "b00000".U && (io.ExMemRd === io.IDEXrs1) && (io.ExMemRd === io.IDEXrs2))) {
    io.Fa := "b01".U
    io.Fb := "b01".U

}.elsewhen((io.MemWbRegWr_en === "b1".U) && (io.MemWbRd =/= "b00000".U) && (io.MemWbRd === io.IDEXrs2) && 
        ~(io.ExMemRegWr_en === "b1".U && io.ExMemRd =/= "b00000".U && (io.ExMemRd === io.IDEXrs2))){
    io.Fb := "b01".U

}.elsewhen((io.MemWbRegWr_en === "b1".U) && (io.MemWbRd =/= "b00000".U) && (io.MemWbRd === io.IDEXrs1) && 
        ~(io.ExMemRegWr_en === "b1".U && io.ExMemRd =/= "b00000".U && (io.ExMemRd === io.IDEXrs1))){
    io.Fa := "b01".U
    }
}