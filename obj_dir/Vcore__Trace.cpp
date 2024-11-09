// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vcore__Syms.h"


void Vcore::traceChgTop0(void* userp, VerilatedVcd* tracep) {
    Vcore__Syms* __restrict vlSymsp = static_cast<Vcore__Syms*>(userp);
    Vcore* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Variables
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    {
        vlTOPp->traceChgSub0(userp, tracep);
    }
}

void Vcore::traceChgSub0(void* userp, VerilatedVcd* tracep) {
    Vcore__Syms* __restrict vlSymsp = static_cast<Vcore__Syms*>(userp);
    Vcore* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    vluint32_t* const oldp = tracep->oldp(vlSymsp->__Vm_baseCode + 1);
    if (false && oldp) {}  // Prevent unused
    // Body
    {
        if (VL_UNLIKELY(vlTOPp->__Vm_traceActivity[1U])) {
            tracep->chgIData(oldp+0,(((IData)(vlTOPp->core__DOT__HazardDetect_io_pc_forward)
                                       ? ((IData)(4U) 
                                          + vlTOPp->core__DOT__PC__DOT__PC)
                                       : ((1U == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                           ? (((IData)(vlTOPp->core__DOT__Branch_M_io_br_taken) 
                                               & (IData)(vlTOPp->core__DOT__control_module_io_branch))
                                               ? 0U
                                               : ((IData)(4U) 
                                                  + vlTOPp->core__DOT__PC__DOT__PC))
                                           : ((2U == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                               ? 0U
                                               : ((3U 
                                                   == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                                   ? 0U
                                                   : 
                                                  ((IData)(4U) 
                                                   + vlTOPp->core__DOT__PC__DOT__PC)))))),32);
            tracep->chgIData(oldp+1,(((IData)(vlTOPp->core__DOT__HazardDetect_io_pc_forward)
                                       ? vlTOPp->core__DOT__PC_for
                                       : ((1U == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                           ? (((IData)(vlTOPp->core__DOT__Branch_M_io_br_taken) 
                                               & (IData)(vlTOPp->core__DOT__control_module_io_branch))
                                               ? 0U
                                               : vlTOPp->core__DOT__PC_for)
                                           : ((2U == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                               ? 0U
                                               : ((3U 
                                                   == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                                   ? 0U
                                                   : vlTOPp->core__DOT__PC_for))))),32);
            tracep->chgIData(oldp+2,(((IData)(vlTOPp->core__DOT__HazardDetect_io_pc_forward)
                                       ? vlTOPp->core__DOT__Instruction_F
                                       : ((1U == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                           ? (((IData)(vlTOPp->core__DOT__Branch_M_io_br_taken) 
                                               & (IData)(vlTOPp->core__DOT__control_module_io_branch))
                                               ? 0U
                                               : vlTOPp->core__DOT__Instruction_F)
                                           : ((2U == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                               ? 0U
                                               : ((3U 
                                                   == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                                   ? 0U
                                                   : vlTOPp->core__DOT__Instruction_F))))),32);
            tracep->chgIData(oldp+3,(vlTOPp->core__DOT__IF_ID___DOT__Pc4_In),32);
            tracep->chgIData(oldp+4,(vlTOPp->core__DOT__IF_ID___DOT__S_pc),32);
            tracep->chgIData(oldp+5,(vlTOPp->core__DOT__IF_ID___DOT__S_instr),32);
            tracep->chgCData(oldp+6,(vlTOPp->core__DOT__RegFile_io_rs1),5);
            tracep->chgCData(oldp+7,(vlTOPp->core__DOT__RegFile_io_rs2),5);
            tracep->chgIData(oldp+8,(((IData)(vlTOPp->core__DOT__Structural_io_fwd_rs1)
                                       ? ((IData)(vlTOPp->core__DOT__Structural_io_fwd_rs1)
                                           ? vlTOPp->core__DOT__RegFile_io_w_data
                                           : 0U) : vlTOPp->core__DOT__RegFile_io_rdata1)),32);
            tracep->chgIData(oldp+9,(((IData)(vlTOPp->core__DOT__Structural_io_fwd_rs2)
                                       ? ((IData)(vlTOPp->core__DOT__Structural_io_fwd_rs2)
                                           ? vlTOPp->core__DOT__RegFile_io_w_data
                                           : 0U) : vlTOPp->core__DOT__RegFile_io_rdata2)),32);
            tracep->chgIData(oldp+10,(((0U == (IData)(vlTOPp->core__DOT__control_module_io_extend))
                                        ? vlTOPp->core__DOT__ImmGen_io_I_type
                                        : vlTOPp->core__DOT___GEN_9)),32);
            tracep->chgCData(oldp+11,((0x1fU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                >> 7U))),5);
            tracep->chgCData(oldp+12,((7U & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                             >> 0xcU))),3);
            tracep->chgBit(oldp+13,((1U & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                           >> 0x1eU))));
            tracep->chgBit(oldp+14,(((~ (IData)(vlTOPp->core__DOT__HazardDetect_io_ctrl_forward)) 
                                     & ((0x33U != (0x7fU 
                                                   & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                        & ((0x13U != 
                                            (0x7fU 
                                             & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                           & (0x23U 
                                              == (0x7fU 
                                                  & vlTOPp->core__DOT__IF_ID___DOT__S_instr)))))));
            tracep->chgBit(oldp+15,(((~ (IData)(vlTOPp->core__DOT__HazardDetect_io_ctrl_forward)) 
                                     & ((0x33U != (0x7fU 
                                                   & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                        & (IData)(vlTOPp->core__DOT__control_module__DOT___GEN_51)))));
            tracep->chgBit(oldp+16,(((~ (IData)(vlTOPp->core__DOT__HazardDetect_io_ctrl_forward)) 
                                     & ((0x33U == (0x7fU 
                                                   & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                        | ((0x13U == 
                                            (0x7fU 
                                             & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                           | ((0x23U 
                                               != (0x7fU 
                                                   & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                              & ((3U 
                                                  == 
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
            tracep->chgCData(oldp+17,(((IData)(vlTOPp->core__DOT__HazardDetect_io_ctrl_forward)
                                        ? 0U : ((0x33U 
                                                 == 
                                                 (0x7fU 
                                                  & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                 ? 0U
                                                 : 
                                                ((0x13U 
                                                  == 
                                                  (0x7fU 
                                                   & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                  ? 1U
                                                  : 
                                                 ((0x23U 
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
            tracep->chgCData(oldp+18,(((0x33U == (0x7fU 
                                                  & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                        ? 0U : ((0x13U 
                                                 == 
                                                 (0x7fU 
                                                  & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                 ? 0U
                                                 : 
                                                ((0x23U 
                                                  == 
                                                  (0x7fU 
                                                   & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                  ? 0U
                                                  : 
                                                 ((3U 
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
            tracep->chgBit(oldp+19,(((~ (IData)(vlTOPp->core__DOT__HazardDetect_io_ctrl_forward)) 
                                     & ((0x33U != (0x7fU 
                                                   & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                        & ((0x13U == 
                                            (0x7fU 
                                             & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                           | ((0x23U 
                                               == (0x7fU 
                                                   & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                              | ((3U 
                                                  == 
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
            tracep->chgCData(oldp+20,(vlTOPp->core__DOT__ID_EX___DOT__io_rs1_out_REG),5);
            tracep->chgCData(oldp+21,(vlTOPp->core__DOT__ID_EX___DOT__io_rs2_out_REG),5);
            tracep->chgIData(oldp+22,(vlTOPp->core__DOT__ID_EX___DOT__io_rs1_data_out_REG),32);
            tracep->chgIData(oldp+23,(vlTOPp->core__DOT__ID_EX___DOT__io_rs2_data_out_REG),32);
            tracep->chgCData(oldp+24,(vlTOPp->core__DOT__ID_EX___DOT__io_rd_out_REG),5);
            tracep->chgIData(oldp+25,(vlTOPp->core__DOT__ID_EX___DOT__io_imm_out_REG),32);
            tracep->chgCData(oldp+26,(vlTOPp->core__DOT__ID_EX___DOT__io_func3_out_REG),3);
            tracep->chgBit(oldp+27,(vlTOPp->core__DOT__ID_EX___DOT__io_func7_out_REG));
            tracep->chgBit(oldp+28,(vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_MemWr_out_REG));
            tracep->chgBit(oldp+29,(vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_MemRd_out_REG));
            tracep->chgBit(oldp+30,(vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_Reg_W_out_REG));
            tracep->chgBit(oldp+31,(vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_MemToReg_out_REG));
            tracep->chgCData(oldp+32,(vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_AluOp_out_REG),3);
            tracep->chgCData(oldp+33,(vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_OpA_out_REG),2);
            tracep->chgBit(oldp+34,(vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_OpB_out_REG));
            tracep->chgIData(oldp+35,(vlTOPp->core__DOT__ID_EX___DOT__io_IFID_pc4_out_REG),32);
            tracep->chgIData(oldp+36,(((0U == (IData)(vlTOPp->core__DOT__Forwarding_io_forward_b))
                                        ? vlTOPp->core__DOT__ID_EX___DOT__io_rs2_data_out_REG
                                        : vlTOPp->core__DOT___GEN_53)),32);
            tracep->chgIData(oldp+37,((IData)(vlTOPp->core__DOT__ALU__DOT___GEN_10)),32);
            tracep->chgBit(oldp+38,(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memRd_out_REG));
            tracep->chgBit(oldp+39,(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memWr_out_REG));
            tracep->chgBit(oldp+40,(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memToReg_out_REG));
            tracep->chgBit(oldp+41,(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_reg_w_out_REG));
            tracep->chgIData(oldp+42,(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rs2_out_REG),32);
            tracep->chgCData(oldp+43,(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rd_out_REG),5);
            tracep->chgIData(oldp+44,(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG),32);
            tracep->chgCData(oldp+45,(vlTOPp->core__DOT__EX_MEM_M__DOT__io_fun3out_REG),3);
            tracep->chgIData(oldp+46,(vlTOPp->core__DOT__DataMemory_io_dataOut),32);
            tracep->chgBit(oldp+47,(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_memToReg_out_REG));
            tracep->chgBit(oldp+48,(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG));
            tracep->chgBit(oldp+49,(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_memRd_out_REG));
            tracep->chgCData(oldp+50,(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG),5);
            tracep->chgIData(oldp+51,(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_dataMem_out_REG),32);
            tracep->chgIData(oldp+52,(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_alu_out_REG),32);
            tracep->chgIData(oldp+53,(((IData)(vlTOPp->core__DOT__HazardDetect_io_pc_forward)
                                        ? vlTOPp->core__DOT__IF_ID___DOT__Pc4_In
                                        : ((1U == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                            ? (((IData)(vlTOPp->core__DOT__Branch_M_io_br_taken) 
                                                & (IData)(vlTOPp->core__DOT__control_module_io_branch))
                                                ? (
                                                   ((((0x80000000U 
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
                                            : ((2U 
                                                == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                                ? (
                                                   ((((0x80000000U 
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
                                                : (
                                                   (3U 
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
            tracep->chgIData(oldp+54,(vlTOPp->core__DOT__PC__DOT__PC),32);
            tracep->chgIData(oldp+55,(((IData)(4U) 
                                       + vlTOPp->core__DOT__PC__DOT__PC)),32);
            tracep->chgIData(oldp+56,(vlTOPp->core__DOT__InstMemory__DOT__imem
                                      [(0x3ffU & (vlTOPp->core__DOT__PC__DOT__PC 
                                                  >> 2U))]),32);
            tracep->chgCData(oldp+57,((0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr)),7);
            tracep->chgBit(oldp+58,(((0x33U != (0x7fU 
                                                & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                     & ((0x13U != (0x7fU 
                                                   & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                        & (0x23U == 
                                           (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr))))));
            tracep->chgBit(oldp+59,(vlTOPp->core__DOT__control_module_io_branch));
            tracep->chgBit(oldp+60,(((0x33U != (0x7fU 
                                                & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                     & (IData)(vlTOPp->core__DOT__control_module__DOT___GEN_51))));
            tracep->chgBit(oldp+61,(((0x33U == (0x7fU 
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
                                                       | (IData)(vlTOPp->core__DOT__control_module__DOT___GEN_5))))))))));
            tracep->chgCData(oldp+62,(((0x33U == (0x7fU 
                                                  & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                        ? 0U : ((0x13U 
                                                 == 
                                                 (0x7fU 
                                                  & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                 ? 1U
                                                 : 
                                                ((0x23U 
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
                                                        : 0U)))))))))),3);
            tracep->chgBit(oldp+63,(((0x33U != (0x7fU 
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
                                                       & (IData)(vlTOPp->core__DOT__control_module__DOT___GEN_5))))))))));
            tracep->chgCData(oldp+64,(vlTOPp->core__DOT__control_module_io_extend),2);
            tracep->chgCData(oldp+65,(vlTOPp->core__DOT__control_module_io_next_pc_sel),2);
            tracep->chgIData(oldp+66,(vlTOPp->core__DOT__ImmGen_io_I_type),32);
            tracep->chgIData(oldp+67,(((((0x80000000U 
                                          & vlTOPp->core__DOT__IF_ID___DOT__S_instr)
                                          ? 0xfffffU
                                          : 0U) << 0xcU) 
                                       | ((0xfe0U & 
                                           (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                            >> 0x14U)) 
                                          | (0x1fU 
                                             & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                >> 7U))))),32);
            tracep->chgIData(oldp+68,((((((0x80000000U 
                                           & vlTOPp->core__DOT__IF_ID___DOT__S_instr)
                                           ? 0x7ffffU
                                           : 0U) << 0xdU) 
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
                                       + vlTOPp->core__DOT__IF_ID___DOT__S_pc)),32);
            tracep->chgIData(oldp+69,((0xfffff000U 
                                       & vlTOPp->core__DOT__IF_ID___DOT__S_instr)),32);
            tracep->chgIData(oldp+70,((((((0x80000000U 
                                           & vlTOPp->core__DOT__IF_ID___DOT__S_instr)
                                           ? 0x7ffU
                                           : 0U) << 0x15U) 
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
                                       + vlTOPp->core__DOT__IF_ID___DOT__S_pc)),32);
            tracep->chgIData(oldp+71,(vlTOPp->core__DOT__RegFile_io_w_data),32);
            tracep->chgIData(oldp+72,(vlTOPp->core__DOT__RegFile_io_rdata1),32);
            tracep->chgIData(oldp+73,(vlTOPp->core__DOT__RegFile_io_rdata2),32);
            tracep->chgCData(oldp+74,((0x1fU & (IData)(vlTOPp->core__DOT__ALU_Control__DOT___GEN_4))),5);
            tracep->chgIData(oldp+75,(vlTOPp->core__DOT__ALU_io_in_A),32);
            tracep->chgIData(oldp+76,(vlTOPp->core__DOT__ALU_io_in_B),32);
            tracep->chgIData(oldp+77,(vlTOPp->core__DOT__Branch_M_io_arg_x),32);
            tracep->chgIData(oldp+78,(vlTOPp->core__DOT___Branch_M_io_arg_y_T_7),32);
            tracep->chgBit(oldp+79,(vlTOPp->core__DOT__Branch_M_io_br_taken));
            tracep->chgIData(oldp+80,(((0xaU == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                        ? vlTOPp->core__DOT__RegFile_io_w_data
                                        : ((9U == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                            ? vlTOPp->core__DOT__DataMemory_io_dataOut
                                            : ((8U 
                                                == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                ? vlTOPp->core__DOT__RegFile_io_w_data
                                                : (
                                                   (7U 
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
            tracep->chgIData(oldp+81,((0xfffffffeU 
                                       & (((0U == (IData)(vlTOPp->core__DOT__control_module_io_extend))
                                            ? vlTOPp->core__DOT__ImmGen_io_I_type
                                            : vlTOPp->core__DOT___GEN_9) 
                                          + ((0xaU 
                                              == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                              ? vlTOPp->core__DOT__RegFile_io_w_data
                                              : ((9U 
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
            tracep->chgCData(oldp+82,(vlTOPp->core__DOT__Forwarding_io_forward_a),2);
            tracep->chgCData(oldp+83,(vlTOPp->core__DOT__Forwarding_io_forward_b),2);
            tracep->chgBit(oldp+84,(vlTOPp->core__DOT__HazardDetect_io_inst_forward));
            tracep->chgBit(oldp+85,(vlTOPp->core__DOT__HazardDetect_io_pc_forward));
            tracep->chgBit(oldp+86,(vlTOPp->core__DOT__HazardDetect_io_ctrl_forward));
            tracep->chgCData(oldp+87,((0x1fU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                >> 0xfU))),5);
            tracep->chgCData(oldp+88,((0x1fU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                >> 0x14U))),5);
            tracep->chgCData(oldp+89,(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1),4);
            tracep->chgCData(oldp+90,(vlTOPp->core__DOT__Branch_Forward__DOT___GEN_28),4);
            tracep->chgBit(oldp+91,(vlTOPp->core__DOT__Structural_io_fwd_rs1));
            tracep->chgBit(oldp+92,(vlTOPp->core__DOT__Structural_io_fwd_rs2));
            tracep->chgIData(oldp+93,(vlTOPp->core__DOT__PC_for),32);
            tracep->chgIData(oldp+94,(vlTOPp->core__DOT__Instruction_F),32);
            tracep->chgIData(oldp+95,(vlTOPp->core__DOT__d),32);
            tracep->chgSData(oldp+96,((0x3ffU & (vlTOPp->core__DOT__PC__DOT__PC 
                                                 >> 2U))),10);
            tracep->chgCData(oldp+97,(vlTOPp->core__DOT__DataMemory__DOT__memory_0_MPORT_1_data),8);
            tracep->chgSData(oldp+98,((0x3ffU & (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG 
                                                 >> 2U))),10);
            tracep->chgCData(oldp+99,(vlTOPp->core__DOT__DataMemory__DOT__memory_0_MPORT_2_data),8);
            tracep->chgCData(oldp+100,((0xffU & vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rs2_out_REG)),8);
            tracep->chgCData(oldp+101,(vlTOPp->core__DOT__DataMemory__DOT__memory_1_MPORT_1_data),8);
            tracep->chgCData(oldp+102,(vlTOPp->core__DOT__DataMemory__DOT__memory_1_MPORT_2_data),8);
            tracep->chgCData(oldp+103,((0xffU & ((IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memWr_out_REG)
                                                  ? 
                                                 ((0U 
                                                   == (IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_fun3out_REG))
                                                   ? (IData)(vlTOPp->core__DOT__DataMemory__DOT___GEN_19)
                                                   : 
                                                  ((1U 
                                                    == (IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_fun3out_REG))
                                                    ? (IData)(vlTOPp->core__DOT__DataMemory__DOT___GEN_19)
                                                    : 
                                                   (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rs2_out_REG 
                                                    >> 8U)))
                                                  : 
                                                 (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rs2_out_REG 
                                                  >> 8U)))),8);
            tracep->chgCData(oldp+104,(vlTOPp->core__DOT__DataMemory__DOT__memory_2_MPORT_1_data),8);
            tracep->chgCData(oldp+105,(vlTOPp->core__DOT__DataMemory__DOT__memory_2_MPORT_2_data),8);
            tracep->chgCData(oldp+106,((0xffU & ((IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memWr_out_REG)
                                                  ? 
                                                 ((0U 
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
                                                  : 
                                                 (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rs2_out_REG 
                                                  >> 0x10U)))),8);
            tracep->chgCData(oldp+107,(vlTOPp->core__DOT__DataMemory__DOT__memory_3_MPORT_1_data),8);
            tracep->chgCData(oldp+108,(vlTOPp->core__DOT__DataMemory__DOT__memory_3_MPORT_2_data),8);
            tracep->chgCData(oldp+109,((0xffU & ((IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memWr_out_REG)
                                                  ? 
                                                 ((0U 
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
                                                  : 
                                                 (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rs2_out_REG 
                                                  >> 0x18U)))),8);
            tracep->chgCData(oldp+110,(vlTOPp->core__DOT__DataMemory__DOT__tempread_0),8);
            tracep->chgIData(oldp+111,(((0x80U & (IData)(vlTOPp->core__DOT__DataMemory__DOT__tempread_0))
                                         ? 0xffffffU
                                         : 0U)),24);
            tracep->chgCData(oldp+112,(vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo),8);
            tracep->chgCData(oldp+113,(vlTOPp->core__DOT__DataMemory__DOT__tempread_1),8);
            tracep->chgIData(oldp+114,(((0x80U & (IData)(vlTOPp->core__DOT__DataMemory__DOT__tempread_1))
                                         ? 0xffffffU
                                         : 0U)),24);
            tracep->chgCData(oldp+115,(vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo_1),8);
            tracep->chgCData(oldp+116,(vlTOPp->core__DOT__DataMemory__DOT__tempread_2),8);
            tracep->chgIData(oldp+117,(((0x80U & (IData)(vlTOPp->core__DOT__DataMemory__DOT__tempread_2))
                                         ? 0xffffffU
                                         : 0U)),24);
            tracep->chgCData(oldp+118,(vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo_2),8);
            tracep->chgCData(oldp+119,(((IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memRd_out_REG)
                                         ? (IData)(vlTOPp->core__DOT__DataMemory__DOT__memory_3_MPORT_2_data)
                                         : (IData)(vlTOPp->core__DOT__DataMemory__DOT__memory_3_MPORT_1_data))),8);
            tracep->chgIData(oldp+120,(((0x80U & ((IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memRd_out_REG)
                                                   ? (IData)(vlTOPp->core__DOT__DataMemory__DOT__memory_3_MPORT_2_data)
                                                   : (IData)(vlTOPp->core__DOT__DataMemory__DOT__memory_3_MPORT_1_data)))
                                         ? 0xffffffU
                                         : 0U)),24);
            tracep->chgCData(oldp+121,(vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo_3),8);
            tracep->chgSData(oldp+122,(((0x80U & (IData)(vlTOPp->core__DOT__DataMemory__DOT__tempread_0))
                                         ? 0xffffU : 0U)),16);
            tracep->chgSData(oldp+123,(((0x80U & (IData)(vlTOPp->core__DOT__DataMemory__DOT__tempread_1))
                                         ? 0xffffU : 0U)),16);
            tracep->chgSData(oldp+124,(((0x80U & (IData)(vlTOPp->core__DOT__DataMemory__DOT__tempread_2))
                                         ? 0xffffU : 0U)),16);
            tracep->chgIData(oldp+125,(((0x80000000U 
                                         & vlTOPp->core__DOT__IF_ID___DOT__S_instr)
                                         ? 0xfffffU
                                         : 0U)),20);
            tracep->chgSData(oldp+126,((0xfffU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                  >> 0x14U))),12);
            tracep->chgCData(oldp+127,((0x7fU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                 >> 0x19U))),7);
            tracep->chgIData(oldp+128,(((0x80000000U 
                                         & vlTOPp->core__DOT__IF_ID___DOT__S_instr)
                                         ? 0x7ffffU
                                         : 0U)),19);
            tracep->chgBit(oldp+129,((1U & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                            >> 7U))));
            tracep->chgCData(oldp+130,((0x3fU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                 >> 0x19U))),6);
            tracep->chgCData(oldp+131,((0xfU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                >> 8U))),4);
            tracep->chgIData(oldp+132,(((((0x80000000U 
                                           & vlTOPp->core__DOT__IF_ID___DOT__S_instr)
                                           ? 0x7ffffU
                                           : 0U) << 0xdU) 
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
                                                       >> 7U))))))),32);
            tracep->chgIData(oldp+133,((0xfffffU & 
                                        (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                         >> 0xcU))),20);
            tracep->chgSData(oldp+134,(((0x80000000U 
                                         & vlTOPp->core__DOT__IF_ID___DOT__S_instr)
                                         ? 0x7ffU : 0U)),11);
            tracep->chgCData(oldp+135,((0xffU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                 >> 0xcU))),8);
            tracep->chgBit(oldp+136,((1U & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                            >> 0x14U))));
            tracep->chgSData(oldp+137,((0x3ffU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                  >> 0x15U))),10);
            tracep->chgIData(oldp+138,(((((0x80000000U 
                                           & vlTOPp->core__DOT__IF_ID___DOT__S_instr)
                                           ? 0x7ffU
                                           : 0U) << 0x15U) 
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
                                                       >> 0x14U))))))),32);
            tracep->chgIData(oldp+139,(vlTOPp->core__DOT__RegFile__DOT__regfile_0),32);
            tracep->chgIData(oldp+140,(vlTOPp->core__DOT__RegFile__DOT__regfile_1),32);
            tracep->chgIData(oldp+141,(vlTOPp->core__DOT__RegFile__DOT__regfile_2),32);
            tracep->chgIData(oldp+142,(vlTOPp->core__DOT__RegFile__DOT__regfile_3),32);
            tracep->chgIData(oldp+143,(vlTOPp->core__DOT__RegFile__DOT__regfile_4),32);
            tracep->chgIData(oldp+144,(vlTOPp->core__DOT__RegFile__DOT__regfile_5),32);
            tracep->chgIData(oldp+145,(vlTOPp->core__DOT__RegFile__DOT__regfile_6),32);
            tracep->chgIData(oldp+146,(vlTOPp->core__DOT__RegFile__DOT__regfile_7),32);
            tracep->chgIData(oldp+147,(vlTOPp->core__DOT__RegFile__DOT__regfile_8),32);
            tracep->chgIData(oldp+148,(vlTOPp->core__DOT__RegFile__DOT__regfile_9),32);
            tracep->chgIData(oldp+149,(vlTOPp->core__DOT__RegFile__DOT__regfile_10),32);
            tracep->chgIData(oldp+150,(vlTOPp->core__DOT__RegFile__DOT__regfile_11),32);
            tracep->chgIData(oldp+151,(vlTOPp->core__DOT__RegFile__DOT__regfile_12),32);
            tracep->chgIData(oldp+152,(vlTOPp->core__DOT__RegFile__DOT__regfile_13),32);
            tracep->chgIData(oldp+153,(vlTOPp->core__DOT__RegFile__DOT__regfile_14),32);
            tracep->chgIData(oldp+154,(vlTOPp->core__DOT__RegFile__DOT__regfile_15),32);
            tracep->chgIData(oldp+155,(vlTOPp->core__DOT__RegFile__DOT__regfile_16),32);
            tracep->chgIData(oldp+156,(vlTOPp->core__DOT__RegFile__DOT__regfile_17),32);
            tracep->chgIData(oldp+157,(vlTOPp->core__DOT__RegFile__DOT__regfile_18),32);
            tracep->chgIData(oldp+158,(vlTOPp->core__DOT__RegFile__DOT__regfile_19),32);
            tracep->chgIData(oldp+159,(vlTOPp->core__DOT__RegFile__DOT__regfile_20),32);
            tracep->chgIData(oldp+160,(vlTOPp->core__DOT__RegFile__DOT__regfile_21),32);
            tracep->chgIData(oldp+161,(vlTOPp->core__DOT__RegFile__DOT__regfile_22),32);
            tracep->chgIData(oldp+162,(vlTOPp->core__DOT__RegFile__DOT__regfile_23),32);
            tracep->chgIData(oldp+163,(vlTOPp->core__DOT__RegFile__DOT__regfile_24),32);
            tracep->chgIData(oldp+164,(vlTOPp->core__DOT__RegFile__DOT__regfile_25),32);
            tracep->chgIData(oldp+165,(vlTOPp->core__DOT__RegFile__DOT__regfile_26),32);
            tracep->chgIData(oldp+166,(vlTOPp->core__DOT__RegFile__DOT__regfile_27),32);
            tracep->chgIData(oldp+167,(vlTOPp->core__DOT__RegFile__DOT__regfile_28),32);
            tracep->chgIData(oldp+168,(vlTOPp->core__DOT__RegFile__DOT__regfile_29),32);
            tracep->chgIData(oldp+169,(vlTOPp->core__DOT__RegFile__DOT__regfile_30),32);
            tracep->chgIData(oldp+170,(vlTOPp->core__DOT__RegFile__DOT__regfile_31),32);
            tracep->chgIData(oldp+171,((((0U == (IData)(vlTOPp->core__DOT__control_module_io_extend))
                                          ? vlTOPp->core__DOT__ImmGen_io_I_type
                                          : vlTOPp->core__DOT___GEN_9) 
                                        + ((0xaU == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                            ? vlTOPp->core__DOT__RegFile_io_w_data
                                            : ((9U 
                                                == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                ? vlTOPp->core__DOT__DataMemory_io_dataOut
                                                : (
                                                   (8U 
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
        }
        tracep->chgBit(oldp+172,(vlTOPp->clock));
        tracep->chgBit(oldp+173,(vlTOPp->reset));
        tracep->chgCData(oldp+174,(vlTOPp->io_out),4);
    }
}

void Vcore::traceCleanup(void* userp, VerilatedVcd* /*unused*/) {
    Vcore__Syms* __restrict vlSymsp = static_cast<Vcore__Syms*>(userp);
    Vcore* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    {
        vlSymsp->__Vm_activity = false;
        vlTOPp->__Vm_traceActivity[0U] = 0U;
        vlTOPp->__Vm_traceActivity[1U] = 0U;
    }
}
