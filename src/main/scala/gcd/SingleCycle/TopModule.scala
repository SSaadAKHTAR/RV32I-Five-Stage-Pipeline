package SingleCycle
import chisel3._
import chisel3.util._
import gcd.SingleCycle.Write_back
import _root_.javax.swing.plaf.nimbus.AbstractRegionPainter

class TopModule extends Module{
    val io = IO(new Bundle{
        val datain = Input(UInt(32.W))
        val out = Output(SInt(32.W))

    })
    val fetch = Module(new fetch)
    val decode = Module(new decode)
    val execute = Module(new execute)
    val memory = Module(new memory)
    val WriteBack = Module(new Write_back)
    val forward = Module(new Forwarding)
    val hazard_detection = Module(new HazardDetectionUnit)
    io.out:=0.S

    val ID_Exmem_wr_en = Reg(Bool())
    val ID_Exmem_r_en = Reg(Bool())
    val ID_Exbform = Reg(Bool())
    val ID_ExRegWr_en = Reg(Bool())
    val ID_Exwr_back = Reg(UInt(2.W))
    val ID_Exaluop = Reg(UInt(4.W))
    val ID_EXopA = Reg(UInt(2.W))
    val ID_EXopB = Reg(Bool())
    val ID_Expcsel = Reg(Bool())
    val ID_Exjalform = Reg(Bool())
    val ID_Exrform= Reg(Bool())

    // when(hazard_detection.io.ctrl_forward === "b1".U) {
    //     ID_Exmem_wr_en := 0.B
    //     ID_Exmem_r_en := 0.B
    //     ID_Exbform := 0.B
    //     ID_ExRegWr_en := 0.B
    //     ID_Exwr_back := 0.U
    //     ID_Exaluop := 0.U
    //     ID_EXopA := 0.U
    //     ID_EXopB := 0.B
    //     ID_Expcsel := 0.B
    //     ID_Exjalform:=1.B
    //     ID_Exrform:=0.B

    // } .otherwise {
    //     ID_Exmem_wr_en :=decode.io.mem_wr_en
    //     ID_Exmem_r_en :=decode.io.mem_r_en
    //     ID_Exbform  :=decode.io.bform
    //     ID_ExRegWr_en :=decode.io.RegWr_en
    //     ID_Exwr_back := decode.io.wr_back
    //     ID_Exaluop := decode.io.aluop
    //     ID_EXopA := decode.io.opAsel
    //     ID_EXopB := decode.io.opBsel
    //     ID_Expcsel := decode.io.pcsel
    //     ID_Exjalform:=decode.io.Jalform
    //     ID_Exrform:=decode.io.rform
    // }

    //Core b\w fetch and decode
    
    

    // when(hazard_detection.io.pc_forward === "b1".U) {
    // pc_module.io.addr := hazard_detection.io.pc_out
    // }.otherwise {
    // when(control_module.io.nextpcsel === "b01".U) {
    //   when(branchlogic_module.io.output === 1.B && control_module.io.branch === 1.B) {
    //     pc_module.io.addr := immediate_module.io.sbimmd_se.asUInt
    //     if_id_module.io.pc_in := 0.U
    //     if_id_module.io.pc_in4 := 0.U
    //     if_id_module.io.instr_in := 0.U
    //   }.otherwise {
    //     pc_module.io.addr := pc_module.io.pc_out4
    //   }

    //   }.elsewhen(control_module.io.nextpcsel === "b10".U) {
    //   pc_module.io.addr := immediate_module.io.ujimmd_se.asUInt
    //   if_id_module.io.pc_in := 0.U
    //   if_id_module.io.pc_in4 := 0.U
    //   if_id_module.io.instr_in := 0.U
    // } .elsewhen(control_module.io.nextpcsel === "b11".U) {
    //   pc_module.io.addr := jalr_module.io.out
    //   if_id_module.io.pc_in := 0.U
    //   if_id_module.io.pc_in4 := 0.U
    //   if_id_module.io.instr_in := 0.U

    // }.otherwise {
    //   pc_module.io.addr := pc_module.io.pc_out4
    // }}

