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

    io.Fa:="b00".U
    io.Fb:="b00".U

    when(io.ExMemRegWr_en === 1.B && io.ExMemRd =/= 0.U && (io.ExMemRd===io.IDEXrs1) && (io.ExMemRd===io.IDEXrs2)){
        io.Fa:="b01".U  
        io.Fb:="b01".U
    }
    .elsewhen(io.ExMemRegWr_en === 1.B && io.ExMemRd =/= 0.U && (io.ExMemRd===io.IDEXrs1)){
        io.Fa:="b01".U
    }
    .elsewhen(io.ExMemRegWr_en === 1.B && io.ExMemRd =/= 0.U && (io.ExMemRd===io.IDEXrs2)){
        io.Fb:="b01".U
    }

// ( && ~((io.exMem_reg_write === "b1".U) && (io.ex_mem_rdAddr =/= "b00000".U) && (io.ex_mem_rdAddr === io.id_ex_rs1Addr) && (io.ex_mem_rdAddr === io.id_ex_rs2Addr)) && )
    when(io.MemWbRegWr_en === 1.B && io.MemWbRd=/=0.U && ~((io.ExMemRegWr_en === "b1".U) && (io.ExMemRd =/= "b00000".U) && (io.ExMemRd === io.IDEXrs1) && (io.ExMemRd === io.IDEXrs2)) &&  (io.MemWbRd===io.IDEXrs1) && (io.MemWbRd===io.IDEXrs2)){
        io.Fa:="b10".U
        io.Fb:="b10".U
    }//(&& ~((io.exMem_reg_write === "b1".U) && (io.ex_mem_rdAddr =/= "b00000".U) && (io.ex_mem_rdAddr === io.id_ex_rs2Addr))  && )
    .elsewhen(io.MemWbRegWr_en === 1.B && io.MemWbRd=/=0.U && ~((io.ExMemRegWr_en === "b1".U) && (io.ExMemRd =/= "b00000".U) && (io.ExMemRd === io.IDEXrs2)) && (io.MemWbRd===io.IDEXrs1)){
        io.Fa:="b10".U
    }//(  ~((io.exMem_reg_write === "b1".U) && (io.ex_mem_rdAddr =/= "b00000".U) && (io.ex_mem_rdAddr === io.id_ex_rs2Addr)) && )
    .elsewhen(io.MemWbRegWr_en === 1.B && io.MemWbRd=/=0.U && ~((io.ExMemRegWr_en === "b1".U) && (io.ExMemRd =/= "b00000".U) && (io.ExMemRd === io.IDEXrs1)) && (io.MemWbRd===io.IDEXrs2)){
        io.Fb:="b10".U
    }


}