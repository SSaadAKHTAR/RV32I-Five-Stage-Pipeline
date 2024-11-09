// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vcore__Syms.h"


//======================

void Vcore::trace(VerilatedVcdC* tfp, int, int) {
    tfp->spTrace()->addInitCb(&traceInit, __VlSymsp);
    traceRegister(tfp->spTrace());
}

void Vcore::traceInit(void* userp, VerilatedVcd* tracep, uint32_t code) {
    // Callback from tracep->open()
    Vcore__Syms* __restrict vlSymsp = static_cast<Vcore__Syms*>(userp);
    if (!Verilated::calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
                        "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    tracep->module(vlSymsp->name());
    tracep->scopeEscape(' ');
    Vcore::traceInitTop(vlSymsp, tracep);
    tracep->scopeEscape('.');
}

//======================


void Vcore::traceInitTop(void* userp, VerilatedVcd* tracep) {
    Vcore__Syms* __restrict vlSymsp = static_cast<Vcore__Syms*>(userp);
    Vcore* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    {
        vlTOPp->traceInitSub0(userp, tracep);
    }
}

void Vcore::traceInitSub0(void* userp, VerilatedVcd* tracep) {
    Vcore__Syms* __restrict vlSymsp = static_cast<Vcore__Syms*>(userp);
    Vcore* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    const int c = vlSymsp->__Vm_baseCode;
    if (false && tracep && c) {}  // Prevent unused
    // Body
    {
        tracep->declBit(c+173,"clock", false,-1);
        tracep->declBit(c+174,"reset", false,-1);
        tracep->declBus(c+175,"io_out", false,-1, 3,0);
        tracep->declBit(c+173,"core clock", false,-1);
        tracep->declBit(c+174,"core reset", false,-1);
        tracep->declBus(c+175,"core io_out", false,-1, 3,0);
        tracep->declBit(c+173,"core IF_ID__clock", false,-1);
        tracep->declBit(c+174,"core IF_ID__reset", false,-1);
        tracep->declBus(c+1,"core IF_ID__io_pc4_in", false,-1, 31,0);
        tracep->declBus(c+2,"core IF_ID__io_SelectedPC", false,-1, 31,0);
        tracep->declBus(c+3,"core IF_ID__io_SelectedInstr", false,-1, 31,0);
        tracep->declBus(c+4,"core IF_ID__io_pc4_out", false,-1, 31,0);
        tracep->declBus(c+5,"core IF_ID__io_SelectedPC_out", false,-1, 31,0);
        tracep->declBus(c+6,"core IF_ID__io_SelectedInstr_out", false,-1, 31,0);
        tracep->declBit(c+173,"core ID_EX__clock", false,-1);
        tracep->declBus(c+7,"core ID_EX__io_rs1_in", false,-1, 4,0);
        tracep->declBus(c+8,"core ID_EX__io_rs2_in", false,-1, 4,0);
        tracep->declBus(c+9,"core ID_EX__io_rs1_data_in", false,-1, 31,0);
        tracep->declBus(c+10,"core ID_EX__io_rs2_data_in", false,-1, 31,0);
        tracep->declBus(c+11,"core ID_EX__io_imm", false,-1, 31,0);
        tracep->declBus(c+12,"core ID_EX__io_rd_in", false,-1, 4,0);
        tracep->declBus(c+13,"core ID_EX__io_func3_in", false,-1, 2,0);
        tracep->declBit(c+14,"core ID_EX__io_func7_in", false,-1);
        tracep->declBit(c+15,"core ID_EX__io_ctrl_MemWr_in", false,-1);
        tracep->declBit(c+16,"core ID_EX__io_ctrl_MemRd_in", false,-1);
        tracep->declBit(c+17,"core ID_EX__io_ctrl_Reg_W_in", false,-1);
        tracep->declBit(c+16,"core ID_EX__io_ctrl_MemToReg_in", false,-1);
        tracep->declBus(c+18,"core ID_EX__io_ctrl_AluOp_in", false,-1, 2,0);
        tracep->declBus(c+19,"core ID_EX__io_ctrl_OpA_in", false,-1, 1,0);
        tracep->declBit(c+20,"core ID_EX__io_ctrl_OpB_in", false,-1);
        tracep->declBus(c+4,"core ID_EX__io_IFID_pc4_in", false,-1, 31,0);
        tracep->declBus(c+21,"core ID_EX__io_rs1_out", false,-1, 4,0);
        tracep->declBus(c+22,"core ID_EX__io_rs2_out", false,-1, 4,0);
        tracep->declBus(c+23,"core ID_EX__io_rs1_data_out", false,-1, 31,0);
        tracep->declBus(c+24,"core ID_EX__io_rs2_data_out", false,-1, 31,0);
        tracep->declBus(c+25,"core ID_EX__io_rd_out", false,-1, 4,0);
        tracep->declBus(c+26,"core ID_EX__io_imm_out", false,-1, 31,0);
        tracep->declBus(c+27,"core ID_EX__io_func3_out", false,-1, 2,0);
        tracep->declBit(c+28,"core ID_EX__io_func7_out", false,-1);
        tracep->declBit(c+29,"core ID_EX__io_ctrl_MemWr_out", false,-1);
        tracep->declBit(c+30,"core ID_EX__io_ctrl_MemRd_out", false,-1);
        tracep->declBit(c+31,"core ID_EX__io_ctrl_Reg_W_out", false,-1);
        tracep->declBit(c+32,"core ID_EX__io_ctrl_MemToReg_out", false,-1);
        tracep->declBus(c+33,"core ID_EX__io_ctrl_AluOp_out", false,-1, 2,0);
        tracep->declBus(c+34,"core ID_EX__io_ctrl_OpA_out", false,-1, 1,0);
        tracep->declBit(c+35,"core ID_EX__io_ctrl_OpB_out", false,-1);
        tracep->declBus(c+36,"core ID_EX__io_IFID_pc4_out", false,-1, 31,0);
        tracep->declBit(c+173,"core EX_MEM_M_clock", false,-1);
        tracep->declBit(c+30,"core EX_MEM_M_io_IDEX_MEMRD", false,-1);
        tracep->declBit(c+29,"core EX_MEM_M_io_IDEX_MEMWR", false,-1);
        tracep->declBit(c+32,"core EX_MEM_M_io_IDEX_MEMTOREG", false,-1);
        tracep->declBit(c+31,"core EX_MEM_M_io_IDEX_REG_W", false,-1);
        tracep->declBus(c+37,"core EX_MEM_M_io_IDEX_rs2", false,-1, 31,0);
        tracep->declBus(c+25,"core EX_MEM_M_io_IDEX_rd", false,-1, 4,0);
        tracep->declBus(c+38,"core EX_MEM_M_io_alu_out", false,-1, 31,0);
        tracep->declBus(c+27,"core EX_MEM_M_io_fun3in", false,-1, 2,0);
        tracep->declBit(c+39,"core EX_MEM_M_io_EXMEM_memRd_out", false,-1);
        tracep->declBit(c+40,"core EX_MEM_M_io_EXMEM_memWr_out", false,-1);
        tracep->declBit(c+41,"core EX_MEM_M_io_EXMEM_memToReg_out", false,-1);
        tracep->declBit(c+42,"core EX_MEM_M_io_EXMEM_reg_w_out", false,-1);
        tracep->declBus(c+43,"core EX_MEM_M_io_EXMEM_rs2_out", false,-1, 31,0);
        tracep->declBus(c+44,"core EX_MEM_M_io_EXMEM_rd_out", false,-1, 4,0);
        tracep->declBus(c+45,"core EX_MEM_M_io_EXMEM_alu_out", false,-1, 31,0);
        tracep->declBus(c+46,"core EX_MEM_M_io_fun3out", false,-1, 2,0);
        tracep->declBit(c+173,"core MEM_WB_M_clock", false,-1);
        tracep->declBit(c+41,"core MEM_WB_M_io_EXMEM_MEMTOREG", false,-1);
        tracep->declBit(c+42,"core MEM_WB_M_io_EXMEM_REG_W", false,-1);
        tracep->declBit(c+39,"core MEM_WB_M_io_EXMEM_MEMRD", false,-1);
        tracep->declBus(c+44,"core MEM_WB_M_io_EXMEM_rd", false,-1, 4,0);
        tracep->declBus(c+47,"core MEM_WB_M_io_in_dataMem_out", false,-1, 31,0);
        tracep->declBus(c+45,"core MEM_WB_M_io_in_alu_out", false,-1, 31,0);
        tracep->declBit(c+48,"core MEM_WB_M_io_MEMWB_memToReg_out", false,-1);
        tracep->declBit(c+49,"core MEM_WB_M_io_MEMWB_reg_w_out", false,-1);
        tracep->declBit(c+50,"core MEM_WB_M_io_MEMWB_memRd_out", false,-1);
        tracep->declBus(c+51,"core MEM_WB_M_io_MEMWB_rd_out", false,-1, 4,0);
        tracep->declBus(c+52,"core MEM_WB_M_io_MEMWB_dataMem_out", false,-1, 31,0);
        tracep->declBus(c+53,"core MEM_WB_M_io_MEMWB_alu_out", false,-1, 31,0);
        tracep->declBit(c+173,"core PC_clock", false,-1);
        tracep->declBit(c+174,"core PC_reset", false,-1);
        tracep->declBus(c+54,"core PC_io_in", false,-1, 31,0);
        tracep->declBus(c+55,"core PC_io_out", false,-1, 31,0);
        tracep->declBus(c+55,"core PC4_io_pc", false,-1, 31,0);
        tracep->declBus(c+56,"core PC4_io_out", false,-1, 31,0);
        tracep->declBit(c+173,"core InstMemory_clock", false,-1);
        tracep->declBus(c+55,"core InstMemory_io_addr", false,-1, 31,0);
        tracep->declBus(c+57,"core InstMemory_io_data", false,-1, 31,0);
        tracep->declBit(c+173,"core DataMemory_clock", false,-1);
        tracep->declBit(c+40,"core DataMemory_io_mem_write", false,-1);
        tracep->declBus(c+45,"core DataMemory_io_addr", false,-1, 31,0);
        tracep->declBus(c+43,"core DataMemory_io_dataIn", false,-1, 31,0);
        tracep->declBus(c+47,"core DataMemory_io_dataOut", false,-1, 31,0);
        tracep->declBus(c+46,"core DataMemory_io_fun3", false,-1, 2,0);
        tracep->declBit(c+39,"core DataMemory_io_mem_read", false,-1);
        tracep->declBus(c+58,"core control_module_io_opcode", false,-1, 6,0);
        tracep->declBit(c+59,"core control_module_io_mem_write", false,-1);
        tracep->declBit(c+60,"core control_module_io_branch", false,-1);
        tracep->declBit(c+61,"core control_module_io_mem_read", false,-1);
        tracep->declBit(c+62,"core control_module_io_reg_write", false,-1);
        tracep->declBit(c+61,"core control_module_io_men_to_reg", false,-1);
        tracep->declBus(c+63,"core control_module_io_alu_operation", false,-1, 2,0);
        tracep->declBus(c+19,"core control_module_io_operand_A", false,-1, 1,0);
        tracep->declBit(c+64,"core control_module_io_operand_B", false,-1);
        tracep->declBus(c+65,"core control_module_io_extend", false,-1, 1,0);
        tracep->declBus(c+66,"core control_module_io_next_pc_sel", false,-1, 1,0);
        tracep->declBus(c+6,"core ImmGen_io_instr", false,-1, 31,0);
        tracep->declBus(c+5,"core ImmGen_io_pc", false,-1, 31,0);
        tracep->declBus(c+67,"core ImmGen_io_I_type", false,-1, 31,0);
        tracep->declBus(c+68,"core ImmGen_io_S_type", false,-1, 31,0);
        tracep->declBus(c+69,"core ImmGen_io_SB_type", false,-1, 31,0);
        tracep->declBus(c+70,"core ImmGen_io_U_type", false,-1, 31,0);
        tracep->declBus(c+71,"core ImmGen_io_UJ_type", false,-1, 31,0);
        tracep->declBit(c+173,"core RegFile_clock", false,-1);
        tracep->declBit(c+174,"core RegFile_reset", false,-1);
        tracep->declBus(c+7,"core RegFile_io_rs1", false,-1, 4,0);
        tracep->declBus(c+8,"core RegFile_io_rs2", false,-1, 4,0);
        tracep->declBit(c+49,"core RegFile_io_reg_write", false,-1);
        tracep->declBus(c+51,"core RegFile_io_w_reg", false,-1, 4,0);
        tracep->declBus(c+72,"core RegFile_io_w_data", false,-1, 31,0);
        tracep->declBus(c+73,"core RegFile_io_rdata1", false,-1, 31,0);
        tracep->declBus(c+74,"core RegFile_io_rdata2", false,-1, 31,0);
        tracep->declBus(c+27,"core ALU_Control_io_func3", false,-1, 2,0);
        tracep->declBit(c+28,"core ALU_Control_io_func7", false,-1);
        tracep->declBus(c+33,"core ALU_Control_io_aluOp", false,-1, 2,0);
        tracep->declBus(c+75,"core ALU_Control_io_out", false,-1, 4,0);
        tracep->declBus(c+76,"core ALU_io_in_A", false,-1, 31,0);
        tracep->declBus(c+77,"core ALU_io_in_B", false,-1, 31,0);
        tracep->declBus(c+75,"core ALU_io_alu_Op", false,-1, 4,0);
        tracep->declBus(c+38,"core ALU_io_out", false,-1, 31,0);
        tracep->declBus(c+13,"core Branch_M_io_fnct3", false,-1, 2,0);
        tracep->declBit(c+60,"core Branch_M_io_branch", false,-1);
        tracep->declBus(c+78,"core Branch_M_io_arg_x", false,-1, 31,0);
        tracep->declBus(c+79,"core Branch_M_io_arg_y", false,-1, 31,0);
        tracep->declBit(c+80,"core Branch_M_io_br_taken", false,-1);
        tracep->declBus(c+11,"core JALR_io_imme", false,-1, 31,0);
        tracep->declBus(c+81,"core JALR_io_rdata1", false,-1, 31,0);
        tracep->declBus(c+82,"core JALR_io_out", false,-1, 31,0);
        tracep->declBus(c+21,"core Forwarding_io_IDEX_rs1", false,-1, 4,0);
        tracep->declBus(c+22,"core Forwarding_io_IDEX_rs2", false,-1, 4,0);
        tracep->declBus(c+44,"core Forwarding_io_EXMEM_rd", false,-1, 4,0);
        tracep->declBit(c+42,"core Forwarding_io_EXMEM_regWr", false,-1);
        tracep->declBus(c+51,"core Forwarding_io_MEMWB_rd", false,-1, 4,0);
        tracep->declBit(c+49,"core Forwarding_io_MEMWB_regWr", false,-1);
        tracep->declBus(c+83,"core Forwarding_io_forward_a", false,-1, 1,0);
        tracep->declBus(c+84,"core Forwarding_io_forward_b", false,-1, 1,0);
        tracep->declBus(c+6,"core HazardDetect_io_IF_ID_inst", false,-1, 31,0);
        tracep->declBit(c+30,"core HazardDetect_io_ID_EX_memRead", false,-1);
        tracep->declBus(c+25,"core HazardDetect_io_ID_EX_rd", false,-1, 4,0);
        tracep->declBus(c+4,"core HazardDetect_io_pc_in", false,-1, 31,0);
        tracep->declBus(c+5,"core HazardDetect_io_current_pc", false,-1, 31,0);
        tracep->declBit(c+85,"core HazardDetect_io_inst_forward", false,-1);
        tracep->declBit(c+86,"core HazardDetect_io_pc_forward", false,-1);
        tracep->declBit(c+87,"core HazardDetect_io_ctrl_forward", false,-1);
        tracep->declBus(c+6,"core HazardDetect_io_inst_out", false,-1, 31,0);
        tracep->declBus(c+4,"core HazardDetect_io_pc_out", false,-1, 31,0);
        tracep->declBus(c+5,"core HazardDetect_io_current_pc_out", false,-1, 31,0);
        tracep->declBus(c+25,"core Branch_Forward_io_ID_EX_RD", false,-1, 4,0);
        tracep->declBus(c+44,"core Branch_Forward_io_EX_MEM_RD", false,-1, 4,0);
        tracep->declBus(c+51,"core Branch_Forward_io_MEM_WB_RD", false,-1, 4,0);
        tracep->declBit(c+30,"core Branch_Forward_io_ID_EX_memRd", false,-1);
        tracep->declBit(c+39,"core Branch_Forward_io_EX_MEM_memRd", false,-1);
        tracep->declBit(c+50,"core Branch_Forward_io_MEM_WB_memRd", false,-1);
        tracep->declBus(c+88,"core Branch_Forward_io_rs1", false,-1, 4,0);
        tracep->declBus(c+89,"core Branch_Forward_io_rs2", false,-1, 4,0);
        tracep->declBit(c+60,"core Branch_Forward_io_ctrl_branch", false,-1);
        tracep->declBus(c+90,"core Branch_Forward_io_forward_rs1", false,-1, 3,0);
        tracep->declBus(c+91,"core Branch_Forward_io_forward_rs2", false,-1, 3,0);
        tracep->declBus(c+88,"core Structural_io_rs1", false,-1, 4,0);
        tracep->declBus(c+89,"core Structural_io_rs2", false,-1, 4,0);
        tracep->declBit(c+42,"core Structural_io_MEM_WB_regWr", false,-1);
        tracep->declBus(c+51,"core Structural_io_MEM_WB_Rd", false,-1, 4,0);
        tracep->declBit(c+92,"core Structural_io_fwd_rs1", false,-1);
        tracep->declBit(c+93,"core Structural_io_fwd_rs2", false,-1);
        tracep->declBus(c+94,"core PC_for", false,-1, 31,0);
        tracep->declBus(c+95,"core Instruction_F", false,-1, 31,0);
        tracep->declBus(c+96,"core d", false,-1, 31,0);
        tracep->declBus(c+37,"core RS2_value", false,-1, 31,0);
        tracep->declBit(c+173,"core IF_ID_ clock", false,-1);
        tracep->declBit(c+174,"core IF_ID_ reset", false,-1);
        tracep->declBus(c+1,"core IF_ID_ io_pc4_in", false,-1, 31,0);
        tracep->declBus(c+2,"core IF_ID_ io_SelectedPC", false,-1, 31,0);
        tracep->declBus(c+3,"core IF_ID_ io_SelectedInstr", false,-1, 31,0);
        tracep->declBus(c+4,"core IF_ID_ io_pc4_out", false,-1, 31,0);
        tracep->declBus(c+5,"core IF_ID_ io_SelectedPC_out", false,-1, 31,0);
        tracep->declBus(c+6,"core IF_ID_ io_SelectedInstr_out", false,-1, 31,0);
        tracep->declBus(c+4,"core IF_ID_ Pc4_In", false,-1, 31,0);
        tracep->declBus(c+5,"core IF_ID_ S_pc", false,-1, 31,0);
        tracep->declBus(c+6,"core IF_ID_ S_instr", false,-1, 31,0);
        tracep->declBit(c+173,"core ID_EX_ clock", false,-1);
        tracep->declBus(c+7,"core ID_EX_ io_rs1_in", false,-1, 4,0);
        tracep->declBus(c+8,"core ID_EX_ io_rs2_in", false,-1, 4,0);
        tracep->declBus(c+9,"core ID_EX_ io_rs1_data_in", false,-1, 31,0);
        tracep->declBus(c+10,"core ID_EX_ io_rs2_data_in", false,-1, 31,0);
        tracep->declBus(c+11,"core ID_EX_ io_imm", false,-1, 31,0);
        tracep->declBus(c+12,"core ID_EX_ io_rd_in", false,-1, 4,0);
        tracep->declBus(c+13,"core ID_EX_ io_func3_in", false,-1, 2,0);
        tracep->declBit(c+14,"core ID_EX_ io_func7_in", false,-1);
        tracep->declBit(c+15,"core ID_EX_ io_ctrl_MemWr_in", false,-1);
        tracep->declBit(c+16,"core ID_EX_ io_ctrl_MemRd_in", false,-1);
        tracep->declBit(c+17,"core ID_EX_ io_ctrl_Reg_W_in", false,-1);
        tracep->declBit(c+16,"core ID_EX_ io_ctrl_MemToReg_in", false,-1);
        tracep->declBus(c+18,"core ID_EX_ io_ctrl_AluOp_in", false,-1, 2,0);
        tracep->declBus(c+19,"core ID_EX_ io_ctrl_OpA_in", false,-1, 1,0);
        tracep->declBit(c+20,"core ID_EX_ io_ctrl_OpB_in", false,-1);
        tracep->declBus(c+4,"core ID_EX_ io_IFID_pc4_in", false,-1, 31,0);
        tracep->declBus(c+21,"core ID_EX_ io_rs1_out", false,-1, 4,0);
        tracep->declBus(c+22,"core ID_EX_ io_rs2_out", false,-1, 4,0);
        tracep->declBus(c+23,"core ID_EX_ io_rs1_data_out", false,-1, 31,0);
        tracep->declBus(c+24,"core ID_EX_ io_rs2_data_out", false,-1, 31,0);
        tracep->declBus(c+25,"core ID_EX_ io_rd_out", false,-1, 4,0);
        tracep->declBus(c+26,"core ID_EX_ io_imm_out", false,-1, 31,0);
        tracep->declBus(c+27,"core ID_EX_ io_func3_out", false,-1, 2,0);
        tracep->declBit(c+28,"core ID_EX_ io_func7_out", false,-1);
        tracep->declBit(c+29,"core ID_EX_ io_ctrl_MemWr_out", false,-1);
        tracep->declBit(c+30,"core ID_EX_ io_ctrl_MemRd_out", false,-1);
        tracep->declBit(c+31,"core ID_EX_ io_ctrl_Reg_W_out", false,-1);
        tracep->declBit(c+32,"core ID_EX_ io_ctrl_MemToReg_out", false,-1);
        tracep->declBus(c+33,"core ID_EX_ io_ctrl_AluOp_out", false,-1, 2,0);
        tracep->declBus(c+34,"core ID_EX_ io_ctrl_OpA_out", false,-1, 1,0);
        tracep->declBit(c+35,"core ID_EX_ io_ctrl_OpB_out", false,-1);
        tracep->declBus(c+36,"core ID_EX_ io_IFID_pc4_out", false,-1, 31,0);
        tracep->declBus(c+21,"core ID_EX_ io_rs1_out_REG", false,-1, 4,0);
        tracep->declBus(c+22,"core ID_EX_ io_rs2_out_REG", false,-1, 4,0);
        tracep->declBus(c+23,"core ID_EX_ io_rs1_data_out_REG", false,-1, 31,0);
        tracep->declBus(c+24,"core ID_EX_ io_rs2_data_out_REG", false,-1, 31,0);
        tracep->declBus(c+26,"core ID_EX_ io_imm_out_REG", false,-1, 31,0);
        tracep->declBus(c+25,"core ID_EX_ io_rd_out_REG", false,-1, 4,0);
        tracep->declBus(c+27,"core ID_EX_ io_func3_out_REG", false,-1, 2,0);
        tracep->declBit(c+28,"core ID_EX_ io_func7_out_REG", false,-1);
        tracep->declBit(c+29,"core ID_EX_ io_ctrl_MemWr_out_REG", false,-1);
        tracep->declBit(c+30,"core ID_EX_ io_ctrl_MemRd_out_REG", false,-1);
        tracep->declBit(c+31,"core ID_EX_ io_ctrl_Reg_W_out_REG", false,-1);
        tracep->declBit(c+32,"core ID_EX_ io_ctrl_MemToReg_out_REG", false,-1);
        tracep->declBus(c+33,"core ID_EX_ io_ctrl_AluOp_out_REG", false,-1, 2,0);
        tracep->declBus(c+34,"core ID_EX_ io_ctrl_OpA_out_REG", false,-1, 1,0);
        tracep->declBit(c+35,"core ID_EX_ io_ctrl_OpB_out_REG", false,-1);
        tracep->declBus(c+36,"core ID_EX_ io_IFID_pc4_out_REG", false,-1, 31,0);
        tracep->declBit(c+173,"core EX_MEM_M clock", false,-1);
        tracep->declBit(c+30,"core EX_MEM_M io_IDEX_MEMRD", false,-1);
        tracep->declBit(c+29,"core EX_MEM_M io_IDEX_MEMWR", false,-1);
        tracep->declBit(c+32,"core EX_MEM_M io_IDEX_MEMTOREG", false,-1);
        tracep->declBit(c+31,"core EX_MEM_M io_IDEX_REG_W", false,-1);
        tracep->declBus(c+37,"core EX_MEM_M io_IDEX_rs2", false,-1, 31,0);
        tracep->declBus(c+25,"core EX_MEM_M io_IDEX_rd", false,-1, 4,0);
        tracep->declBus(c+38,"core EX_MEM_M io_alu_out", false,-1, 31,0);
        tracep->declBus(c+27,"core EX_MEM_M io_fun3in", false,-1, 2,0);
        tracep->declBit(c+39,"core EX_MEM_M io_EXMEM_memRd_out", false,-1);
        tracep->declBit(c+40,"core EX_MEM_M io_EXMEM_memWr_out", false,-1);
        tracep->declBit(c+41,"core EX_MEM_M io_EXMEM_memToReg_out", false,-1);
        tracep->declBit(c+42,"core EX_MEM_M io_EXMEM_reg_w_out", false,-1);
        tracep->declBus(c+43,"core EX_MEM_M io_EXMEM_rs2_out", false,-1, 31,0);
        tracep->declBus(c+44,"core EX_MEM_M io_EXMEM_rd_out", false,-1, 4,0);
        tracep->declBus(c+45,"core EX_MEM_M io_EXMEM_alu_out", false,-1, 31,0);
        tracep->declBus(c+46,"core EX_MEM_M io_fun3out", false,-1, 2,0);
        tracep->declBit(c+39,"core EX_MEM_M io_EXMEM_memRd_out_REG", false,-1);
        tracep->declBit(c+40,"core EX_MEM_M io_EXMEM_memWr_out_REG", false,-1);
        tracep->declBit(c+41,"core EX_MEM_M io_EXMEM_memToReg_out_REG", false,-1);
        tracep->declBit(c+42,"core EX_MEM_M io_EXMEM_reg_w_out_REG", false,-1);
        tracep->declBus(c+43,"core EX_MEM_M io_EXMEM_rs2_out_REG", false,-1, 31,0);
        tracep->declBus(c+44,"core EX_MEM_M io_EXMEM_rd_out_REG", false,-1, 4,0);
        tracep->declBus(c+45,"core EX_MEM_M io_EXMEM_alu_out_REG", false,-1, 31,0);
        tracep->declBus(c+46,"core EX_MEM_M io_fun3out_REG", false,-1, 2,0);
        tracep->declBit(c+173,"core MEM_WB_M clock", false,-1);
        tracep->declBit(c+41,"core MEM_WB_M io_EXMEM_MEMTOREG", false,-1);
        tracep->declBit(c+42,"core MEM_WB_M io_EXMEM_REG_W", false,-1);
        tracep->declBit(c+39,"core MEM_WB_M io_EXMEM_MEMRD", false,-1);
        tracep->declBus(c+44,"core MEM_WB_M io_EXMEM_rd", false,-1, 4,0);
        tracep->declBus(c+47,"core MEM_WB_M io_in_dataMem_out", false,-1, 31,0);
        tracep->declBus(c+45,"core MEM_WB_M io_in_alu_out", false,-1, 31,0);
        tracep->declBit(c+48,"core MEM_WB_M io_MEMWB_memToReg_out", false,-1);
        tracep->declBit(c+49,"core MEM_WB_M io_MEMWB_reg_w_out", false,-1);
        tracep->declBit(c+50,"core MEM_WB_M io_MEMWB_memRd_out", false,-1);
        tracep->declBus(c+51,"core MEM_WB_M io_MEMWB_rd_out", false,-1, 4,0);
        tracep->declBus(c+52,"core MEM_WB_M io_MEMWB_dataMem_out", false,-1, 31,0);
        tracep->declBus(c+53,"core MEM_WB_M io_MEMWB_alu_out", false,-1, 31,0);
        tracep->declBit(c+48,"core MEM_WB_M io_MEMWB_memToReg_out_REG", false,-1);
        tracep->declBit(c+49,"core MEM_WB_M io_MEMWB_reg_w_out_REG", false,-1);
        tracep->declBit(c+50,"core MEM_WB_M io_MEMWB_memRd_out_REG", false,-1);
        tracep->declBus(c+51,"core MEM_WB_M io_MEMWB_rd_out_REG", false,-1, 4,0);
        tracep->declBus(c+52,"core MEM_WB_M io_MEMWB_dataMem_out_REG", false,-1, 31,0);
        tracep->declBus(c+53,"core MEM_WB_M io_MEMWB_alu_out_REG", false,-1, 31,0);
        tracep->declBit(c+173,"core PC clock", false,-1);
        tracep->declBit(c+174,"core PC reset", false,-1);
        tracep->declBus(c+54,"core PC io_in", false,-1, 31,0);
        tracep->declBus(c+55,"core PC io_out", false,-1, 31,0);
        tracep->declBus(c+55,"core PC PC", false,-1, 31,0);
        tracep->declBus(c+55,"core PC4 io_pc", false,-1, 31,0);
        tracep->declBus(c+56,"core PC4 io_out", false,-1, 31,0);
        tracep->declBit(c+173,"core InstMemory clock", false,-1);
        tracep->declBus(c+55,"core InstMemory io_addr", false,-1, 31,0);
        tracep->declBus(c+57,"core InstMemory io_data", false,-1, 31,0);
        tracep->declBus(c+57,"core InstMemory imem_io_data_MPORT_data", false,-1, 31,0);
        tracep->declBus(c+97,"core InstMemory imem_io_data_MPORT_addr", false,-1, 9,0);
        tracep->declBit(c+173,"core DataMemory clock", false,-1);
        tracep->declBit(c+40,"core DataMemory io_mem_write", false,-1);
        tracep->declBus(c+45,"core DataMemory io_addr", false,-1, 31,0);
        tracep->declBus(c+43,"core DataMemory io_dataIn", false,-1, 31,0);
        tracep->declBus(c+47,"core DataMemory io_dataOut", false,-1, 31,0);
        tracep->declBus(c+46,"core DataMemory io_fun3", false,-1, 2,0);
        tracep->declBit(c+39,"core DataMemory io_mem_read", false,-1);
        tracep->declBus(c+98,"core DataMemory memory_0_MPORT_1_data", false,-1, 7,0);
        tracep->declBus(c+99,"core DataMemory memory_0_MPORT_1_addr", false,-1, 9,0);
        tracep->declBus(c+100,"core DataMemory memory_0_MPORT_2_data", false,-1, 7,0);
        tracep->declBus(c+99,"core DataMemory memory_0_MPORT_2_addr", false,-1, 9,0);
        tracep->declBus(c+101,"core DataMemory memory_0_MPORT_data", false,-1, 7,0);
        tracep->declBus(c+99,"core DataMemory memory_0_MPORT_addr", false,-1, 9,0);
        tracep->declBit(c+40,"core DataMemory memory_0_MPORT_mask", false,-1);
        tracep->declBit(c+40,"core DataMemory memory_0_MPORT_en", false,-1);
        tracep->declBus(c+102,"core DataMemory memory_1_MPORT_1_data", false,-1, 7,0);
        tracep->declBus(c+99,"core DataMemory memory_1_MPORT_1_addr", false,-1, 9,0);
        tracep->declBus(c+103,"core DataMemory memory_1_MPORT_2_data", false,-1, 7,0);
        tracep->declBus(c+99,"core DataMemory memory_1_MPORT_2_addr", false,-1, 9,0);
        tracep->declBus(c+104,"core DataMemory memory_1_MPORT_data", false,-1, 7,0);
        tracep->declBus(c+99,"core DataMemory memory_1_MPORT_addr", false,-1, 9,0);
        tracep->declBit(c+176,"core DataMemory memory_1_MPORT_mask", false,-1);
        tracep->declBit(c+40,"core DataMemory memory_1_MPORT_en", false,-1);
        tracep->declBus(c+105,"core DataMemory memory_2_MPORT_1_data", false,-1, 7,0);
        tracep->declBus(c+99,"core DataMemory memory_2_MPORT_1_addr", false,-1, 9,0);
        tracep->declBus(c+106,"core DataMemory memory_2_MPORT_2_data", false,-1, 7,0);
        tracep->declBus(c+99,"core DataMemory memory_2_MPORT_2_addr", false,-1, 9,0);
        tracep->declBus(c+107,"core DataMemory memory_2_MPORT_data", false,-1, 7,0);
        tracep->declBus(c+99,"core DataMemory memory_2_MPORT_addr", false,-1, 9,0);
        tracep->declBit(c+176,"core DataMemory memory_2_MPORT_mask", false,-1);
        tracep->declBit(c+40,"core DataMemory memory_2_MPORT_en", false,-1);
        tracep->declBus(c+108,"core DataMemory memory_3_MPORT_1_data", false,-1, 7,0);
        tracep->declBus(c+99,"core DataMemory memory_3_MPORT_1_addr", false,-1, 9,0);
        tracep->declBus(c+109,"core DataMemory memory_3_MPORT_2_data", false,-1, 7,0);
        tracep->declBus(c+99,"core DataMemory memory_3_MPORT_2_addr", false,-1, 9,0);
        tracep->declBus(c+110,"core DataMemory memory_3_MPORT_data", false,-1, 7,0);
        tracep->declBus(c+99,"core DataMemory memory_3_MPORT_addr", false,-1, 9,0);
        tracep->declBit(c+176,"core DataMemory memory_3_MPORT_mask", false,-1);
        tracep->declBit(c+40,"core DataMemory memory_3_MPORT_en", false,-1);
        tracep->declBus(c+101,"core DataMemory data_0", false,-1, 7,0);
        tracep->declBus(c+111,"core DataMemory tempread_0", false,-1, 7,0);
        tracep->declBus(c+112,"core DataMemory io_dataOut_hi", false,-1, 23,0);
        tracep->declBus(c+113,"core DataMemory io_dataOut_lo", false,-1, 7,0);
        tracep->declBus(c+114,"core DataMemory tempread_1", false,-1, 7,0);
        tracep->declBus(c+115,"core DataMemory io_dataOut_hi_1", false,-1, 23,0);
        tracep->declBus(c+116,"core DataMemory io_dataOut_lo_1", false,-1, 7,0);
        tracep->declBus(c+117,"core DataMemory tempread_2", false,-1, 7,0);
        tracep->declBus(c+118,"core DataMemory io_dataOut_hi_2", false,-1, 23,0);
        tracep->declBus(c+119,"core DataMemory io_dataOut_lo_2", false,-1, 7,0);
        tracep->declBus(c+120,"core DataMemory tempread_3", false,-1, 7,0);
        tracep->declBus(c+121,"core DataMemory io_dataOut_hi_3", false,-1, 23,0);
        tracep->declBus(c+122,"core DataMemory io_dataOut_lo_3", false,-1, 7,0);
        tracep->declBus(c+123,"core DataMemory io_dataOut_hi_hi", false,-1, 15,0);
        tracep->declBus(c+124,"core DataMemory io_dataOut_hi_hi_1", false,-1, 15,0);
        tracep->declBus(c+125,"core DataMemory io_dataOut_hi_hi_2", false,-1, 15,0);
        tracep->declBus(c+58,"core control_module io_opcode", false,-1, 6,0);
        tracep->declBit(c+59,"core control_module io_mem_write", false,-1);
        tracep->declBit(c+60,"core control_module io_branch", false,-1);
        tracep->declBit(c+61,"core control_module io_mem_read", false,-1);
        tracep->declBit(c+62,"core control_module io_reg_write", false,-1);
        tracep->declBit(c+61,"core control_module io_men_to_reg", false,-1);
        tracep->declBus(c+63,"core control_module io_alu_operation", false,-1, 2,0);
        tracep->declBus(c+19,"core control_module io_operand_A", false,-1, 1,0);
        tracep->declBit(c+64,"core control_module io_operand_B", false,-1);
        tracep->declBus(c+65,"core control_module io_extend", false,-1, 1,0);
        tracep->declBus(c+66,"core control_module io_next_pc_sel", false,-1, 1,0);
        tracep->declBus(c+6,"core ImmGen io_instr", false,-1, 31,0);
        tracep->declBus(c+5,"core ImmGen io_pc", false,-1, 31,0);
        tracep->declBus(c+67,"core ImmGen io_I_type", false,-1, 31,0);
        tracep->declBus(c+68,"core ImmGen io_S_type", false,-1, 31,0);
        tracep->declBus(c+69,"core ImmGen io_SB_type", false,-1, 31,0);
        tracep->declBus(c+70,"core ImmGen io_U_type", false,-1, 31,0);
        tracep->declBus(c+71,"core ImmGen io_UJ_type", false,-1, 31,0);
        tracep->declBus(c+126,"core ImmGen io_I_type_hi", false,-1, 19,0);
        tracep->declBus(c+127,"core ImmGen io_I_type_lo", false,-1, 11,0);
        tracep->declBus(c+128,"core ImmGen io_S_type_hi_lo", false,-1, 6,0);
        tracep->declBus(c+12,"core ImmGen io_S_type_lo", false,-1, 4,0);
        tracep->declBus(c+129,"core ImmGen sbImm_hi_hi_hi", false,-1, 18,0);
        tracep->declBit(c+130,"core ImmGen sbImm_hi_lo", false,-1);
        tracep->declBus(c+131,"core ImmGen sbImm_lo_hi_hi", false,-1, 5,0);
        tracep->declBus(c+132,"core ImmGen sbImm_lo_hi_lo", false,-1, 3,0);
        tracep->declBus(c+133,"core ImmGen sbImm", false,-1, 31,0);
        tracep->declBus(c+134,"core ImmGen io_U_type_hi", false,-1, 19,0);
        tracep->declBus(c+135,"core ImmGen ujImm_hi_hi_hi", false,-1, 10,0);
        tracep->declBus(c+136,"core ImmGen ujImm_hi_lo", false,-1, 7,0);
        tracep->declBit(c+137,"core ImmGen ujImm_lo_hi_hi", false,-1);
        tracep->declBus(c+138,"core ImmGen ujImm_lo_hi_lo", false,-1, 9,0);
        tracep->declBus(c+139,"core ImmGen ujImm", false,-1, 31,0);
        tracep->declBit(c+173,"core RegFile clock", false,-1);
        tracep->declBit(c+174,"core RegFile reset", false,-1);
        tracep->declBus(c+7,"core RegFile io_rs1", false,-1, 4,0);
        tracep->declBus(c+8,"core RegFile io_rs2", false,-1, 4,0);
        tracep->declBit(c+49,"core RegFile io_reg_write", false,-1);
        tracep->declBus(c+51,"core RegFile io_w_reg", false,-1, 4,0);
        tracep->declBus(c+72,"core RegFile io_w_data", false,-1, 31,0);
        tracep->declBus(c+73,"core RegFile io_rdata1", false,-1, 31,0);
        tracep->declBus(c+74,"core RegFile io_rdata2", false,-1, 31,0);
        tracep->declBus(c+140,"core RegFile regfile_0", false,-1, 31,0);
        tracep->declBus(c+141,"core RegFile regfile_1", false,-1, 31,0);
        tracep->declBus(c+142,"core RegFile regfile_2", false,-1, 31,0);
        tracep->declBus(c+143,"core RegFile regfile_3", false,-1, 31,0);
        tracep->declBus(c+144,"core RegFile regfile_4", false,-1, 31,0);
        tracep->declBus(c+145,"core RegFile regfile_5", false,-1, 31,0);
        tracep->declBus(c+146,"core RegFile regfile_6", false,-1, 31,0);
        tracep->declBus(c+147,"core RegFile regfile_7", false,-1, 31,0);
        tracep->declBus(c+148,"core RegFile regfile_8", false,-1, 31,0);
        tracep->declBus(c+149,"core RegFile regfile_9", false,-1, 31,0);
        tracep->declBus(c+150,"core RegFile regfile_10", false,-1, 31,0);
        tracep->declBus(c+151,"core RegFile regfile_11", false,-1, 31,0);
        tracep->declBus(c+152,"core RegFile regfile_12", false,-1, 31,0);
        tracep->declBus(c+153,"core RegFile regfile_13", false,-1, 31,0);
        tracep->declBus(c+154,"core RegFile regfile_14", false,-1, 31,0);
        tracep->declBus(c+155,"core RegFile regfile_15", false,-1, 31,0);
        tracep->declBus(c+156,"core RegFile regfile_16", false,-1, 31,0);
        tracep->declBus(c+157,"core RegFile regfile_17", false,-1, 31,0);
        tracep->declBus(c+158,"core RegFile regfile_18", false,-1, 31,0);
        tracep->declBus(c+159,"core RegFile regfile_19", false,-1, 31,0);
        tracep->declBus(c+160,"core RegFile regfile_20", false,-1, 31,0);
        tracep->declBus(c+161,"core RegFile regfile_21", false,-1, 31,0);
        tracep->declBus(c+162,"core RegFile regfile_22", false,-1, 31,0);
        tracep->declBus(c+163,"core RegFile regfile_23", false,-1, 31,0);
        tracep->declBus(c+164,"core RegFile regfile_24", false,-1, 31,0);
        tracep->declBus(c+165,"core RegFile regfile_25", false,-1, 31,0);
        tracep->declBus(c+166,"core RegFile regfile_26", false,-1, 31,0);
        tracep->declBus(c+167,"core RegFile regfile_27", false,-1, 31,0);
        tracep->declBus(c+168,"core RegFile regfile_28", false,-1, 31,0);
        tracep->declBus(c+169,"core RegFile regfile_29", false,-1, 31,0);
        tracep->declBus(c+170,"core RegFile regfile_30", false,-1, 31,0);
        tracep->declBus(c+171,"core RegFile regfile_31", false,-1, 31,0);
        tracep->declBus(c+27,"core ALU_Control io_func3", false,-1, 2,0);
        tracep->declBit(c+28,"core ALU_Control io_func7", false,-1);
        tracep->declBus(c+33,"core ALU_Control io_aluOp", false,-1, 2,0);
        tracep->declBus(c+75,"core ALU_Control io_out", false,-1, 4,0);
        tracep->declBus(c+76,"core ALU io_in_A", false,-1, 31,0);
        tracep->declBus(c+77,"core ALU io_in_B", false,-1, 31,0);
        tracep->declBus(c+75,"core ALU io_alu_Op", false,-1, 4,0);
        tracep->declBus(c+38,"core ALU io_out", false,-1, 31,0);
        tracep->declBus(c+13,"core Branch_M io_fnct3", false,-1, 2,0);
        tracep->declBit(c+60,"core Branch_M io_branch", false,-1);
        tracep->declBus(c+78,"core Branch_M io_arg_x", false,-1, 31,0);
        tracep->declBus(c+79,"core Branch_M io_arg_y", false,-1, 31,0);
        tracep->declBit(c+80,"core Branch_M io_br_taken", false,-1);
        tracep->declBus(c+11,"core JALR io_imme", false,-1, 31,0);
        tracep->declBus(c+81,"core JALR io_rdata1", false,-1, 31,0);
        tracep->declBus(c+82,"core JALR io_out", false,-1, 31,0);
        tracep->declBus(c+172,"core JALR computedAddr", false,-1, 31,0);
        tracep->declBus(c+21,"core Forwarding io_IDEX_rs1", false,-1, 4,0);
        tracep->declBus(c+22,"core Forwarding io_IDEX_rs2", false,-1, 4,0);
        tracep->declBus(c+44,"core Forwarding io_EXMEM_rd", false,-1, 4,0);
        tracep->declBit(c+42,"core Forwarding io_EXMEM_regWr", false,-1);
        tracep->declBus(c+51,"core Forwarding io_MEMWB_rd", false,-1, 4,0);
        tracep->declBit(c+49,"core Forwarding io_MEMWB_regWr", false,-1);
        tracep->declBus(c+83,"core Forwarding io_forward_a", false,-1, 1,0);
        tracep->declBus(c+84,"core Forwarding io_forward_b", false,-1, 1,0);
        tracep->declBus(c+6,"core HazardDetect io_IF_ID_inst", false,-1, 31,0);
        tracep->declBit(c+30,"core HazardDetect io_ID_EX_memRead", false,-1);
        tracep->declBus(c+25,"core HazardDetect io_ID_EX_rd", false,-1, 4,0);
        tracep->declBus(c+4,"core HazardDetect io_pc_in", false,-1, 31,0);
        tracep->declBus(c+5,"core HazardDetect io_current_pc", false,-1, 31,0);
        tracep->declBit(c+85,"core HazardDetect io_inst_forward", false,-1);
        tracep->declBit(c+86,"core HazardDetect io_pc_forward", false,-1);
        tracep->declBit(c+87,"core HazardDetect io_ctrl_forward", false,-1);
        tracep->declBus(c+6,"core HazardDetect io_inst_out", false,-1, 31,0);
        tracep->declBus(c+4,"core HazardDetect io_pc_out", false,-1, 31,0);
        tracep->declBus(c+5,"core HazardDetect io_current_pc_out", false,-1, 31,0);
        tracep->declBus(c+88,"core HazardDetect Rs1", false,-1, 4,0);
        tracep->declBus(c+89,"core HazardDetect Rs2", false,-1, 4,0);
        tracep->declBus(c+25,"core Branch_Forward io_ID_EX_RD", false,-1, 4,0);
        tracep->declBus(c+44,"core Branch_Forward io_EX_MEM_RD", false,-1, 4,0);
        tracep->declBus(c+51,"core Branch_Forward io_MEM_WB_RD", false,-1, 4,0);
        tracep->declBit(c+30,"core Branch_Forward io_ID_EX_memRd", false,-1);
        tracep->declBit(c+39,"core Branch_Forward io_EX_MEM_memRd", false,-1);
        tracep->declBit(c+50,"core Branch_Forward io_MEM_WB_memRd", false,-1);
        tracep->declBus(c+88,"core Branch_Forward io_rs1", false,-1, 4,0);
        tracep->declBus(c+89,"core Branch_Forward io_rs2", false,-1, 4,0);
        tracep->declBit(c+60,"core Branch_Forward io_ctrl_branch", false,-1);
        tracep->declBus(c+90,"core Branch_Forward io_forward_rs1", false,-1, 3,0);
        tracep->declBus(c+91,"core Branch_Forward io_forward_rs2", false,-1, 3,0);
        tracep->declBus(c+88,"core Structural io_rs1", false,-1, 4,0);
        tracep->declBus(c+89,"core Structural io_rs2", false,-1, 4,0);
        tracep->declBit(c+42,"core Structural io_MEM_WB_regWr", false,-1);
        tracep->declBus(c+51,"core Structural io_MEM_WB_Rd", false,-1, 4,0);
        tracep->declBit(c+92,"core Structural io_fwd_rs1", false,-1);
        tracep->declBit(c+93,"core Structural io_fwd_rs2", false,-1);
    }
}

void Vcore::traceRegister(VerilatedVcd* tracep) {
    // Body
    {
        tracep->addFullCb(&traceFullTop0, __VlSymsp);
        tracep->addChgCb(&traceChgTop0, __VlSymsp);
        tracep->addCleanupCb(&traceCleanup, __VlSymsp);
    }
}

void Vcore::traceFullTop0(void* userp, VerilatedVcd* tracep) {
    Vcore__Syms* __restrict vlSymsp = static_cast<Vcore__Syms*>(userp);
    Vcore* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    {
        vlTOPp->traceFullSub0(userp, tracep);
    }
}

void Vcore::traceFullSub0(void* userp, VerilatedVcd* tracep) {
    Vcore__Syms* __restrict vlSymsp = static_cast<Vcore__Syms*>(userp);
    Vcore* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    vluint32_t* const oldp = tracep->oldp(vlSymsp->__Vm_baseCode);
    if (false && oldp) {}  // Prevent unused
    // Body
    {
        tracep->fullIData(oldp+1,(((IData)(vlTOPp->core__DOT__HazardDetect_io_pc_forward)
                                    ? ((IData)(4U) 
                                       + vlTOPp->core__DOT__PC__DOT__PC)
                                    : ((1U == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                        ? (((IData)(vlTOPp->core__DOT__Branch_M_io_br_taken) 
                                            & (IData)(vlTOPp->core__DOT__control_module_io_branch))
                                            ? 0U : 
                                           ((IData)(4U) 
                                            + vlTOPp->core__DOT__PC__DOT__PC))
                                        : ((2U == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                            ? 0U : 
                                           ((3U == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                             ? 0U : 
                                            ((IData)(4U) 
                                             + vlTOPp->core__DOT__PC__DOT__PC)))))),32);
        tracep->fullIData(oldp+2,(((IData)(vlTOPp->core__DOT__HazardDetect_io_pc_forward)
                                    ? vlTOPp->core__DOT__PC_for
                                    : ((1U == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                        ? (((IData)(vlTOPp->core__DOT__Branch_M_io_br_taken) 
                                            & (IData)(vlTOPp->core__DOT__control_module_io_branch))
                                            ? 0U : vlTOPp->core__DOT__PC_for)
                                        : ((2U == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                            ? 0U : 
                                           ((3U == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                             ? 0U : vlTOPp->core__DOT__PC_for))))),32);
        tracep->fullIData(oldp+3,(((IData)(vlTOPp->core__DOT__HazardDetect_io_pc_forward)
                                    ? vlTOPp->core__DOT__Instruction_F
                                    : ((1U == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                        ? (((IData)(vlTOPp->core__DOT__Branch_M_io_br_taken) 
                                            & (IData)(vlTOPp->core__DOT__control_module_io_branch))
                                            ? 0U : vlTOPp->core__DOT__Instruction_F)
                                        : ((2U == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                            ? 0U : 
                                           ((3U == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                             ? 0U : vlTOPp->core__DOT__Instruction_F))))),32);
        tracep->fullIData(oldp+4,(vlTOPp->core__DOT__IF_ID___DOT__Pc4_In),32);
        tracep->fullIData(oldp+5,(vlTOPp->core__DOT__IF_ID___DOT__S_pc),32);
        tracep->fullIData(oldp+6,(vlTOPp->core__DOT__IF_ID___DOT__S_instr),32);
        tracep->fullCData(oldp+7,(vlTOPp->core__DOT__RegFile_io_rs1),5);
        tracep->fullCData(oldp+8,(vlTOPp->core__DOT__RegFile_io_rs2),5);
        tracep->fullIData(oldp+9,(((IData)(vlTOPp->core__DOT__Structural_io_fwd_rs1)
                                    ? ((IData)(vlTOPp->core__DOT__Structural_io_fwd_rs1)
                                        ? vlTOPp->core__DOT__RegFile_io_w_data
                                        : 0U) : vlTOPp->core__DOT__RegFile_io_rdata1)),32);
        tracep->fullIData(oldp+10,(((IData)(vlTOPp->core__DOT__Structural_io_fwd_rs2)
                                     ? ((IData)(vlTOPp->core__DOT__Structural_io_fwd_rs2)
                                         ? vlTOPp->core__DOT__RegFile_io_w_data
                                         : 0U) : vlTOPp->core__DOT__RegFile_io_rdata2)),32);
        tracep->fullIData(oldp+11,(((0U == (IData)(vlTOPp->core__DOT__control_module_io_extend))
                                     ? vlTOPp->core__DOT__ImmGen_io_I_type
                                     : vlTOPp->core__DOT___GEN_9)),32);
        tracep->fullCData(oldp+12,((0x1fU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                             >> 7U))),5);
        tracep->fullCData(oldp+13,((7U & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                          >> 0xcU))),3);
        tracep->fullBit(oldp+14,((1U & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                        >> 0x1eU))));
        tracep->fullBit(oldp+15,(((~ (IData)(vlTOPp->core__DOT__HazardDetect_io_ctrl_forward)) 
                                  & ((0x33U != (0x7fU 
                                                & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                     & ((0x13U != (0x7fU 
                                                   & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                        & (0x23U == 
                                           (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr)))))));
        tracep->fullBit(oldp+16,(((~ (IData)(vlTOPp->core__DOT__HazardDetect_io_ctrl_forward)) 
                                  & ((0x33U != (0x7fU 
                                                & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                     & (IData)(vlTOPp->core__DOT__control_module__DOT___GEN_51)))));
        tracep->fullBit(oldp+17,(((~ (IData)(vlTOPp->core__DOT__HazardDetect_io_ctrl_forward)) 
                                  & ((0x33U == (0x7fU 
                                                & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                     | ((0x13U == (0x7fU 
                                                   & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                        | ((0x23U != 
                                            (0x7fU 
                                             & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                           & ((3U == 
                                               (0x7fU 
                                                & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                              | ((0x63U 
                                                  != 
                                                  (0x7fU 
                                                   & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                                 & ((0x6fU 
                                                     == 
                                                     (0x7fU 
                                                      & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                                    | ((0x67U 
                                                        == 
                                                        (0x7fU 
                                                         & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                                       | (IData)(vlTOPp->core__DOT__control_module__DOT___GEN_5)))))))))));
        tracep->fullCData(oldp+18,(((IData)(vlTOPp->core__DOT__HazardDetect_io_ctrl_forward)
                                     ? 0U : ((0x33U 
                                              == (0x7fU 
                                                  & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                              ? 0U : 
                                             ((0x13U 
                                               == (0x7fU 
                                                   & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                               ? 1U
                                               : ((0x23U 
                                                   == 
                                                   (0x7fU 
                                                    & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                   ? 5U
                                                   : 
                                                  ((3U 
                                                    == 
                                                    (0x7fU 
                                                     & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                    ? 4U
                                                    : 
                                                   ((0x63U 
                                                     == 
                                                     (0x7fU 
                                                      & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                     ? 2U
                                                     : 
                                                    ((0x6fU 
                                                      == 
                                                      (0x7fU 
                                                       & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                      ? 3U
                                                      : 
                                                     ((0x67U 
                                                       == 
                                                       (0x7fU 
                                                        & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                       ? 3U
                                                       : 
                                                      ((0x37U 
                                                        == 
                                                        (0x7fU 
                                                         & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                        ? 6U
                                                        : 
                                                       ((0x17U 
                                                         == 
                                                         (0x7fU 
                                                          & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                         ? 7U
                                                         : 0U))))))))))),3);
        tracep->fullCData(oldp+19,(((0x33U == (0x7fU 
                                               & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                     ? 0U : ((0x13U 
                                              == (0x7fU 
                                                  & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                              ? 0U : 
                                             ((0x23U 
                                               == (0x7fU 
                                                   & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                               ? 0U
                                               : ((3U 
                                                   == 
                                                   (0x7fU 
                                                    & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                   ? 0U
                                                   : 
                                                  ((0x63U 
                                                    == 
                                                    (0x7fU 
                                                     & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                    ? 0U
                                                    : 
                                                   ((0x6fU 
                                                     == 
                                                     (0x7fU 
                                                      & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                     ? 1U
                                                     : 
                                                    ((0x67U 
                                                      == 
                                                      (0x7fU 
                                                       & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                      ? 1U
                                                      : 
                                                     ((0x37U 
                                                       == 
                                                       (0x7fU 
                                                        & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                       ? 3U
                                                       : 
                                                      ((0x17U 
                                                        == 
                                                        (0x7fU 
                                                         & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                        ? 2U
                                                        : 0U)))))))))),2);
        tracep->fullBit(oldp+20,(((~ (IData)(vlTOPp->core__DOT__HazardDetect_io_ctrl_forward)) 
                                  & ((0x33U != (0x7fU 
                                                & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                     & ((0x13U == (0x7fU 
                                                   & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                        | ((0x23U == 
                                            (0x7fU 
                                             & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                           | ((3U == 
                                               (0x7fU 
                                                & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                              | ((0x63U 
                                                  != 
                                                  (0x7fU 
                                                   & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                                 & ((0x6fU 
                                                     != 
                                                     (0x7fU 
                                                      & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                                    & ((0x67U 
                                                        != 
                                                        (0x7fU 
                                                         & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                                       & (IData)(vlTOPp->core__DOT__control_module__DOT___GEN_5)))))))))));
        tracep->fullCData(oldp+21,(vlTOPp->core__DOT__ID_EX___DOT__io_rs1_out_REG),5);
        tracep->fullCData(oldp+22,(vlTOPp->core__DOT__ID_EX___DOT__io_rs2_out_REG),5);
        tracep->fullIData(oldp+23,(vlTOPp->core__DOT__ID_EX___DOT__io_rs1_data_out_REG),32);
        tracep->fullIData(oldp+24,(vlTOPp->core__DOT__ID_EX___DOT__io_rs2_data_out_REG),32);
        tracep->fullCData(oldp+25,(vlTOPp->core__DOT__ID_EX___DOT__io_rd_out_REG),5);
        tracep->fullIData(oldp+26,(vlTOPp->core__DOT__ID_EX___DOT__io_imm_out_REG),32);
        tracep->fullCData(oldp+27,(vlTOPp->core__DOT__ID_EX___DOT__io_func3_out_REG),3);
        tracep->fullBit(oldp+28,(vlTOPp->core__DOT__ID_EX___DOT__io_func7_out_REG));
        tracep->fullBit(oldp+29,(vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_MemWr_out_REG));
        tracep->fullBit(oldp+30,(vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_MemRd_out_REG));
        tracep->fullBit(oldp+31,(vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_Reg_W_out_REG));
        tracep->fullBit(oldp+32,(vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_MemToReg_out_REG));
        tracep->fullCData(oldp+33,(vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_AluOp_out_REG),3);
        tracep->fullCData(oldp+34,(vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_OpA_out_REG),2);
        tracep->fullBit(oldp+35,(vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_OpB_out_REG));
        tracep->fullIData(oldp+36,(vlTOPp->core__DOT__ID_EX___DOT__io_IFID_pc4_out_REG),32);
        tracep->fullIData(oldp+37,(((0U == (IData)(vlTOPp->core__DOT__Forwarding_io_forward_b))
                                     ? vlTOPp->core__DOT__ID_EX___DOT__io_rs2_data_out_REG
                                     : vlTOPp->core__DOT___GEN_53)),32);
        tracep->fullIData(oldp+38,((IData)(vlTOPp->core__DOT__ALU__DOT___GEN_10)),32);
        tracep->fullBit(oldp+39,(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memRd_out_REG));
        tracep->fullBit(oldp+40,(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memWr_out_REG));
        tracep->fullBit(oldp+41,(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memToReg_out_REG));
        tracep->fullBit(oldp+42,(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_reg_w_out_REG));
        tracep->fullIData(oldp+43,(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rs2_out_REG),32);
        tracep->fullCData(oldp+44,(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rd_out_REG),5);
        tracep->fullIData(oldp+45,(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG),32);
        tracep->fullCData(oldp+46,(vlTOPp->core__DOT__EX_MEM_M__DOT__io_fun3out_REG),3);
        tracep->fullIData(oldp+47,(vlTOPp->core__DOT__DataMemory_io_dataOut),32);
        tracep->fullBit(oldp+48,(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_memToReg_out_REG));
        tracep->fullBit(oldp+49,(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG));
        tracep->fullBit(oldp+50,(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_memRd_out_REG));
        tracep->fullCData(oldp+51,(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG),5);
        tracep->fullIData(oldp+52,(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_dataMem_out_REG),32);
        tracep->fullIData(oldp+53,(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_alu_out_REG),32);
        tracep->fullIData(oldp+54,(((IData)(vlTOPp->core__DOT__HazardDetect_io_pc_forward)
                                     ? vlTOPp->core__DOT__IF_ID___DOT__Pc4_In
                                     : ((1U == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                         ? (((IData)(vlTOPp->core__DOT__Branch_M_io_br_taken) 
                                             & (IData)(vlTOPp->core__DOT__control_module_io_branch))
                                             ? ((((
                                                   (0x80000000U 
                                                    & vlTOPp->core__DOT__IF_ID___DOT__S_instr)
                                                    ? 0x7ffffU
                                                    : 0U) 
                                                  << 0xdU) 
                                                 | ((0x1000U 
                                                     & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                        >> 0x13U)) 
                                                    | ((0x800U 
                                                        & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                           << 4U)) 
                                                       | ((0x7e0U 
                                                           & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                              >> 0x14U)) 
                                                          | (0x1eU 
                                                             & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                                >> 7U)))))) 
                                                + vlTOPp->core__DOT__IF_ID___DOT__S_pc)
                                             : ((IData)(4U) 
                                                + vlTOPp->core__DOT__PC__DOT__PC))
                                         : ((2U == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                             ? ((((
                                                   (0x80000000U 
                                                    & vlTOPp->core__DOT__IF_ID___DOT__S_instr)
                                                    ? 0x7ffU
                                                    : 0U) 
                                                  << 0x15U) 
                                                 | ((0x100000U 
                                                     & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                        >> 0xbU)) 
                                                    | ((0xff000U 
                                                        & vlTOPp->core__DOT__IF_ID___DOT__S_instr) 
                                                       | ((0x800U 
                                                           & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                              >> 9U)) 
                                                          | (0x7feU 
                                                             & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                                >> 0x14U)))))) 
                                                + vlTOPp->core__DOT__IF_ID___DOT__S_pc)
                                             : ((3U 
                                                 == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                                 ? 
                                                (0xfffffffeU 
                                                 & (((0U 
                                                      == (IData)(vlTOPp->core__DOT__control_module_io_extend))
                                                      ? vlTOPp->core__DOT__ImmGen_io_I_type
                                                      : vlTOPp->core__DOT___GEN_9) 
                                                    + 
                                                    ((0xaU 
                                                      == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                      ? vlTOPp->core__DOT__RegFile_io_w_data
                                                      : 
                                                     ((9U 
                                                       == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                       ? vlTOPp->core__DOT__DataMemory_io_dataOut
                                                       : 
                                                      ((8U 
                                                        == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                        ? vlTOPp->core__DOT__RegFile_io_w_data
                                                        : 
                                                       ((7U 
                                                         == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                         ? vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG
                                                         : 
                                                        ((6U 
                                                          == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                          ? (IData)(vlTOPp->core__DOT__ALU__DOT___GEN_10)
                                                          : 
                                                         ((5U 
                                                           == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                           ? vlTOPp->core__DOT__RegFile_io_rdata1
                                                           : 
                                                          ((4U 
                                                            == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                            ? vlTOPp->core__DOT__RegFile_io_rdata1
                                                            : 
                                                           ((3U 
                                                             == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                             ? vlTOPp->core__DOT__RegFile_io_rdata1
                                                             : 
                                                            ((2U 
                                                              == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                              ? vlTOPp->core__DOT__RegFile_io_rdata1
                                                              : 
                                                             ((1U 
                                                               == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                               ? vlTOPp->core__DOT__RegFile_io_rdata1
                                                               : 
                                                              ((0U 
                                                                == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                                ? vlTOPp->core__DOT__RegFile_io_rdata1
                                                                : 0U)))))))))))))
                                                 : 
                                                ((IData)(4U) 
                                                 + vlTOPp->core__DOT__PC__DOT__PC)))))),32);
        tracep->fullIData(oldp+55,(vlTOPp->core__DOT__PC__DOT__PC),32);
        tracep->fullIData(oldp+56,(((IData)(4U) + vlTOPp->core__DOT__PC__DOT__PC)),32);
        tracep->fullIData(oldp+57,(vlTOPp->core__DOT__InstMemory__DOT__imem
                                   [(0x3ffU & (vlTOPp->core__DOT__PC__DOT__PC 
                                               >> 2U))]),32);
        tracep->fullCData(oldp+58,((0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr)),7);
        tracep->fullBit(oldp+59,(((0x33U != (0x7fU 
                                             & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                  & ((0x13U != (0x7fU 
                                                & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                     & (0x23U == (0x7fU 
                                                  & vlTOPp->core__DOT__IF_ID___DOT__S_instr))))));
        tracep->fullBit(oldp+60,(vlTOPp->core__DOT__control_module_io_branch));
        tracep->fullBit(oldp+61,(((0x33U != (0x7fU 
                                             & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                  & (IData)(vlTOPp->core__DOT__control_module__DOT___GEN_51))));
        tracep->fullBit(oldp+62,(((0x33U == (0x7fU 
                                             & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                  | ((0x13U == (0x7fU 
                                                & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                     | ((0x23U != (0x7fU 
                                                   & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                        & ((3U == (0x7fU 
                                                   & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                           | ((0x63U 
                                               != (0x7fU 
                                                   & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                              & ((0x6fU 
                                                  == 
                                                  (0x7fU 
                                                   & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                                 | ((0x67U 
                                                     == 
                                                     (0x7fU 
                                                      & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                                    | (IData)(vlTOPp->core__DOT__control_module__DOT___GEN_5))))))))));
        tracep->fullCData(oldp+63,(((0x33U == (0x7fU 
                                               & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                     ? 0U : ((0x13U 
                                              == (0x7fU 
                                                  & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                              ? 1U : 
                                             ((0x23U 
                                               == (0x7fU 
                                                   & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                               ? 5U
                                               : ((3U 
                                                   == 
                                                   (0x7fU 
                                                    & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                   ? 4U
                                                   : 
                                                  ((0x63U 
                                                    == 
                                                    (0x7fU 
                                                     & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                    ? 2U
                                                    : 
                                                   ((0x6fU 
                                                     == 
                                                     (0x7fU 
                                                      & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                     ? 3U
                                                     : 
                                                    ((0x67U 
                                                      == 
                                                      (0x7fU 
                                                       & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                      ? 3U
                                                      : 
                                                     ((0x37U 
                                                       == 
                                                       (0x7fU 
                                                        & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                       ? 6U
                                                       : 
                                                      ((0x17U 
                                                        == 
                                                        (0x7fU 
                                                         & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                        ? 7U
                                                        : 0U)))))))))),3);
        tracep->fullBit(oldp+64,(((0x33U != (0x7fU 
                                             & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                  & ((0x13U == (0x7fU 
                                                & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                     | ((0x23U == (0x7fU 
                                                   & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                        | ((3U == (0x7fU 
                                                   & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                           | ((0x63U 
                                               != (0x7fU 
                                                   & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                              & ((0x6fU 
                                                  != 
                                                  (0x7fU 
                                                   & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                                 & ((0x67U 
                                                     != 
                                                     (0x7fU 
                                                      & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                                    & (IData)(vlTOPp->core__DOT__control_module__DOT___GEN_5))))))))));
        tracep->fullCData(oldp+65,(vlTOPp->core__DOT__control_module_io_extend),2);
        tracep->fullCData(oldp+66,(vlTOPp->core__DOT__control_module_io_next_pc_sel),2);
        tracep->fullIData(oldp+67,(vlTOPp->core__DOT__ImmGen_io_I_type),32);
        tracep->fullIData(oldp+68,(((((0x80000000U 
                                       & vlTOPp->core__DOT__IF_ID___DOT__S_instr)
                                       ? 0xfffffU : 0U) 
                                     << 0xcU) | ((0xfe0U 
                                                  & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                     >> 0x14U)) 
                                                 | (0x1fU 
                                                    & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                       >> 7U))))),32);
        tracep->fullIData(oldp+69,((((((0x80000000U 
                                        & vlTOPp->core__DOT__IF_ID___DOT__S_instr)
                                        ? 0x7ffffU : 0U) 
                                      << 0xdU) | ((0x1000U 
                                                   & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                      >> 0x13U)) 
                                                  | ((0x800U 
                                                      & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                         << 4U)) 
                                                     | ((0x7e0U 
                                                         & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                            >> 0x14U)) 
                                                        | (0x1eU 
                                                           & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                              >> 7U)))))) 
                                    + vlTOPp->core__DOT__IF_ID___DOT__S_pc)),32);
        tracep->fullIData(oldp+70,((0xfffff000U & vlTOPp->core__DOT__IF_ID___DOT__S_instr)),32);
        tracep->fullIData(oldp+71,((((((0x80000000U 
                                        & vlTOPp->core__DOT__IF_ID___DOT__S_instr)
                                        ? 0x7ffU : 0U) 
                                      << 0x15U) | (
                                                   (0x100000U 
                                                    & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                       >> 0xbU)) 
                                                   | ((0xff000U 
                                                       & vlTOPp->core__DOT__IF_ID___DOT__S_instr) 
                                                      | ((0x800U 
                                                          & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                             >> 9U)) 
                                                         | (0x7feU 
                                                            & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                               >> 0x14U)))))) 
                                    + vlTOPp->core__DOT__IF_ID___DOT__S_pc)),32);
        tracep->fullIData(oldp+72,(vlTOPp->core__DOT__RegFile_io_w_data),32);
        tracep->fullIData(oldp+73,(vlTOPp->core__DOT__RegFile_io_rdata1),32);
        tracep->fullIData(oldp+74,(vlTOPp->core__DOT__RegFile_io_rdata2),32);
        tracep->fullCData(oldp+75,((0x1fU & (IData)(vlTOPp->core__DOT__ALU_Control__DOT___GEN_4))),5);
        tracep->fullIData(oldp+76,(vlTOPp->core__DOT__ALU_io_in_A),32);
        tracep->fullIData(oldp+77,(vlTOPp->core__DOT__ALU_io_in_B),32);
        tracep->fullIData(oldp+78,(vlTOPp->core__DOT__Branch_M_io_arg_x),32);
        tracep->fullIData(oldp+79,(vlTOPp->core__DOT___Branch_M_io_arg_y_T_7),32);
        tracep->fullBit(oldp+80,(vlTOPp->core__DOT__Branch_M_io_br_taken));
        tracep->fullIData(oldp+81,(((0xaU == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                     ? vlTOPp->core__DOT__RegFile_io_w_data
                                     : ((9U == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                         ? vlTOPp->core__DOT__DataMemory_io_dataOut
                                         : ((8U == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                             ? vlTOPp->core__DOT__RegFile_io_w_data
                                             : ((7U 
                                                 == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                 ? vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG
                                                 : 
                                                ((6U 
                                                  == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                  ? (IData)(vlTOPp->core__DOT__ALU__DOT___GEN_10)
                                                  : 
                                                 ((5U 
                                                   == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                   ? vlTOPp->core__DOT__RegFile_io_rdata1
                                                   : 
                                                  ((4U 
                                                    == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                    ? vlTOPp->core__DOT__RegFile_io_rdata1
                                                    : 
                                                   ((3U 
                                                     == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                     ? vlTOPp->core__DOT__RegFile_io_rdata1
                                                     : 
                                                    ((2U 
                                                      == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                      ? vlTOPp->core__DOT__RegFile_io_rdata1
                                                      : 
                                                     ((1U 
                                                       == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                       ? vlTOPp->core__DOT__RegFile_io_rdata1
                                                       : 
                                                      ((0U 
                                                        == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                        ? vlTOPp->core__DOT__RegFile_io_rdata1
                                                        : 0U)))))))))))),32);
        tracep->fullIData(oldp+82,((0xfffffffeU & (
                                                   ((0U 
                                                     == (IData)(vlTOPp->core__DOT__control_module_io_extend))
                                                     ? vlTOPp->core__DOT__ImmGen_io_I_type
                                                     : vlTOPp->core__DOT___GEN_9) 
                                                   + 
                                                   ((0xaU 
                                                     == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                     ? vlTOPp->core__DOT__RegFile_io_w_data
                                                     : 
                                                    ((9U 
                                                      == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                      ? vlTOPp->core__DOT__DataMemory_io_dataOut
                                                      : 
                                                     ((8U 
                                                       == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                       ? vlTOPp->core__DOT__RegFile_io_w_data
                                                       : 
                                                      ((7U 
                                                        == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                        ? vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG
                                                        : 
                                                       ((6U 
                                                         == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                         ? (IData)(vlTOPp->core__DOT__ALU__DOT___GEN_10)
                                                         : 
                                                        ((5U 
                                                          == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                          ? vlTOPp->core__DOT__RegFile_io_rdata1
                                                          : 
                                                         ((4U 
                                                           == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                           ? vlTOPp->core__DOT__RegFile_io_rdata1
                                                           : 
                                                          ((3U 
                                                            == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                            ? vlTOPp->core__DOT__RegFile_io_rdata1
                                                            : 
                                                           ((2U 
                                                             == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                             ? vlTOPp->core__DOT__RegFile_io_rdata1
                                                             : 
                                                            ((1U 
                                                              == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                              ? vlTOPp->core__DOT__RegFile_io_rdata1
                                                              : 
                                                             ((0U 
                                                               == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                               ? vlTOPp->core__DOT__RegFile_io_rdata1
                                                               : 0U)))))))))))))),32);
        tracep->fullCData(oldp+83,(vlTOPp->core__DOT__Forwarding_io_forward_a),2);
        tracep->fullCData(oldp+84,(vlTOPp->core__DOT__Forwarding_io_forward_b),2);
        tracep->fullBit(oldp+85,(vlTOPp->core__DOT__HazardDetect_io_inst_forward));
        tracep->fullBit(oldp+86,(vlTOPp->core__DOT__HazardDetect_io_pc_forward));
        tracep->fullBit(oldp+87,(vlTOPp->core__DOT__HazardDetect_io_ctrl_forward));
        tracep->fullCData(oldp+88,((0x1fU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                             >> 0xfU))),5);
        tracep->fullCData(oldp+89,((0x1fU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                             >> 0x14U))),5);
        tracep->fullCData(oldp+90,(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1),4);
        tracep->fullCData(oldp+91,(vlTOPp->core__DOT__Branch_Forward__DOT___GEN_28),4);
        tracep->fullBit(oldp+92,(vlTOPp->core__DOT__Structural_io_fwd_rs1));
        tracep->fullBit(oldp+93,(vlTOPp->core__DOT__Structural_io_fwd_rs2));
        tracep->fullIData(oldp+94,(vlTOPp->core__DOT__PC_for),32);
        tracep->fullIData(oldp+95,(vlTOPp->core__DOT__Instruction_F),32);
        tracep->fullIData(oldp+96,(vlTOPp->core__DOT__d),32);
        tracep->fullSData(oldp+97,((0x3ffU & (vlTOPp->core__DOT__PC__DOT__PC 
                                              >> 2U))),10);
        tracep->fullCData(oldp+98,(vlTOPp->core__DOT__DataMemory__DOT__memory_0_MPORT_1_data),8);
        tracep->fullSData(oldp+99,((0x3ffU & (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG 
                                              >> 2U))),10);
        tracep->fullCData(oldp+100,(vlTOPp->core__DOT__DataMemory__DOT__memory_0_MPORT_2_data),8);
        tracep->fullCData(oldp+101,((0xffU & vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rs2_out_REG)),8);
        tracep->fullCData(oldp+102,(vlTOPp->core__DOT__DataMemory__DOT__memory_1_MPORT_1_data),8);
        tracep->fullCData(oldp+103,(vlTOPp->core__DOT__DataMemory__DOT__memory_1_MPORT_2_data),8);
        tracep->fullCData(oldp+104,((0xffU & ((IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memWr_out_REG)
                                               ? ((0U 
                                                   == (IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_fun3out_REG))
                                                   ? (IData)(vlTOPp->core__DOT__DataMemory__DOT___GEN_19)
                                                   : 
                                                  ((1U 
                                                    == (IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_fun3out_REG))
                                                    ? (IData)(vlTOPp->core__DOT__DataMemory__DOT___GEN_19)
                                                    : 
                                                   (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rs2_out_REG 
                                                    >> 8U)))
                                               : (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rs2_out_REG 
                                                  >> 8U)))),8);
        tracep->fullCData(oldp+105,(vlTOPp->core__DOT__DataMemory__DOT__memory_2_MPORT_1_data),8);
        tracep->fullCData(oldp+106,(vlTOPp->core__DOT__DataMemory__DOT__memory_2_MPORT_2_data),8);
        tracep->fullCData(oldp+107,((0xffU & ((IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memWr_out_REG)
                                               ? ((0U 
                                                   == (IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_fun3out_REG))
                                                   ? 
                                                  ((0U 
                                                    == 
                                                    (3U 
                                                     & vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG))
                                                    ? 
                                                   (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rs2_out_REG 
                                                    >> 0x10U)
                                                    : 
                                                   ((1U 
                                                     == 
                                                     (3U 
                                                      & vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG))
                                                     ? 
                                                    (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rs2_out_REG 
                                                     >> 0x10U)
                                                     : (IData)(vlTOPp->core__DOT__DataMemory__DOT___GEN_6)))
                                                   : 
                                                  ((1U 
                                                    == (IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_fun3out_REG))
                                                    ? 
                                                   ((0U 
                                                     == 
                                                     (3U 
                                                      & vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG))
                                                     ? 
                                                    (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rs2_out_REG 
                                                     >> 0x10U)
                                                     : 
                                                    ((1U 
                                                      == 
                                                      (3U 
                                                       & vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG))
                                                      ? 
                                                     (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rs2_out_REG 
                                                      >> 8U)
                                                      : (IData)(vlTOPp->core__DOT__DataMemory__DOT___GEN_6)))
                                                    : 
                                                   (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rs2_out_REG 
                                                    >> 0x10U)))
                                               : (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rs2_out_REG 
                                                  >> 0x10U)))),8);
        tracep->fullCData(oldp+108,(vlTOPp->core__DOT__DataMemory__DOT__memory_3_MPORT_1_data),8);
        tracep->fullCData(oldp+109,(vlTOPp->core__DOT__DataMemory__DOT__memory_3_MPORT_2_data),8);
        tracep->fullCData(oldp+110,((0xffU & ((IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memWr_out_REG)
                                               ? ((0U 
                                                   == (IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_fun3out_REG))
                                                   ? 
                                                  ((0U 
                                                    == 
                                                    (3U 
                                                     & vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG))
                                                    ? 
                                                   (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rs2_out_REG 
                                                    >> 0x18U)
                                                    : 
                                                   ((1U 
                                                     == 
                                                     (3U 
                                                      & vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG))
                                                     ? 
                                                    (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rs2_out_REG 
                                                     >> 0x18U)
                                                     : 
                                                    ((2U 
                                                      == 
                                                      (3U 
                                                       & vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG))
                                                      ? 
                                                     (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rs2_out_REG 
                                                      >> 0x18U)
                                                      : (IData)(vlTOPp->core__DOT__DataMemory__DOT___GEN_2))))
                                                   : 
                                                  ((1U 
                                                    == (IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_fun3out_REG))
                                                    ? 
                                                   ((0U 
                                                     == 
                                                     (3U 
                                                      & vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG))
                                                     ? 
                                                    (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rs2_out_REG 
                                                     >> 0x18U)
                                                     : 
                                                    ((1U 
                                                      == 
                                                      (3U 
                                                       & vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG))
                                                      ? 
                                                     (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rs2_out_REG 
                                                      >> 0x18U)
                                                      : 
                                                     ((2U 
                                                       == 
                                                       (3U 
                                                        & vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG))
                                                       ? 
                                                      (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rs2_out_REG 
                                                       >> 8U)
                                                       : (IData)(vlTOPp->core__DOT__DataMemory__DOT___GEN_2))))
                                                    : 
                                                   (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rs2_out_REG 
                                                    >> 0x18U)))
                                               : (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rs2_out_REG 
                                                  >> 0x18U)))),8);
        tracep->fullCData(oldp+111,(vlTOPp->core__DOT__DataMemory__DOT__tempread_0),8);
        tracep->fullIData(oldp+112,(((0x80U & (IData)(vlTOPp->core__DOT__DataMemory__DOT__tempread_0))
                                      ? 0xffffffU : 0U)),24);
        tracep->fullCData(oldp+113,(vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo),8);
        tracep->fullCData(oldp+114,(vlTOPp->core__DOT__DataMemory__DOT__tempread_1),8);
        tracep->fullIData(oldp+115,(((0x80U & (IData)(vlTOPp->core__DOT__DataMemory__DOT__tempread_1))
                                      ? 0xffffffU : 0U)),24);
        tracep->fullCData(oldp+116,(vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo_1),8);
        tracep->fullCData(oldp+117,(vlTOPp->core__DOT__DataMemory__DOT__tempread_2),8);
        tracep->fullIData(oldp+118,(((0x80U & (IData)(vlTOPp->core__DOT__DataMemory__DOT__tempread_2))
                                      ? 0xffffffU : 0U)),24);
        tracep->fullCData(oldp+119,(vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo_2),8);
        tracep->fullCData(oldp+120,(((IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memRd_out_REG)
                                      ? (IData)(vlTOPp->core__DOT__DataMemory__DOT__memory_3_MPORT_2_data)
                                      : (IData)(vlTOPp->core__DOT__DataMemory__DOT__memory_3_MPORT_1_data))),8);
        tracep->fullIData(oldp+121,(((0x80U & ((IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memRd_out_REG)
                                                ? (IData)(vlTOPp->core__DOT__DataMemory__DOT__memory_3_MPORT_2_data)
                                                : (IData)(vlTOPp->core__DOT__DataMemory__DOT__memory_3_MPORT_1_data)))
                                      ? 0xffffffU : 0U)),24);
        tracep->fullCData(oldp+122,(vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo_3),8);
        tracep->fullSData(oldp+123,(((0x80U & (IData)(vlTOPp->core__DOT__DataMemory__DOT__tempread_0))
                                      ? 0xffffU : 0U)),16);
        tracep->fullSData(oldp+124,(((0x80U & (IData)(vlTOPp->core__DOT__DataMemory__DOT__tempread_1))
                                      ? 0xffffU : 0U)),16);
        tracep->fullSData(oldp+125,(((0x80U & (IData)(vlTOPp->core__DOT__DataMemory__DOT__tempread_2))
                                      ? 0xffffU : 0U)),16);
        tracep->fullIData(oldp+126,(((0x80000000U & vlTOPp->core__DOT__IF_ID___DOT__S_instr)
                                      ? 0xfffffU : 0U)),20);
        tracep->fullSData(oldp+127,((0xfffU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                               >> 0x14U))),12);
        tracep->fullCData(oldp+128,((0x7fU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                              >> 0x19U))),7);
        tracep->fullIData(oldp+129,(((0x80000000U & vlTOPp->core__DOT__IF_ID___DOT__S_instr)
                                      ? 0x7ffffU : 0U)),19);
        tracep->fullBit(oldp+130,((1U & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                         >> 7U))));
        tracep->fullCData(oldp+131,((0x3fU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                              >> 0x19U))),6);
        tracep->fullCData(oldp+132,((0xfU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                             >> 8U))),4);
        tracep->fullIData(oldp+133,(((((0x80000000U 
                                        & vlTOPp->core__DOT__IF_ID___DOT__S_instr)
                                        ? 0x7ffffU : 0U) 
                                      << 0xdU) | ((0x1000U 
                                                   & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                      >> 0x13U)) 
                                                  | ((0x800U 
                                                      & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                         << 4U)) 
                                                     | ((0x7e0U 
                                                         & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                            >> 0x14U)) 
                                                        | (0x1eU 
                                                           & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                              >> 7U))))))),32);
        tracep->fullIData(oldp+134,((0xfffffU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                 >> 0xcU))),20);
        tracep->fullSData(oldp+135,(((0x80000000U & vlTOPp->core__DOT__IF_ID___DOT__S_instr)
                                      ? 0x7ffU : 0U)),11);
        tracep->fullCData(oldp+136,((0xffU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                              >> 0xcU))),8);
        tracep->fullBit(oldp+137,((1U & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                         >> 0x14U))));
        tracep->fullSData(oldp+138,((0x3ffU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                               >> 0x15U))),10);
        tracep->fullIData(oldp+139,(((((0x80000000U 
                                        & vlTOPp->core__DOT__IF_ID___DOT__S_instr)
                                        ? 0x7ffU : 0U) 
                                      << 0x15U) | (
                                                   (0x100000U 
                                                    & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                       >> 0xbU)) 
                                                   | ((0xff000U 
                                                       & vlTOPp->core__DOT__IF_ID___DOT__S_instr) 
                                                      | ((0x800U 
                                                          & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                             >> 9U)) 
                                                         | (0x7feU 
                                                            & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                               >> 0x14U))))))),32);
        tracep->fullIData(oldp+140,(vlTOPp->core__DOT__RegFile__DOT__regfile_0),32);
        tracep->fullIData(oldp+141,(vlTOPp->core__DOT__RegFile__DOT__regfile_1),32);
        tracep->fullIData(oldp+142,(vlTOPp->core__DOT__RegFile__DOT__regfile_2),32);
        tracep->fullIData(oldp+143,(vlTOPp->core__DOT__RegFile__DOT__regfile_3),32);
        tracep->fullIData(oldp+144,(vlTOPp->core__DOT__RegFile__DOT__regfile_4),32);
        tracep->fullIData(oldp+145,(vlTOPp->core__DOT__RegFile__DOT__regfile_5),32);
        tracep->fullIData(oldp+146,(vlTOPp->core__DOT__RegFile__DOT__regfile_6),32);
        tracep->fullIData(oldp+147,(vlTOPp->core__DOT__RegFile__DOT__regfile_7),32);
        tracep->fullIData(oldp+148,(vlTOPp->core__DOT__RegFile__DOT__regfile_8),32);
        tracep->fullIData(oldp+149,(vlTOPp->core__DOT__RegFile__DOT__regfile_9),32);
        tracep->fullIData(oldp+150,(vlTOPp->core__DOT__RegFile__DOT__regfile_10),32);
        tracep->fullIData(oldp+151,(vlTOPp->core__DOT__RegFile__DOT__regfile_11),32);
        tracep->fullIData(oldp+152,(vlTOPp->core__DOT__RegFile__DOT__regfile_12),32);
        tracep->fullIData(oldp+153,(vlTOPp->core__DOT__RegFile__DOT__regfile_13),32);
        tracep->fullIData(oldp+154,(vlTOPp->core__DOT__RegFile__DOT__regfile_14),32);
        tracep->fullIData(oldp+155,(vlTOPp->core__DOT__RegFile__DOT__regfile_15),32);
        tracep->fullIData(oldp+156,(vlTOPp->core__DOT__RegFile__DOT__regfile_16),32);
        tracep->fullIData(oldp+157,(vlTOPp->core__DOT__RegFile__DOT__regfile_17),32);
        tracep->fullIData(oldp+158,(vlTOPp->core__DOT__RegFile__DOT__regfile_18),32);
        tracep->fullIData(oldp+159,(vlTOPp->core__DOT__RegFile__DOT__regfile_19),32);
        tracep->fullIData(oldp+160,(vlTOPp->core__DOT__RegFile__DOT__regfile_20),32);
        tracep->fullIData(oldp+161,(vlTOPp->core__DOT__RegFile__DOT__regfile_21),32);
        tracep->fullIData(oldp+162,(vlTOPp->core__DOT__RegFile__DOT__regfile_22),32);
        tracep->fullIData(oldp+163,(vlTOPp->core__DOT__RegFile__DOT__regfile_23),32);
        tracep->fullIData(oldp+164,(vlTOPp->core__DOT__RegFile__DOT__regfile_24),32);
        tracep->fullIData(oldp+165,(vlTOPp->core__DOT__RegFile__DOT__regfile_25),32);
        tracep->fullIData(oldp+166,(vlTOPp->core__DOT__RegFile__DOT__regfile_26),32);
        tracep->fullIData(oldp+167,(vlTOPp->core__DOT__RegFile__DOT__regfile_27),32);
        tracep->fullIData(oldp+168,(vlTOPp->core__DOT__RegFile__DOT__regfile_28),32);
        tracep->fullIData(oldp+169,(vlTOPp->core__DOT__RegFile__DOT__regfile_29),32);
        tracep->fullIData(oldp+170,(vlTOPp->core__DOT__RegFile__DOT__regfile_30),32);
        tracep->fullIData(oldp+171,(vlTOPp->core__DOT__RegFile__DOT__regfile_31),32);
        tracep->fullIData(oldp+172,((((0U == (IData)(vlTOPp->core__DOT__control_module_io_extend))
                                       ? vlTOPp->core__DOT__ImmGen_io_I_type
                                       : vlTOPp->core__DOT___GEN_9) 
                                     + ((0xaU == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                         ? vlTOPp->core__DOT__RegFile_io_w_data
                                         : ((9U == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                             ? vlTOPp->core__DOT__DataMemory_io_dataOut
                                             : ((8U 
                                                 == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                 ? vlTOPp->core__DOT__RegFile_io_w_data
                                                 : 
                                                ((7U 
                                                  == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                  ? vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG
                                                  : 
                                                 ((6U 
                                                   == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                   ? (IData)(vlTOPp->core__DOT__ALU__DOT___GEN_10)
                                                   : 
                                                  ((5U 
                                                    == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                    ? vlTOPp->core__DOT__RegFile_io_rdata1
                                                    : 
                                                   ((4U 
                                                     == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                     ? vlTOPp->core__DOT__RegFile_io_rdata1
                                                     : 
                                                    ((3U 
                                                      == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                      ? vlTOPp->core__DOT__RegFile_io_rdata1
                                                      : 
                                                     ((2U 
                                                       == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                       ? vlTOPp->core__DOT__RegFile_io_rdata1
                                                       : 
                                                      ((1U 
                                                        == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                        ? vlTOPp->core__DOT__RegFile_io_rdata1
                                                        : 
                                                       ((0U 
                                                         == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                         ? vlTOPp->core__DOT__RegFile_io_rdata1
                                                         : 0U))))))))))))),32);
        tracep->fullBit(oldp+173,(vlTOPp->clock));
        tracep->fullBit(oldp+174,(vlTOPp->reset));
        tracep->fullCData(oldp+175,(vlTOPp->io_out),4);
        tracep->fullBit(oldp+176,(0U));
    }
}