    val IF_IDins  = Reg(UInt(32.W))
    IF_IDins:=fetch.io.instruction
    decode.io.ins:=IF_IDins
    val IF_IDpc = Reg(UInt(32.W))
    IF_IDpc:= fetch.io.pc_out
    decode.io.pcout:=IF_IDpc
    val IF_IDpc4 = Reg(UInt(32.W))
    IF_IDpc4:= fetch.io.pc4_out
    decode.io.pc4out:=IF_IDpc4

    //core b\w decode and execute
    val ID_Exiform = Reg(Bool())
    ID_Exiform:=decode.io.iform
    execute.io.iform:=ID_Exiform
    // val ID_Exrform= Reg(Bool())
    ID_Exrform:=decode.io.rform
    execute.io.rform:=ID_Exrform
    val ID_Exsform = Reg(Bool())
    ID_Exsform:=decode.io.sform
    execute.io.sform:=ID_Exsform
    // val ID_Exbform = Reg(Bool())
    ID_Exbform:=decode.io.bform
    execute.io.bform:=ID_Exbform
    val ID_Exluiform = Reg(Bool())
    ID_Exluiform:=decode.io.luiform
    execute.io.luiform:=ID_Exluiform
    // val ID_Exjalform = Reg(Bool())
    ID_Exjalform:=decode.io.Jalform
    execute.io.Jalform:=ID_Exjalform
    val ID_Exjalrform = Reg(Bool())
    ID_Exjalrform:= decode.io.jalrform
    execute.io.jalrform:=ID_Exjalrform
    val ID_Exlform = Reg(Bool())
    ID_Exlform:=decode.io.lform
    execute.io.lform:=ID_Exlform
    val ID_ExAuipc = Reg(Bool())
    ID_ExAuipc:=decode.io.Auipc
    execute.io.Auipc:=ID_ExAuipc
    val ID_Exlui_jal_jalr_auipc_imm = Reg(SInt(32.W))
    ID_Exlui_jal_jalr_auipc_imm:= decode.io.lui_jal_jalr_auipc_imm
    execute.io.lui_jal_jalr_auipc_imm:=ID_Exlui_jal_jalr_auipc_imm
    val ID_EximmBits = Reg(UInt(12.W))
    ID_EximmBits:=decode.io.immBits
    execute.io.immBits:=ID_EximmBits
    // val ID_Exmem_wr_en = Reg(Bool())
    ID_Exmem_wr_en:=decode.io.mem_wr_en
    execute.io.mem_wr_en:=ID_Exmem_wr_en
    // val ID_Exwr_back = Reg(UInt(2.W))
    ID_Exwr_back:=decode.io.wr_back
    execute.io.wr_back:=ID_Exwr_back
    val ID_Exbr_fun3 = Reg(UInt(3.W))
    ID_Exbr_fun3:= decode.io.br_fun3
    execute.io.br_fun3:=ID_Exbr_fun3
    val ID_Exload_storefun = Reg(UInt(3.W))
    ID_Exload_storefun:=decode.io.load_storefun
    execute.io.load_storefun:=ID_Exload_storefun
    // val ID_Expcsel = Reg(Bool())
    ID_Expcsel:= decode.io.pcsel
    execute.io.pcsel:=ID_Expcsel
    // val ID_Exmem_r_en = Reg(Bool())
    ID_Exmem_r_en:=decode.io.mem_r_en
    execute.io.mem_r_en:=ID_Exmem_r_en
    val ID_EXpc4_out = Reg(UInt(32.W))
    ID_EXpc4_out:= decode.io.pc_4out
    execute.io.pc4_out:=ID_EXpc4_out
    

    // execute.io.rs1:=0.S
    // execute.io.rs2:=0.S
    // val ID_Exrs1 = Reg(SInt(32.W))
    // ID_Exrs1:=decode.io.rs1
    // execute.io.rs1:=ID_Exrs1
    
