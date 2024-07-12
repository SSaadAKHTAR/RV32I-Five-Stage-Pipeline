package SingleCycle
import chisel3. _
import chisel3. util . _

class Forwarding extends Module{
    val io = IO(new Bundle{
        val IDEXrs1 = Input(UInt(5.W))
        val IDEXrs2 = Input(UInt(5.W))
        val ExMemRd = Input(UInt(5.W))
        val ExMemRegWr_en = Input(Bool())
        val MemWbRegWr_en = Input(Bool())
        val Fa = Output(UInt(2.W))
        val Fb = Output(UInt(2.W))

        val MemWbRd = Input(UInt(5.W))
    })

    io.Fa:=0.U
    io.Fb:=0.U

    when(io.ExMemRegWr_en === 1.B && io.ExMemRd =/= 0.U && (io.ExMemRd===io.IDEXrs1) && (io.ExMemRd===io.IDEXrs2)){
        io.Fa:=1.U
        io.Fb:=1.U
    }
    .elsewhen(io.ExMemRegWr_en === 1.B && io.ExMemRd =/= 0.U && (io.ExMemRd===io.IDEXrs1)){
        io.Fa:=1.U
    }
    .elsewhen(io.ExMemRegWr_en === 1.B && io.ExMemRd =/= 0.U && (io.ExMemRd===io.IDEXrs2)){
        io.Fb:=1.U
    }


    when(io.MemWbRegWr_en === 1.B && io.MemWbRd=/=0.U && (io.MemWbRd===io.IDEXrs1) && (io.MemWbRd===io.IDEXrs2)){
        io.Fa:=2.U
        io.Fb:=2.U
    }
    .elsewhen(io.MemWbRegWr_en === 1.B && io.MemWbRd=/=0.U && (io.MemWbRd===io.IDEXrs1)){
        io.Fa:=2.U
    }
    .elsewhen(io.MemWbRegWr_en === 1.B && io.MemWbRd=/=0.U && (io.MemWbRd===io.IDEXrs2)){
        io.Fb:=2.U
    }


}