    when(forward.io.Fa === 0.U ){
        val ID_Exrs1 = Reg(SInt(32.W))
        ID_Exrs1:=decode.io.rs1
        execute.io.rs1:=ID_Exrs1
        // execute.io.rs1:=decode.io.rs1
    }
    .elsewhen(forward.io.Fa === 1.U ){
        execute.io.rs1:=WriteBack.io.alu_out
        // execute.io.rs1:=execute.io.out
    }
    .elsewhen(forward.io.Fa === 2.U){
        val ID_Exrs1 = Reg(SInt(32.W))
        ID_Exrs1:=execute.io.out
        execute.io.rs1:=ID_Exrs1
    }
    .otherwise{
        val ID_Exrs1 = Reg(SInt(32.W))
        ID_Exrs1:=decode.io.rs1
        execute.io.rs1:=ID_Exrs1
    }
    // val ID_Exrs2 = Reg(SInt(32.W))
    // ID_Exrs2:=decode.io.rs2
    // execute.io.rs2:=ID_Exrs2

    when(forward.io.Fb === 0.U){
        val ID_Exrs2 = Reg(SInt(32.W))
        ID_Exrs2:=decode.io.rs2
        execute.io.rs2:=ID_Exrs2
        // execute.io.rs2:=decode.io.rs2
    }
    .elsewhen(forward.io.Fb === 1.U){
        execute.io.rs2:=WriteBack.io.alu_out
        // execute.io.rs2:=execute.io.out
    }
    .elsewhen(forward.io.Fb === 2.U){
        val ID_Exrs2 = Reg(SInt(32.W))
        ID_Exrs2:=execute.io.out
        execute.io.rs2:=ID_Exrs2
    }
    .otherwise{
        val ID_Exrs2 = Reg(SInt(32.W))
        ID_Exrs2:=decode.io.rs2
        execute.io.rs2:=ID_Exrs2
    }
    // val ID_Exaluop = Reg(UInt(4.W))
    ID_Exaluop:=decode.io.aluop
    execute.io.aluop:=ID_Exaluop
    val ID_Expc_out = Reg(UInt(32.W))
    ID_Expc_out:=decode.io.pc_out
    execute.io.pc_out:=ID_Expc_out
    val ID_Eximm_out = Reg(UInt(32.W))
    ID_Eximm_out:= decode.io.imm_out
    execute.io.imm_out:=ID_Eximm_out
    val ID_ExRS1 = Reg(UInt(5.W))
    ID_ExRS1:=decode.io.RS1
    execute.io.RS1:=ID_ExRS1
    forward.io.IDEXrs1:=ID_ExRS1
    val ID_ExRS2 = Reg(UInt(5.W))
    ID_ExRS2:=decode.io.RS2
    execute.io.RS2:= ID_ExRS2
    forward.io.IDEXrs2:=ID_ExRS2
    val ID_ExRd = Reg(UInt(5.W))
    ID_ExRd := decode.io.Rd
    execute.io.Rd := ID_ExRd
    // val ID_ExRegWr_en = Reg(Bool())
    ID_ExRegWr_en:= decode.io.RegWr_en
    execute.io.RegWr_en:=ID_ExRegWr_en
    // val ID_EXopA = Reg(UInt(2.W))
    ID_EXopA:= decode.io.opAsel
    execute.io.opA_in:=ID_EXopA
    // val ID_EXopB = Reg(Bool())
    ID_EXopB:= decode.io.opBsel
    execute.io.opB_in:=ID_EXopB

    // hazard detection module connections
    hazard_detection.io.IF_ID_instr := decode.io.ins
    hazard_detection.io.ID_EX_memread := execute.io.mem_r_en
    hazard_detection.io.ID_EX_rd := execute.io.Rd
    hazard_detection.io.pc_in := decode.io.pc4out
    hazard_detection.io.current_pc_in := decode.io.pcout

    // when(hazard_detection.io.instr_forward === "b1".U) {
    // IF_IDins := hazard_detection.io.instr_out
    // IF_IDpc:= hazard_detection.io.current_pc_out
    // }.otherwise {
    //     IF_IDins:=fetch.io.instruction
    // }
    // decode.io.ins:=IF_IDins
    // decode.io.pcout:=IF_IDpc

    //core b\w execute and memory 
    val ExMemMemWen= Reg(Bool())
    ExMemMemWen:=execute.io.MemWen
    memory.io.Wen:= ExMemMemWen
    val ExMemFun3 = Reg(UInt(3.W))
    ExMemFun3:=execute.io.MemFun3
    memory.io.Fun3:=ExMemFun3
    val ExMemEnable = Reg(Bool())
    ExMemEnable:=execute.io.MemEnable
    memory.io.Enable:=ExMemEnable
    val ExMemDin = Reg (SInt(32.W))
    ExMemDin:=execute.io.MemDin
    memory.io.Din:=ExMemDin
    val ExMemToReg = Reg(UInt(2.W))
    ExMemToReg:=execute.io.MemToReg
    memory.io.MemToReg:=ExMemToReg
    val ExMemRDout = Reg(UInt(5.W))
    ExMemRDout:=execute.io.RDout
    memory.io.RDout:=ExMemRDout
    forward.io.ExMemRd:=ExMemRDout
    val ExMemRS2out= Reg(UInt(5.W))
    ExMemRS2out:=execute.io.RS2out
    memory.io.RS2out:=ExMemRS2out
    val ExMemRegWr_enout = Reg(Bool())
    ExMemRegWr_enout:=execute.io.RegWr_enout
    memory.io.RegWr_enout:=ExMemRegWr_enout
    forward.io.ExMemRegWr_en:=ExMemRegWr_enout
    val ExMempco = Reg(UInt(32.W))
    ExMempco:=execute.io.pco
    memory.io.pco:=ExMempco
    val ExMemout = Reg(SInt(32.W))
    ExMemout:=execute.io.out
    memory.io.out:=ExMemout
    val ExMembr_taken = Reg(Bool())
    ExMembr_taken:=execute.io.br_taken
    memory.io.br_taken:=ExMembr_taken
    val ExMembform = Reg(Bool())
    ExMembform:=execute.io.b_form
    memory.io.bform:=ExMembform
    val ExMempcsel = Reg(Bool())
    ExMempcsel:=execute.io.pcselout
    memory.io.pcselout:=ExMempcsel

    //core b\w memory and write back
    val MemWrbRegWr_enOut = Reg(Bool())
    MemWrbRegWr_enOut:=memory.io.RegWr_enOut
    WriteBack.io.RegWr_enOut:=MemWrbRegWr_enOut
    forward.io.MemWbRegWr_en:=MemWrbRegWr_enOut
    val MemWrbmemtoreg = Reg(UInt(2.W))
    MemWrbmemtoreg:=memory.io.memtoreg
    WriteBack.io.memtoreg:=MemWrbmemtoreg
    val MemWrbRDsel = Reg(UInt(5.W))
    MemWrbRDsel:=memory.io.RDsel
    WriteBack.io.RDsel:=MemWrbRDsel
    forward.io.MemWbRd:=MemWrbRDsel
    val MemWrbMemrd = Reg(Bool())
    MemWrbMemrd:=memory.io.Memrd
    WriteBack.io.Memrd:=MemWrbMemrd
    val MemWrbDout = Reg(SInt(32.W))
    MemWrbDout:=memory.io.Dout
    WriteBack.io.Dout:=MemWrbDout
    val MemWrbalu_out = Reg(SInt(32.W))
    MemWrbalu_out:=memory.io.alu_out
    WriteBack.io.alu_out:=MemWrbalu_out
    val MemWrbpcout = Reg(UInt(32.W))
    MemWrbpcout:=memory.io.pcout
    WriteBack.io.pcout:=MemWrbpcout
    val MemWrbbrtaken=Reg(Bool())
    MemWrbbrtaken:=memory.io.brtaken
    WriteBack.io.brtaken:=MemWrbbrtaken
    val MemWrbbform=Reg(Bool())
    MemWrbbform:=memory.io.b_form
    WriteBack.io.bform:=MemWrbbform
    val MemWrbpcsel = Reg(Bool())
    MemWrbpcsel:= memory.io.pcsel
    WriteBack.io.pcsel:=MemWrbpcsel

    decode.io.btaken:=WriteBack.io.br_taken
    decode.io.wrbform:=WriteBack.io.b_form
    decode.io.Wrbrd:=WriteBack.io.RDselout
    decode.io.din:=WriteBack.io.Rd
    fetch.io.aluout:=WriteBack.io.aluout
    fetch.io.pcsel:= WriteBack.io.pcselout
    decode.io.RegWr_enWB:=WriteBack.io.RegWr_enout



    io.out := decode.io.din
}