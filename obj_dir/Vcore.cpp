// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vcore.h for the primary calling header

#include "Vcore.h"
#include "Vcore__Syms.h"

//==========

void Vcore::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vcore::eval\n"); );
    Vcore__Syms* __restrict vlSymsp = this->__VlSymsp;  // Setup global symbol table
    Vcore* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
#ifdef VL_DEBUG
    // Debug assertions
    _eval_debug_assertions();
#endif  // VL_DEBUG
    // Initialize
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) _eval_initial_loop(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Clock loop\n"););
        _eval(vlSymsp);
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = _change_request(vlSymsp);
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("core.v", 1642, "",
                "Verilated model didn't converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

void Vcore::_eval_initial_loop(Vcore__Syms* __restrict vlSymsp) {
    vlSymsp->__Vm_didInit = true;
    _eval_initial(vlSymsp);
    // Evaluate till stable
    int __VclockLoop = 0;
    QData __Vchange = 1;
    do {
        _eval_settle(vlSymsp);
        _eval(vlSymsp);
        if (VL_UNLIKELY(++__VclockLoop > 100)) {
            // About to fail, so enable debug to see what's not settling.
            // Note you must run make with OPT=-DVL_DEBUG for debug prints.
            int __Vsaved_debug = Verilated::debug();
            Verilated::debug(1);
            __Vchange = _change_request(vlSymsp);
            Verilated::debug(__Vsaved_debug);
            VL_FATAL_MT("core.v", 1642, "",
                "Verilated model didn't DC converge\n"
                "- See DIDNOTCONVERGE in the Verilator manual");
        } else {
            __Vchange = _change_request(vlSymsp);
        }
    } while (VL_UNLIKELY(__Vchange));
}

VL_INLINE_OPT void Vcore::_sequent__TOP__2(Vcore__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcore::_sequent__TOP__2\n"); );
    Vcore* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Variables
    CData/*7:0*/ __Vdlyvval__core__DOT__DataMemory__DOT__memory_0__v0;
    CData/*0:0*/ __Vdlyvset__core__DOT__DataMemory__DOT__memory_0__v0;
    SData/*9:0*/ __Vdlyvdim0__core__DOT__DataMemory__DOT__memory_0__v0;
    // Body
    if (VL_UNLIKELY(((IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memWr_out_REG) 
                     & (~ (IData)(vlTOPp->reset))))) {
        VL_FWRITEF(0x80000002U,"Writing to DataMemory: %10#\n",
                   32,vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rs2_out_REG);
    }
    __Vdlyvset__core__DOT__DataMemory__DOT__memory_0__v0 = 0U;
    if (VL_UNLIKELY(((IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memWr_out_REG) 
                     & (~ (IData)(vlTOPp->reset))))) {
        VL_FWRITEF(0x80000002U,"%x\n",32,vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rs2_out_REG);
    }
    vlTOPp->core__DOT__IF_ID___DOT__S_pc = ((IData)(vlTOPp->reset)
                                             ? 0U : 
                                            ((IData)(vlTOPp->core__DOT__HazardDetect_io_pc_forward)
                                              ? vlTOPp->core__DOT__PC_for
                                              : ((1U 
                                                  == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                                  ? 
                                                 (((IData)(vlTOPp->core__DOT__Branch_M_io_br_taken) 
                                                   & (IData)(vlTOPp->core__DOT__control_module_io_branch))
                                                   ? 0U
                                                   : vlTOPp->core__DOT__PC_for)
                                                  : 
                                                 ((2U 
                                                   == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                                   ? 0U
                                                   : 
                                                  ((3U 
                                                    == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                                    ? 0U
                                                    : vlTOPp->core__DOT__PC_for)))));
    vlTOPp->core__DOT__ID_EX___DOT__io_imm_out_REG 
        = ((0U == (IData)(vlTOPp->core__DOT__control_module_io_extend))
            ? vlTOPp->core__DOT__ImmGen_io_I_type : vlTOPp->core__DOT___GEN_9);
    vlTOPp->core__DOT__ID_EX___DOT__io_rs1_data_out_REG 
        = ((IData)(vlTOPp->core__DOT__Structural_io_fwd_rs1)
            ? ((IData)(vlTOPp->core__DOT__Structural_io_fwd_rs1)
                ? vlTOPp->core__DOT__RegFile_io_w_data
                : 0U) : vlTOPp->core__DOT__RegFile_io_rdata1);
    vlTOPp->core__DOT__ID_EX___DOT__io_IFID_pc4_out_REG 
        = vlTOPp->core__DOT__IF_ID___DOT__Pc4_In;
    vlTOPp->core__DOT__ID_EX___DOT__io_func7_out_REG 
        = (1U & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                 >> 0x1eU));
    vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_AluOp_out_REG 
        = ((IData)(vlTOPp->core__DOT__HazardDetect_io_ctrl_forward)
            ? 0U : ((0x33U == (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                     ? 0U : ((0x13U == (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                              ? 1U : ((0x23U == (0x7fU 
                                                 & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                       ? 5U : ((3U 
                                                == 
                                                (0x7fU 
                                                 & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                ? 4U
                                                : (
                                                   (0x63U 
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
                                                        : 0U))))))))));
    vlTOPp->core__DOT__EX_MEM_M__DOT__io_fun3out_REG 
        = vlTOPp->core__DOT__ID_EX___DOT__io_func3_out_REG;
    vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_OpA_out_REG 
        = ((0x33U == (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
            ? 0U : ((0x13U == (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                     ? 0U : ((0x23U == (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                              ? 0U : ((3U == (0x7fU 
                                              & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                       ? 0U : ((0x63U 
                                                == 
                                                (0x7fU 
                                                 & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                ? 0U
                                                : (
                                                   (0x6fU 
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
                                                       : 0U)))))))));
    vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_OpB_out_REG 
        = ((~ (IData)(vlTOPp->core__DOT__HazardDetect_io_ctrl_forward)) 
           & ((0x33U != (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
              & ((0x13U == (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                 | ((0x23U == (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                    | ((3U == (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                       | ((0x63U != (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                          & ((0x6fU != (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                             & ((0x67U != (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                & (IData)(vlTOPp->core__DOT__control_module__DOT___GEN_5)))))))));
    vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_memRd_out_REG 
        = vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memRd_out_REG;
    vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_dataMem_out_REG 
        = vlTOPp->core__DOT__DataMemory_io_dataOut;
    vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_alu_out_REG 
        = vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG;
    if (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memWr_out_REG) {
        __Vdlyvval__core__DOT__DataMemory__DOT__memory_0__v0 
            = (0xffU & vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rs2_out_REG);
        __Vdlyvset__core__DOT__DataMemory__DOT__memory_0__v0 = 1U;
        __Vdlyvdim0__core__DOT__DataMemory__DOT__memory_0__v0 
            = (0x3ffU & (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG 
                         >> 2U));
    }
    vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_memToReg_out_REG 
        = vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memToReg_out_REG;
    vlTOPp->core__DOT__ID_EX___DOT__io_rs1_out_REG 
        = vlTOPp->core__DOT__RegFile_io_rs1;
    vlTOPp->core__DOT__ID_EX___DOT__io_rs2_out_REG 
        = vlTOPp->core__DOT__RegFile_io_rs2;
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_26 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((0x1aU == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_26 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_29 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((0x1dU == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_29 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_27 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((0x1bU == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_27 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_28 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((0x1cU == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_28 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_30 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((0x1eU == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_30 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_22 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((0x16U == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_22 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_31 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((0x1fU == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_31 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_23 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((0x17U == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_23 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_24 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((0x18U == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_24 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_25 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((0x19U == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_25 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_9 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((9U == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_9 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_7 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((7U == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_7 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_11 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((0xbU == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_11 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_2 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((2U == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_2 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_10 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((0xaU == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_10 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_21 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((0x15U == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_21 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_1 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((1U == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_1 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_19 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((0x13U == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_19 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_5 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((5U == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_5 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_13 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((0xdU == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_13 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_20 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((0x14U == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_20 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_6 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((6U == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_6 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_14 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((0xeU == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_14 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_8 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((8U == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_8 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_0 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((0U == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_0 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_3 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((3U == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_3 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_12 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((0xcU == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_12 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_4 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((4U == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_4 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_15 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((0xfU == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_15 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_16 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((0x10U == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_16 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_17 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((0x11U == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_17 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (vlTOPp->reset) {
        vlTOPp->core__DOT__RegFile__DOT__regfile_18 = 0U;
    } else {
        if (((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
             & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)))) {
            if ((0x12U == (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) {
                vlTOPp->core__DOT__RegFile__DOT__regfile_18 
                    = vlTOPp->core__DOT__RegFile_io_w_data;
            }
        }
    }
    if (__Vdlyvset__core__DOT__DataMemory__DOT__memory_0__v0) {
        vlTOPp->core__DOT__DataMemory__DOT__memory_0[__Vdlyvdim0__core__DOT__DataMemory__DOT__memory_0__v0] 
            = __Vdlyvval__core__DOT__DataMemory__DOT__memory_0__v0;
    }
    vlTOPp->core__DOT__IF_ID___DOT__Pc4_In = ((IData)(vlTOPp->reset)
                                               ? 0U
                                               : ((IData)(vlTOPp->core__DOT__HazardDetect_io_pc_forward)
                                                   ? 
                                                  ((IData)(4U) 
                                                   + vlTOPp->core__DOT__PC__DOT__PC)
                                                   : 
                                                  ((1U 
                                                    == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                                    ? 
                                                   (((IData)(vlTOPp->core__DOT__Branch_M_io_br_taken) 
                                                     & (IData)(vlTOPp->core__DOT__control_module_io_branch))
                                                     ? 0U
                                                     : 
                                                    ((IData)(4U) 
                                                     + vlTOPp->core__DOT__PC__DOT__PC))
                                                    : 
                                                   ((2U 
                                                     == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                                     ? 0U
                                                     : 
                                                    ((3U 
                                                      == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                                      ? 0U
                                                      : 
                                                     ((IData)(4U) 
                                                      + vlTOPp->core__DOT__PC__DOT__PC))))));
    vlTOPp->core__DOT__ID_EX___DOT__io_func3_out_REG 
        = (7U & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                 >> 0xcU));
    vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memRd_out_REG 
        = vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_MemRd_out_REG;
    vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memWr_out_REG 
        = vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_MemWr_out_REG;
    vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rs2_out_REG 
        = ((0U == (IData)(vlTOPp->core__DOT__Forwarding_io_forward_b))
            ? vlTOPp->core__DOT__ID_EX___DOT__io_rs2_data_out_REG
            : vlTOPp->core__DOT___GEN_53);
    vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG 
        = (IData)(vlTOPp->core__DOT__ALU__DOT___GEN_10);
    vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memToReg_out_REG 
        = vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_MemToReg_out_REG;
    vlTOPp->core__DOT___GEN_56 = ((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_memToReg_out_REG)
                                   ? vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_dataMem_out_REG
                                   : 0U);
    vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG 
        = vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_reg_w_out_REG;
    vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG 
        = vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rd_out_REG;
    vlTOPp->core__DOT__d = ((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_memToReg_out_REG)
                             ? vlTOPp->core__DOT___GEN_56
                             : vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_alu_out_REG);
    vlTOPp->core__DOT__PC__DOT__PC = ((IData)(vlTOPp->reset)
                                       ? 0U : vlTOPp->core__DOT__PC_io_in);
    vlTOPp->core__DOT__ALU_Control__DOT___GEN_4 = (
                                                   (0U 
                                                    == (IData)(vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_AluOp_out_REG))
                                                    ? 
                                                   (((IData)(vlTOPp->core__DOT__ID_EX___DOT__io_func7_out_REG) 
                                                     << 3U) 
                                                    | (IData)(vlTOPp->core__DOT__ID_EX___DOT__io_func3_out_REG))
                                                    : 
                                                   ((1U 
                                                     == (IData)(vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_AluOp_out_REG))
                                                     ? (IData)(vlTOPp->core__DOT__ID_EX___DOT__io_func3_out_REG)
                                                     : 
                                                    ((2U 
                                                      == (IData)(vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_AluOp_out_REG))
                                                      ? 
                                                     (0x10U 
                                                      | (IData)(vlTOPp->core__DOT__ID_EX___DOT__io_func3_out_REG))
                                                      : 
                                                     ((3U 
                                                       == (IData)(vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_AluOp_out_REG))
                                                       ? 0x1fU
                                                       : 0U))));
    vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_MemRd_out_REG 
        = ((~ (IData)(vlTOPp->core__DOT__HazardDetect_io_ctrl_forward)) 
           & ((0x33U != (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
              & (IData)(vlTOPp->core__DOT__control_module__DOT___GEN_51)));
    vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_MemWr_out_REG 
        = ((~ (IData)(vlTOPp->core__DOT__HazardDetect_io_ctrl_forward)) 
           & ((0x33U != (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
              & ((0x13U != (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                 & (0x23U == (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr)))));
    vlTOPp->core__DOT__ID_EX___DOT__io_rs2_data_out_REG 
        = ((IData)(vlTOPp->core__DOT__Structural_io_fwd_rs2)
            ? ((IData)(vlTOPp->core__DOT__Structural_io_fwd_rs2)
                ? vlTOPp->core__DOT__RegFile_io_w_data
                : 0U) : vlTOPp->core__DOT__RegFile_io_rdata2);
    vlTOPp->core__DOT__DataMemory__DOT__memory_0_MPORT_1_data 
        = vlTOPp->core__DOT__DataMemory__DOT__memory_0
        [(0x3ffU & (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG 
                    >> 2U))];
    vlTOPp->core__DOT__DataMemory__DOT__memory_0_MPORT_2_data 
        = vlTOPp->core__DOT__DataMemory__DOT__memory_0
        [(0x3ffU & (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG 
                    >> 2U))];
    vlTOPp->core__DOT__DataMemory__DOT__memory_1_MPORT_1_data 
        = vlTOPp->core__DOT__DataMemory__DOT__memory_1
        [(0x3ffU & (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG 
                    >> 2U))];
    vlTOPp->core__DOT__DataMemory__DOT__memory_1_MPORT_2_data 
        = vlTOPp->core__DOT__DataMemory__DOT__memory_1
        [(0x3ffU & (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG 
                    >> 2U))];
    vlTOPp->core__DOT__DataMemory__DOT__memory_2_MPORT_1_data 
        = vlTOPp->core__DOT__DataMemory__DOT__memory_2
        [(0x3ffU & (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG 
                    >> 2U))];
    vlTOPp->core__DOT__DataMemory__DOT__memory_2_MPORT_2_data 
        = vlTOPp->core__DOT__DataMemory__DOT__memory_2
        [(0x3ffU & (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG 
                    >> 2U))];
    vlTOPp->core__DOT__DataMemory__DOT__memory_3_MPORT_1_data 
        = vlTOPp->core__DOT__DataMemory__DOT__memory_3
        [(0x3ffU & (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG 
                    >> 2U))];
    vlTOPp->core__DOT__DataMemory__DOT__memory_3_MPORT_2_data 
        = vlTOPp->core__DOT__DataMemory__DOT__memory_3
        [(0x3ffU & (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG 
                    >> 2U))];
    vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_MemToReg_out_REG 
        = ((~ (IData)(vlTOPp->core__DOT__HazardDetect_io_ctrl_forward)) 
           & ((0x33U != (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
              & (IData)(vlTOPp->core__DOT__control_module__DOT___GEN_51)));
    vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_reg_w_out_REG 
        = vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_Reg_W_out_REG;
    vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rd_out_REG 
        = vlTOPp->core__DOT__ID_EX___DOT__io_rd_out_REG;
    vlTOPp->core__DOT__RegFile_io_w_data = ((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_memToReg_out_REG)
                                             ? vlTOPp->core__DOT___GEN_56
                                             : vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_alu_out_REG);
    if (vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memRd_out_REG) {
        vlTOPp->core__DOT__DataMemory__DOT__tempread_0 
            = vlTOPp->core__DOT__DataMemory__DOT__memory_0_MPORT_2_data;
        vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo 
            = vlTOPp->core__DOT__DataMemory__DOT__memory_0_MPORT_2_data;
        vlTOPp->core__DOT__DataMemory__DOT__tempread_1 
            = vlTOPp->core__DOT__DataMemory__DOT__memory_1_MPORT_2_data;
        vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo_1 
            = vlTOPp->core__DOT__DataMemory__DOT__memory_1_MPORT_2_data;
        vlTOPp->core__DOT__DataMemory__DOT__tempread_2 
            = vlTOPp->core__DOT__DataMemory__DOT__memory_2_MPORT_2_data;
        vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo_2 
            = vlTOPp->core__DOT__DataMemory__DOT__memory_2_MPORT_2_data;
        vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo_3 
            = vlTOPp->core__DOT__DataMemory__DOT__memory_3_MPORT_2_data;
    } else {
        vlTOPp->core__DOT__DataMemory__DOT__tempread_0 
            = vlTOPp->core__DOT__DataMemory__DOT__memory_0_MPORT_1_data;
        vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo 
            = vlTOPp->core__DOT__DataMemory__DOT__memory_0_MPORT_1_data;
        vlTOPp->core__DOT__DataMemory__DOT__tempread_1 
            = vlTOPp->core__DOT__DataMemory__DOT__memory_1_MPORT_1_data;
        vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo_1 
            = vlTOPp->core__DOT__DataMemory__DOT__memory_1_MPORT_1_data;
        vlTOPp->core__DOT__DataMemory__DOT__tempread_2 
            = vlTOPp->core__DOT__DataMemory__DOT__memory_2_MPORT_1_data;
        vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo_2 
            = vlTOPp->core__DOT__DataMemory__DOT__memory_2_MPORT_1_data;
        vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo_3 
            = vlTOPp->core__DOT__DataMemory__DOT__memory_3_MPORT_1_data;
    }
    vlTOPp->core__DOT__DataMemory__DOT___GEN_82 = (
                                                   (3U 
                                                    == 
                                                    (3U 
                                                     & vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG))
                                                    ? 
                                                   ((((0x80U 
                                                       & ((IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memRd_out_REG)
                                                           ? (IData)(vlTOPp->core__DOT__DataMemory__DOT__memory_3_MPORT_2_data)
                                                           : (IData)(vlTOPp->core__DOT__DataMemory__DOT__memory_3_MPORT_1_data)))
                                                       ? 0xffffffU
                                                       : 0U) 
                                                     << 8U) 
                                                    | (IData)(vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo_3))
                                                    : 0U);
    vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_Reg_W_out_REG 
        = ((~ (IData)(vlTOPp->core__DOT__HazardDetect_io_ctrl_forward)) 
           & ((0x33U == (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
              | ((0x13U == (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                 | ((0x23U != (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                    & ((3U == (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                       | ((0x63U != (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                          & ((0x6fU == (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                             | ((0x67U == (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                | (IData)(vlTOPp->core__DOT__control_module__DOT___GEN_5)))))))));
    vlTOPp->core__DOT__ID_EX___DOT__io_rd_out_REG = 
        (0x1fU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                  >> 7U));
    vlTOPp->core__DOT__Forwarding__DOT___T_11 = (((IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_reg_w_out_REG) 
                                                  & (0U 
                                                     != (IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rd_out_REG))) 
                                                 & ((IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rd_out_REG) 
                                                    == (IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rs2_out_REG)));
    vlTOPp->core__DOT__Forwarding__DOT___T_4 = (((IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_reg_w_out_REG) 
                                                 & (0U 
                                                    != (IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rd_out_REG))) 
                                                & ((IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rd_out_REG) 
                                                   == (IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rs1_out_REG)));
    vlTOPp->core__DOT__DataMemory__DOT___GEN_92 = (
                                                   (0U 
                                                    == (IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_fun3out_REG))
                                                    ? 
                                                   ((0U 
                                                     == 
                                                     (3U 
                                                      & vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG))
                                                     ? 
                                                    ((((0x80U 
                                                        & (IData)(vlTOPp->core__DOT__DataMemory__DOT__tempread_0))
                                                        ? 0xffffffU
                                                        : 0U) 
                                                      << 8U) 
                                                     | (IData)(vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo))
                                                     : 
                                                    ((1U 
                                                      == 
                                                      (3U 
                                                       & vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG))
                                                      ? 
                                                     ((((0x80U 
                                                         & (IData)(vlTOPp->core__DOT__DataMemory__DOT__tempread_1))
                                                         ? 0xffffffU
                                                         : 0U) 
                                                       << 8U) 
                                                      | (IData)(vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo_1))
                                                      : 
                                                     ((2U 
                                                       == 
                                                       (3U 
                                                        & vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG))
                                                       ? 
                                                      ((((0x80U 
                                                          & (IData)(vlTOPp->core__DOT__DataMemory__DOT__tempread_2))
                                                          ? 0xffffffU
                                                          : 0U) 
                                                        << 8U) 
                                                       | (IData)(vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo_2))
                                                       : vlTOPp->core__DOT__DataMemory__DOT___GEN_82)))
                                                    : 
                                                   ((1U 
                                                     == (IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_fun3out_REG))
                                                     ? 
                                                    ((0U 
                                                      == 
                                                      (3U 
                                                       & vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG))
                                                      ? 
                                                     ((((0x80U 
                                                         & (IData)(vlTOPp->core__DOT__DataMemory__DOT__tempread_0))
                                                         ? 0xffffU
                                                         : 0U) 
                                                       << 0x10U) 
                                                      | (((IData)(vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo) 
                                                          << 8U) 
                                                         | (IData)(vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo_1)))
                                                      : 
                                                     ((1U 
                                                       == 
                                                       (3U 
                                                        & vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG))
                                                       ? 
                                                      ((((0x80U 
                                                          & (IData)(vlTOPp->core__DOT__DataMemory__DOT__tempread_1))
                                                          ? 0xffffU
                                                          : 0U) 
                                                        << 0x10U) 
                                                       | (((IData)(vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo_1) 
                                                           << 8U) 
                                                          | (IData)(vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo_2)))
                                                       : 
                                                      ((2U 
                                                        == 
                                                        (3U 
                                                         & vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG))
                                                        ? 
                                                       ((((0x80U 
                                                           & (IData)(vlTOPp->core__DOT__DataMemory__DOT__tempread_2))
                                                           ? 0xffffU
                                                           : 0U) 
                                                         << 0x10U) 
                                                        | (((IData)(vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo_2) 
                                                            << 8U) 
                                                           | (IData)(vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo_3)))
                                                        : vlTOPp->core__DOT__DataMemory__DOT___GEN_82)))
                                                     : 
                                                    ((2U 
                                                      == (IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_fun3out_REG))
                                                      ? 
                                                     (((IData)(vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo_3) 
                                                       << 0x18U) 
                                                      | (((IData)(vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo_2) 
                                                          << 0x10U) 
                                                         | (((IData)(vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo_1) 
                                                             << 8U) 
                                                            | (IData)(vlTOPp->core__DOT__DataMemory__DOT__io_dataOut_lo))))
                                                      : 0U)));
    vlTOPp->core__DOT__Forwarding__DOT___T_44 = ((((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
                                                   & (0U 
                                                      != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) 
                                                  & ((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG) 
                                                     == (IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rs2_out_REG))) 
                                                 & (~ (IData)(vlTOPp->core__DOT__Forwarding__DOT___T_11)));
    vlTOPp->core__DOT__Forwarding__DOT___GEN_3 = (((IData)(vlTOPp->core__DOT__Forwarding__DOT___T_4) 
                                                   & ((IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rd_out_REG) 
                                                      == (IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rs2_out_REG)))
                                                   ? 2U
                                                   : 
                                                  ((IData)(vlTOPp->core__DOT__Forwarding__DOT___T_11)
                                                    ? 0U
                                                    : 
                                                   ((IData)(vlTOPp->core__DOT__Forwarding__DOT___T_4)
                                                     ? 2U
                                                     : 0U)));
    vlTOPp->core__DOT__Forwarding__DOT___T_32 = (((
                                                   ((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
                                                    & (0U 
                                                       != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) 
                                                   & ((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG) 
                                                      == (IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rs1_out_REG))) 
                                                  & ((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG) 
                                                     == (IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rs2_out_REG))) 
                                                 & (~ 
                                                    ((IData)(vlTOPp->core__DOT__Forwarding__DOT___T_4) 
                                                     & ((IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rd_out_REG) 
                                                        == (IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rs2_out_REG)))));
    vlTOPp->core__DOT__DataMemory_io_dataOut = ((IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memRd_out_REG)
                                                 ? vlTOPp->core__DOT__DataMemory__DOT___GEN_92
                                                 : 0U);
    vlTOPp->core__DOT__IF_ID___DOT__S_instr = ((IData)(vlTOPp->reset)
                                                ? 0U
                                                : ((IData)(vlTOPp->core__DOT__HazardDetect_io_pc_forward)
                                                    ? vlTOPp->core__DOT__Instruction_F
                                                    : 
                                                   ((1U 
                                                     == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                                     ? 
                                                    (((IData)(vlTOPp->core__DOT__Branch_M_io_br_taken) 
                                                      & (IData)(vlTOPp->core__DOT__control_module_io_branch))
                                                      ? 0U
                                                      : vlTOPp->core__DOT__Instruction_F)
                                                     : 
                                                    ((2U 
                                                      == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                                      ? 0U
                                                      : 
                                                     ((3U 
                                                       == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                                       ? 0U
                                                       : vlTOPp->core__DOT__Instruction_F)))));
    if (vlTOPp->core__DOT__Forwarding__DOT___T_32) {
        vlTOPp->core__DOT__Forwarding_io_forward_a = 1U;
        vlTOPp->core__DOT__Forwarding_io_forward_b = 1U;
    } else {
        vlTOPp->core__DOT__Forwarding_io_forward_a 
            = ((IData)(vlTOPp->core__DOT__Forwarding__DOT___T_44)
                ? (IData)(vlTOPp->core__DOT__Forwarding__DOT___GEN_3)
                : (((((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_reg_w_out_REG) 
                      & (0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG))) 
                     & ((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG) 
                        == (IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rs1_out_REG))) 
                    & (~ (IData)(vlTOPp->core__DOT__Forwarding__DOT___T_4)))
                    ? 1U : (IData)(vlTOPp->core__DOT__Forwarding__DOT___GEN_3)));
        vlTOPp->core__DOT__Forwarding_io_forward_b 
            = ((IData)(vlTOPp->core__DOT__Forwarding__DOT___T_44)
                ? 1U : (((IData)(vlTOPp->core__DOT__Forwarding__DOT___T_4) 
                         & ((IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rd_out_REG) 
                            == (IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rs2_out_REG)))
                         ? 2U : ((IData)(vlTOPp->core__DOT__Forwarding__DOT___T_11)
                                  ? 2U : 0U)));
    }
    vlTOPp->core__DOT__ALU_io_in_A = ((1U == (IData)(vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_OpA_out_REG))
                                       ? vlTOPp->core__DOT__ID_EX___DOT__io_IFID_pc4_out_REG
                                       : ((0U == (IData)(vlTOPp->core__DOT__Forwarding_io_forward_a))
                                           ? vlTOPp->core__DOT__ID_EX___DOT__io_rs1_data_out_REG
                                           : ((1U == (IData)(vlTOPp->core__DOT__Forwarding_io_forward_a))
                                               ? vlTOPp->core__DOT__d
                                               : ((2U 
                                                   == (IData)(vlTOPp->core__DOT__Forwarding_io_forward_a))
                                                   ? vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG
                                                   : vlTOPp->core__DOT__ID_EX___DOT__io_rs1_data_out_REG))));
    vlTOPp->core__DOT___GEN_53 = ((1U == (IData)(vlTOPp->core__DOT__Forwarding_io_forward_b))
                                   ? vlTOPp->core__DOT__d
                                   : ((2U == (IData)(vlTOPp->core__DOT__Forwarding_io_forward_b))
                                       ? vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG
                                       : 0U));
    vlTOPp->core__DOT__control_module__DOT___GEN_5 
        = ((0x37U == (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
           | (0x17U == (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr)));
    vlTOPp->core__DOT__control_module__DOT___GEN_51 
        = ((0x13U != (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
           & ((0x23U != (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
              & (3U == (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr))));
    vlTOPp->core__DOT__HazardDetect_io_ctrl_forward 
        = ((IData)(vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_MemRd_out_REG) 
           & (((IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rd_out_REG) 
               == (0x1fU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                            >> 0xfU))) | ((IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rd_out_REG) 
                                          == (0x1fU 
                                              & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                 >> 0x14U)))));
    vlTOPp->core__DOT__Structural_io_fwd_rs1 = ((IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_reg_w_out_REG) 
                                                & ((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG) 
                                                   == 
                                                   (0x1fU 
                                                    & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                       >> 0xfU))));
    vlTOPp->core__DOT__Structural_io_fwd_rs2 = ((IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_reg_w_out_REG) 
                                                & ((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG) 
                                                   == 
                                                   (0x1fU 
                                                    & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                       >> 0x14U))));
    vlTOPp->core__DOT__HazardDetect_io_inst_forward 
        = ((IData)(vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_MemRd_out_REG) 
           & (((IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rd_out_REG) 
               == (0x1fU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                            >> 0xfU))) | ((IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rd_out_REG) 
                                          == (0x1fU 
                                              & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                 >> 0x14U)))));
    vlTOPp->core__DOT__control_module_io_next_pc_sel 
        = ((0x33U == (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
            ? 0U : ((0x13U == (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                     ? 0U : ((0x23U == (0x7fU & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                              ? 0U : ((3U == (0x7fU 
                                              & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                       ? 0U : ((0x63U 
                                                == 
                                                (0x7fU 
                                                 & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                ? 1U
                                                : (
                                                   (0x6fU 
                                                    == 
                                                    (0x7fU 
                                                     & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                    ? 2U
                                                    : 
                                                   ((0x67U 
                                                     == 
                                                     (0x7fU 
                                                      & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                     ? 3U
                                                     : 0U)))))));
    vlTOPp->core__DOT__ImmGen_io_I_type = ((((0x80000000U 
                                              & vlTOPp->core__DOT__IF_ID___DOT__S_instr)
                                              ? 0xfffffU
                                              : 0U) 
                                            << 0xcU) 
                                           | (0xfffU 
                                              & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                 >> 0x14U)));
    vlTOPp->core__DOT__HazardDetect_io_pc_forward = 
        ((IData)(vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_MemRd_out_REG) 
         & (((IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rd_out_REG) 
             == (0x1fU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                          >> 0xfU))) | ((IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rd_out_REG) 
                                        == (0x1fU & 
                                            (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                             >> 0x14U)))));
    vlTOPp->core__DOT__control_module_io_extend = (
                                                   (0x33U 
                                                    == 
                                                    (0x7fU 
                                                     & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                    ? 0U
                                                    : 
                                                   ((0x13U 
                                                     == 
                                                     (0x7fU 
                                                      & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                     ? 0U
                                                     : 
                                                    ((0x23U 
                                                      == 
                                                      (0x7fU 
                                                       & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                      ? 1U
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
                                                         ? 0U
                                                         : 
                                                        ((0x67U 
                                                          == 
                                                          (0x7fU 
                                                           & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                          ? 0U
                                                          : 
                                                         ((0x37U 
                                                           == 
                                                           (0x7fU 
                                                            & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                           ? 2U
                                                           : 
                                                          ((0x17U 
                                                            == 
                                                            (0x7fU 
                                                             & vlTOPp->core__DOT__IF_ID___DOT__S_instr))
                                                            ? 2U
                                                            : 0U)))))))));
    vlTOPp->core__DOT__Branch_Forward__DOT___T_37 = 
        ((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG) 
         == (0x1fU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                      >> 0xfU)));
    vlTOPp->core__DOT__Branch_Forward__DOT___GEN_5 
        = (((0U != (IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rd_out_REG)) 
            & (~ (IData)(vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_MemRd_out_REG))) 
           & ((((IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rd_out_REG) 
                == (0x1fU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                             >> 0xfU))) & ((IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rd_out_REG) 
                                           == (0x1fU 
                                               & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                  >> 0x14U)))) 
              | ((IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rd_out_REG) 
                 == (0x1fU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                              >> 0xfU)))));
    vlTOPp->core__DOT__control_module_io_branch = (
                                                   (0x33U 
                                                    != 
                                                    (0x7fU 
                                                     & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                                   & ((0x13U 
                                                       != 
                                                       (0x7fU 
                                                        & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                                      & ((0x23U 
                                                          != 
                                                          (0x7fU 
                                                           & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                                         & ((3U 
                                                             != 
                                                             (0x7fU 
                                                              & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                                            & (0x63U 
                                                               == 
                                                               (0x7fU 
                                                                & vlTOPp->core__DOT__IF_ID___DOT__S_instr))))));
    vlTOPp->core__DOT__RegFile_io_rs2 = ((((0x33U == 
                                            (0x7fU 
                                             & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                           | (0x23U 
                                              == (0x7fU 
                                                  & vlTOPp->core__DOT__IF_ID___DOT__S_instr))) 
                                          | (0x63U 
                                             == (0x7fU 
                                                 & vlTOPp->core__DOT__IF_ID___DOT__S_instr)))
                                          ? (0x1fU 
                                             & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                >> 0x14U))
                                          : 0U);
    vlTOPp->core__DOT__RegFile_io_rs1 = (((((((0x33U 
                                               == (0x7fU 
                                                   & vlTOPp->core__DOT__IF_ID___DOT__S_instr)) 
                                              | (0x13U 
                                                 == 
                                                 (0x7fU 
                                                  & vlTOPp->core__DOT__IF_ID___DOT__S_instr))) 
                                             | (0x23U 
                                                == 
                                                (0x7fU 
                                                 & vlTOPp->core__DOT__IF_ID___DOT__S_instr))) 
                                            | (3U == 
                                               (0x7fU 
                                                & vlTOPp->core__DOT__IF_ID___DOT__S_instr))) 
                                           | (0x63U 
                                              == (0x7fU 
                                                  & vlTOPp->core__DOT__IF_ID___DOT__S_instr))) 
                                          | (0x67U 
                                             == (0x7fU 
                                                 & vlTOPp->core__DOT__IF_ID___DOT__S_instr)))
                                          ? (0x1fU 
                                             & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                >> 0xfU))
                                          : 0U);
    vlTOPp->core__DOT__Branch_Forward__DOT___T_13 = 
        ((IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rd_out_REG) 
         == (0x1fU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                      >> 0x14U)));
    vlTOPp->core__DOT__Branch_Forward__DOT___T_12 = 
        ((IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rd_out_REG) 
         == (0x1fU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                      >> 0xfU)));
    vlTOPp->core__DOT__Branch_Forward__DOT___T_5 = 
        ((IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rd_out_REG) 
         == (0x1fU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                      >> 0x14U)));
    vlTOPp->core__DOT__Branch_Forward__DOT___T_4 = 
        ((IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rd_out_REG) 
         == (0x1fU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                      >> 0xfU)));
    vlTOPp->core__DOT__ALU_io_in_B = ((IData)(vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_OpB_out_REG)
                                       ? vlTOPp->core__DOT__ID_EX___DOT__io_imm_out_REG
                                       : ((0U == (IData)(vlTOPp->core__DOT__Forwarding_io_forward_b))
                                           ? vlTOPp->core__DOT__ID_EX___DOT__io_rs2_data_out_REG
                                           : vlTOPp->core__DOT___GEN_53));
    if (vlTOPp->core__DOT__HazardDetect_io_inst_forward) {
        vlTOPp->core__DOT__PC_for = ((IData)(vlTOPp->core__DOT__HazardDetect_io_inst_forward)
                                      ? vlTOPp->core__DOT__IF_ID___DOT__S_pc
                                      : 0U);
        vlTOPp->core__DOT__Instruction_F = ((IData)(vlTOPp->core__DOT__HazardDetect_io_inst_forward)
                                             ? vlTOPp->core__DOT__IF_ID___DOT__S_instr
                                             : 0U);
    } else {
        vlTOPp->core__DOT__PC_for = vlTOPp->core__DOT__PC__DOT__PC;
        vlTOPp->core__DOT__Instruction_F = vlTOPp->core__DOT__InstMemory__DOT__imem
            [(0x3ffU & (vlTOPp->core__DOT__PC__DOT__PC 
                        >> 2U))];
    }
    vlTOPp->core__DOT___GEN_9 = ((1U == (IData)(vlTOPp->core__DOT__control_module_io_extend))
                                  ? ((((0x80000000U 
                                        & vlTOPp->core__DOT__IF_ID___DOT__S_instr)
                                        ? 0xfffffU : 0U) 
                                      << 0xcU) | ((0xfe0U 
                                                   & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                      >> 0x14U)) 
                                                  | (0x1fU 
                                                     & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                        >> 7U))))
                                  : ((2U == (IData)(vlTOPp->core__DOT__control_module_io_extend))
                                      ? (0xfffff000U 
                                         & vlTOPp->core__DOT__IF_ID___DOT__S_instr)
                                      : 0U));
    vlTOPp->core__DOT__RegFile__DOT___GEN_53 = ((0x15U 
                                                 == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                 ? vlTOPp->core__DOT__RegFile__DOT__regfile_21
                                                 : 
                                                ((0x14U 
                                                  == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                  ? vlTOPp->core__DOT__RegFile__DOT__regfile_20
                                                  : 
                                                 ((0x13U 
                                                   == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                   ? vlTOPp->core__DOT__RegFile__DOT__regfile_19
                                                   : 
                                                  ((0x12U 
                                                    == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                    ? vlTOPp->core__DOT__RegFile__DOT__regfile_18
                                                    : 
                                                   ((0x11U 
                                                     == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                     ? vlTOPp->core__DOT__RegFile__DOT__regfile_17
                                                     : 
                                                    ((0x10U 
                                                      == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                      ? vlTOPp->core__DOT__RegFile__DOT__regfile_16
                                                      : 
                                                     ((0xfU 
                                                       == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                       ? vlTOPp->core__DOT__RegFile__DOT__regfile_15
                                                       : 
                                                      ((0xeU 
                                                        == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                        ? vlTOPp->core__DOT__RegFile__DOT__regfile_14
                                                        : 
                                                       ((0xdU 
                                                         == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                         ? vlTOPp->core__DOT__RegFile__DOT__regfile_13
                                                         : 
                                                        ((0xcU 
                                                          == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                          ? vlTOPp->core__DOT__RegFile__DOT__regfile_12
                                                          : 
                                                         ((0xbU 
                                                           == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                           ? vlTOPp->core__DOT__RegFile__DOT__regfile_11
                                                           : 
                                                          ((0xaU 
                                                            == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                            ? vlTOPp->core__DOT__RegFile__DOT__regfile_10
                                                            : 
                                                           ((9U 
                                                             == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                             ? vlTOPp->core__DOT__RegFile__DOT__regfile_9
                                                             : 
                                                            ((8U 
                                                              == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                              ? vlTOPp->core__DOT__RegFile__DOT__regfile_8
                                                              : 
                                                             ((7U 
                                                               == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                               ? vlTOPp->core__DOT__RegFile__DOT__regfile_7
                                                               : 
                                                              ((6U 
                                                                == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                                ? vlTOPp->core__DOT__RegFile__DOT__regfile_6
                                                                : 
                                                               ((5U 
                                                                 == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                                 ? vlTOPp->core__DOT__RegFile__DOT__regfile_5
                                                                 : 
                                                                ((4U 
                                                                  == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                                  ? vlTOPp->core__DOT__RegFile__DOT__regfile_4
                                                                  : 
                                                                 ((3U 
                                                                   == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                                   ? vlTOPp->core__DOT__RegFile__DOT__regfile_3
                                                                   : 
                                                                  ((2U 
                                                                    == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                                    ? vlTOPp->core__DOT__RegFile__DOT__regfile_2
                                                                    : 
                                                                   ((1U 
                                                                     == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                                     ? vlTOPp->core__DOT__RegFile__DOT__regfile_1
                                                                     : vlTOPp->core__DOT__RegFile__DOT__regfile_0)))))))))))))))))))));
    vlTOPp->core__DOT__RegFile__DOT___GEN_21 = ((0x15U 
                                                 == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                 ? vlTOPp->core__DOT__RegFile__DOT__regfile_21
                                                 : 
                                                ((0x14U 
                                                  == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                  ? vlTOPp->core__DOT__RegFile__DOT__regfile_20
                                                  : 
                                                 ((0x13U 
                                                   == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                   ? vlTOPp->core__DOT__RegFile__DOT__regfile_19
                                                   : 
                                                  ((0x12U 
                                                    == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                    ? vlTOPp->core__DOT__RegFile__DOT__regfile_18
                                                    : 
                                                   ((0x11U 
                                                     == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                     ? vlTOPp->core__DOT__RegFile__DOT__regfile_17
                                                     : 
                                                    ((0x10U 
                                                      == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                      ? vlTOPp->core__DOT__RegFile__DOT__regfile_16
                                                      : 
                                                     ((0xfU 
                                                       == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                       ? vlTOPp->core__DOT__RegFile__DOT__regfile_15
                                                       : 
                                                      ((0xeU 
                                                        == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                        ? vlTOPp->core__DOT__RegFile__DOT__regfile_14
                                                        : 
                                                       ((0xdU 
                                                         == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                         ? vlTOPp->core__DOT__RegFile__DOT__regfile_13
                                                         : 
                                                        ((0xcU 
                                                          == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                          ? vlTOPp->core__DOT__RegFile__DOT__regfile_12
                                                          : 
                                                         ((0xbU 
                                                           == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                           ? vlTOPp->core__DOT__RegFile__DOT__regfile_11
                                                           : 
                                                          ((0xaU 
                                                            == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                            ? vlTOPp->core__DOT__RegFile__DOT__regfile_10
                                                            : 
                                                           ((9U 
                                                             == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                             ? vlTOPp->core__DOT__RegFile__DOT__regfile_9
                                                             : 
                                                            ((8U 
                                                              == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                              ? vlTOPp->core__DOT__RegFile__DOT__regfile_8
                                                              : 
                                                             ((7U 
                                                               == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                               ? vlTOPp->core__DOT__RegFile__DOT__regfile_7
                                                               : 
                                                              ((6U 
                                                                == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                                ? vlTOPp->core__DOT__RegFile__DOT__regfile_6
                                                                : 
                                                               ((5U 
                                                                 == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                                 ? vlTOPp->core__DOT__RegFile__DOT__regfile_5
                                                                 : 
                                                                ((4U 
                                                                  == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                                  ? vlTOPp->core__DOT__RegFile__DOT__regfile_4
                                                                  : 
                                                                 ((3U 
                                                                   == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                                   ? vlTOPp->core__DOT__RegFile__DOT__regfile_3
                                                                   : 
                                                                  ((2U 
                                                                    == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                                    ? vlTOPp->core__DOT__RegFile__DOT__regfile_2
                                                                    : 
                                                                   ((1U 
                                                                     == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                                     ? vlTOPp->core__DOT__RegFile__DOT__regfile_1
                                                                     : vlTOPp->core__DOT__RegFile__DOT__regfile_0)))))))))))))))))))));
    vlTOPp->core__DOT__Branch_Forward__DOT___T_49 = 
        ((0U != (IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rd_out_REG)) 
         & (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_12));
    vlTOPp->core__DOT__Branch_Forward__DOT___GEN_6 
        = (((0U != (IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rd_out_REG)) 
            & (~ (IData)(vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_MemRd_out_REG))) 
           & ((((IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rd_out_REG) 
                == (0x1fU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                             >> 0xfU))) & ((IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rd_out_REG) 
                                           == (0x1fU 
                                               & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                  >> 0x14U)))) 
              | ((~ (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_4)) 
                 & (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_5))));
    vlTOPp->core__DOT__Branch_Forward__DOT___T_20 = 
        (1U & (~ (((0U != (IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rd_out_REG)) 
                   & (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_4)) 
                  & (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_5))));
    vlTOPp->core__DOT__Branch_Forward__DOT___T_17 = 
        ((0U != (IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rd_out_REG)) 
         & (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_4));
    vlTOPp->core__DOT__ALU__DOT___result_T_2 = (vlTOPp->core__DOT__ALU_io_in_A 
                                                + vlTOPp->core__DOT__ALU_io_in_B);
    vlTOPp->core__DOT__ALU__DOT___result_T_8 = (VL_LTS_III(1,32,32, vlTOPp->core__DOT__ALU_io_in_A, vlTOPp->core__DOT__ALU_io_in_B)
                                                 ? 1U
                                                 : 0U);
    vlTOPp->core__DOT__ALU__DOT___result_T_12 = ((vlTOPp->core__DOT__ALU_io_in_A 
                                                  < vlTOPp->core__DOT__ALU_io_in_B)
                                                  ? 1U
                                                  : 0U);
    vlTOPp->core__DOT__ALU__DOT___GEN_6 = (((4U == 
                                             (0x1fU 
                                              & (IData)(vlTOPp->core__DOT__ALU_Control__DOT___GEN_4))) 
                                            | (4U == 
                                               (0x1fU 
                                                & (IData)(vlTOPp->core__DOT__ALU_Control__DOT___GEN_4))))
                                            ? (vlTOPp->core__DOT__ALU_io_in_A 
                                               ^ vlTOPp->core__DOT__ALU_io_in_B)
                                            : (((5U 
                                                 == 
                                                 (0x1fU 
                                                  & (IData)(vlTOPp->core__DOT__ALU_Control__DOT___GEN_4))) 
                                                | (5U 
                                                   == 
                                                   (0x1fU 
                                                    & (IData)(vlTOPp->core__DOT__ALU_Control__DOT___GEN_4))))
                                                ? (vlTOPp->core__DOT__ALU_io_in_A 
                                                   >> 
                                                   (0x1fU 
                                                    & vlTOPp->core__DOT__ALU_io_in_B))
                                                : (
                                                   ((6U 
                                                     == 
                                                     (0x1fU 
                                                      & (IData)(vlTOPp->core__DOT__ALU_Control__DOT___GEN_4))) 
                                                    | (6U 
                                                       == 
                                                       (0x1fU 
                                                        & (IData)(vlTOPp->core__DOT__ALU_Control__DOT___GEN_4))))
                                                    ? 
                                                   (vlTOPp->core__DOT__ALU_io_in_A 
                                                    | vlTOPp->core__DOT__ALU_io_in_B)
                                                    : 
                                                   (((7U 
                                                      == 
                                                      (0x1fU 
                                                       & (IData)(vlTOPp->core__DOT__ALU_Control__DOT___GEN_4))) 
                                                     | (7U 
                                                        == 
                                                        (0x1fU 
                                                         & (IData)(vlTOPp->core__DOT__ALU_Control__DOT___GEN_4))))
                                                     ? 
                                                    (vlTOPp->core__DOT__ALU_io_in_A 
                                                     & vlTOPp->core__DOT__ALU_io_in_B)
                                                     : 
                                                    ((8U 
                                                      == 
                                                      (0x1fU 
                                                       & (IData)(vlTOPp->core__DOT__ALU_Control__DOT___GEN_4)))
                                                      ? 
                                                     (vlTOPp->core__DOT__ALU_io_in_A 
                                                      - vlTOPp->core__DOT__ALU_io_in_B)
                                                      : 
                                                     (((0xdU 
                                                        == 
                                                        (0x1fU 
                                                         & (IData)(vlTOPp->core__DOT__ALU_Control__DOT___GEN_4))) 
                                                       | (0xdU 
                                                          == 
                                                          (0x1fU 
                                                           & (IData)(vlTOPp->core__DOT__ALU_Control__DOT___GEN_4))))
                                                       ? 
                                                      VL_SHIFTRS_III(32,32,5, vlTOPp->core__DOT__ALU_io_in_A, 
                                                                     (0x1fU 
                                                                      & vlTOPp->core__DOT__ALU_io_in_B))
                                                       : 
                                                      (((0x1fU 
                                                         == 
                                                         (0x1fU 
                                                          & (IData)(vlTOPp->core__DOT__ALU_Control__DOT___GEN_4))) 
                                                        | (0x1fU 
                                                           == 
                                                           (0x1fU 
                                                            & (IData)(vlTOPp->core__DOT__ALU_Control__DOT___GEN_4))))
                                                        ? vlTOPp->core__DOT__ALU_io_in_A
                                                        : 0U)))))));
    vlTOPp->core__DOT__RegFile_io_rdata2 = ((0U == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                             ? 0U : 
                                            ((0x1fU 
                                              == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                              ? vlTOPp->core__DOT__RegFile__DOT__regfile_31
                                              : ((0x1eU 
                                                  == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                  ? vlTOPp->core__DOT__RegFile__DOT__regfile_30
                                                  : 
                                                 ((0x1dU 
                                                   == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                   ? vlTOPp->core__DOT__RegFile__DOT__regfile_29
                                                   : 
                                                  ((0x1cU 
                                                    == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                    ? vlTOPp->core__DOT__RegFile__DOT__regfile_28
                                                    : 
                                                   ((0x1bU 
                                                     == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                     ? vlTOPp->core__DOT__RegFile__DOT__regfile_27
                                                     : 
                                                    ((0x1aU 
                                                      == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                      ? vlTOPp->core__DOT__RegFile__DOT__regfile_26
                                                      : 
                                                     ((0x19U 
                                                       == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                       ? vlTOPp->core__DOT__RegFile__DOT__regfile_25
                                                       : 
                                                      ((0x18U 
                                                        == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                        ? vlTOPp->core__DOT__RegFile__DOT__regfile_24
                                                        : 
                                                       ((0x17U 
                                                         == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                         ? vlTOPp->core__DOT__RegFile__DOT__regfile_23
                                                         : 
                                                        ((0x16U 
                                                          == (IData)(vlTOPp->core__DOT__RegFile_io_rs2))
                                                          ? vlTOPp->core__DOT__RegFile__DOT__regfile_22
                                                          : vlTOPp->core__DOT__RegFile__DOT___GEN_53)))))))))));
    vlTOPp->core__DOT__RegFile_io_rdata1 = ((0U == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                             ? 0U : 
                                            ((0x1fU 
                                              == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                              ? vlTOPp->core__DOT__RegFile__DOT__regfile_31
                                              : ((0x1eU 
                                                  == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                  ? vlTOPp->core__DOT__RegFile__DOT__regfile_30
                                                  : 
                                                 ((0x1dU 
                                                   == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                   ? vlTOPp->core__DOT__RegFile__DOT__regfile_29
                                                   : 
                                                  ((0x1cU 
                                                    == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                    ? vlTOPp->core__DOT__RegFile__DOT__regfile_28
                                                    : 
                                                   ((0x1bU 
                                                     == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                     ? vlTOPp->core__DOT__RegFile__DOT__regfile_27
                                                     : 
                                                    ((0x1aU 
                                                      == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                      ? vlTOPp->core__DOT__RegFile__DOT__regfile_26
                                                      : 
                                                     ((0x19U 
                                                       == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                       ? vlTOPp->core__DOT__RegFile__DOT__regfile_25
                                                       : 
                                                      ((0x18U 
                                                        == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                        ? vlTOPp->core__DOT__RegFile__DOT__regfile_24
                                                        : 
                                                       ((0x17U 
                                                         == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                         ? vlTOPp->core__DOT__RegFile__DOT__regfile_23
                                                         : 
                                                        ((0x16U 
                                                          == (IData)(vlTOPp->core__DOT__RegFile_io_rs1))
                                                          ? vlTOPp->core__DOT__RegFile__DOT__regfile_22
                                                          : vlTOPp->core__DOT__RegFile__DOT___GEN_21)))))))))));
    if (((0U != (IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rd_out_REG)) 
         & (~ (IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memRd_out_REG)))) {
        vlTOPp->core__DOT__Branch_Forward__DOT___GEN_13 
            = (((((IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rd_out_REG) 
                  == (0x1fU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                               >> 0xfU))) & ((IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rd_out_REG) 
                                             == (0x1fU 
                                                 & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                    >> 0x14U)))) 
                & (~ (((0U != (IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rd_out_REG)) 
                       & (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_4)) 
                      & (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_5))))
                ? 2U : (((IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_12) 
                         & (~ (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_17)))
                         ? (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___GEN_6)
                         : (((IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_13) 
                             & (~ ((0U != (IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rd_out_REG)) 
                                   & (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_5))))
                             ? 2U : (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___GEN_6))));
        vlTOPp->core__DOT__Branch_Forward__DOT___GEN_12 
            = (((((IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rd_out_REG) 
                  == (0x1fU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                               >> 0xfU))) & ((IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rd_out_REG) 
                                             == (0x1fU 
                                                 & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                    >> 0x14U)))) 
                & (~ (((0U != (IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rd_out_REG)) 
                       & (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_4)) 
                      & (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_5))))
                ? 2U : (((IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_12) 
                         & (~ (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_17)))
                         ? 2U : (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___GEN_5)));
    } else {
        vlTOPp->core__DOT__Branch_Forward__DOT___GEN_13 
            = vlTOPp->core__DOT__Branch_Forward__DOT___GEN_6;
        vlTOPp->core__DOT__Branch_Forward__DOT___GEN_12 
            = vlTOPp->core__DOT__Branch_Forward__DOT___GEN_5;
    }
    vlTOPp->core__DOT__ALU__DOT___GEN_8 = (((2U == 
                                             (0x1fU 
                                              & (IData)(vlTOPp->core__DOT__ALU_Control__DOT___GEN_4))) 
                                            | (2U == 
                                               (0x1fU 
                                                & (IData)(vlTOPp->core__DOT__ALU_Control__DOT___GEN_4))))
                                            ? ((0xfffffffcU 
                                                & ((- (IData)(
                                                              (1U 
                                                               & ((IData)(vlTOPp->core__DOT__ALU__DOT___result_T_8) 
                                                                  >> 1U)))) 
                                                   << 2U)) 
                                               | (IData)(vlTOPp->core__DOT__ALU__DOT___result_T_8))
                                            : (((3U 
                                                 == 
                                                 (0x1fU 
                                                  & (IData)(vlTOPp->core__DOT__ALU_Control__DOT___GEN_4))) 
                                                | (3U 
                                                   == 
                                                   (0x1fU 
                                                    & (IData)(vlTOPp->core__DOT__ALU_Control__DOT___GEN_4))))
                                                ? (
                                                   (0xfffffffcU 
                                                    & ((- (IData)(
                                                                  (1U 
                                                                   & ((IData)(vlTOPp->core__DOT__ALU__DOT___result_T_12) 
                                                                      >> 1U)))) 
                                                       << 2U)) 
                                                   | (IData)(vlTOPp->core__DOT__ALU__DOT___result_T_12))
                                                : vlTOPp->core__DOT__ALU__DOT___GEN_6));
    if (vlTOPp->core__DOT__control_module_io_branch) {
        vlTOPp->core__DOT__Branch_Forward__DOT___GEN_28 
            = (((0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)) 
                & (~ (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_memRd_out_REG)))
                ? ((((((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG) 
                       == (0x1fU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                    >> 0xfU))) & ((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG) 
                                                  == 
                                                  (0x1fU 
                                                   & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                      >> 0x14U)))) 
                     & (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_20)) 
                    & (~ (((0U != (IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rd_out_REG)) 
                           & (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_12)) 
                          & (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_13))))
                    ? 3U : ((((IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_37) 
                              & (~ (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_17))) 
                             & (~ (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_49)))
                             ? (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___GEN_13)
                             : (((((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG) 
                                   == (0x1fU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                >> 0x14U))) 
                                  & (~ ((0U != (IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rd_out_REG)) 
                                        & (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_5)))) 
                                 & (~ ((0U != (IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rd_out_REG)) 
                                       & (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_13))))
                                 ? 3U : (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___GEN_13))))
                : (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___GEN_13));
        vlTOPp->core__DOT__Branch_Forward_io_forward_rs1 
            = (((0U != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)) 
                & (~ (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_memRd_out_REG)))
                ? ((((((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG) 
                       == (0x1fU & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                    >> 0xfU))) & ((IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG) 
                                                  == 
                                                  (0x1fU 
                                                   & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                      >> 0x14U)))) 
                     & (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_20)) 
                    & (~ (((0U != (IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rd_out_REG)) 
                           & (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_12)) 
                          & (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_13))))
                    ? 3U : ((((IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_37) 
                              & (~ (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_17))) 
                             & (~ (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_49)))
                             ? 3U : (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___GEN_12)))
                : (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___GEN_12));
    } else {
        vlTOPp->core__DOT__Branch_Forward__DOT___GEN_28 = 0U;
        vlTOPp->core__DOT__Branch_Forward_io_forward_rs1 
            = ((IData)(vlTOPp->core__DOT__control_module_io_branch)
                ? 0U : ((((0U != (IData)(vlTOPp->core__DOT__ID_EX___DOT__io_rd_out_REG)) 
                          & (~ (IData)(vlTOPp->core__DOT__ID_EX___DOT__io_ctrl_MemRd_out_REG))) 
                         & (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_4))
                         ? 6U : (((((0U != (IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rd_out_REG)) 
                                    & (~ (IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memRd_out_REG))) 
                                   & (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_12)) 
                                  & (~ (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_17)))
                                  ? 7U : (((((0U != (IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_rd_out_REG)) 
                                             & (IData)(vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_memRd_out_REG)) 
                                            & (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_12)) 
                                           & (~ (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_17)))
                                           ? 9U : (
                                                   (((((0U 
                                                        != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)) 
                                                       & (~ (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_memRd_out_REG))) 
                                                      & (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_37)) 
                                                     & (~ (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_17))) 
                                                    & (~ (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_49)))
                                                    ? 8U
                                                    : 
                                                   ((((((0U 
                                                         != (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_rd_out_REG)) 
                                                        & (IData)(vlTOPp->core__DOT__MEM_WB_M__DOT__io_MEMWB_memRd_out_REG)) 
                                                       & (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_37)) 
                                                      & (~ (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_17))) 
                                                     & (~ (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___T_49)))
                                                     ? 0xaU
                                                     : 0U))))));
    }
    vlTOPp->core__DOT__ALU__DOT___GEN_10 = (0x7fffffffffffffffULL 
                                            & (((((((0U 
                                                     == 
                                                     (0x1fU 
                                                      & (IData)(vlTOPp->core__DOT__ALU_Control__DOT___GEN_4))) 
                                                    | (0U 
                                                       == 
                                                       (0x1fU 
                                                        & (IData)(vlTOPp->core__DOT__ALU_Control__DOT___GEN_4)))) 
                                                   | (0U 
                                                      == 
                                                      (0x1fU 
                                                       & (IData)(vlTOPp->core__DOT__ALU_Control__DOT___GEN_4)))) 
                                                  | (0U 
                                                     == 
                                                     (0x1fU 
                                                      & (IData)(vlTOPp->core__DOT__ALU_Control__DOT___GEN_4)))) 
                                                 | (0U 
                                                    == 
                                                    (0x1fU 
                                                     & (IData)(vlTOPp->core__DOT__ALU_Control__DOT___GEN_4)))) 
                                                | (0U 
                                                   == 
                                                   (0x1fU 
                                                    & (IData)(vlTOPp->core__DOT__ALU_Control__DOT___GEN_4))))
                                                ? (
                                                   ((QData)((IData)(
                                                                    (0x7fffffffU 
                                                                     & (- (IData)(
                                                                                (1U 
                                                                                & (vlTOPp->core__DOT__ALU__DOT___result_T_2 
                                                                                >> 0x1fU))))))) 
                                                    << 0x20U) 
                                                   | (QData)((IData)(vlTOPp->core__DOT__ALU__DOT___result_T_2)))
                                                : (
                                                   ((1U 
                                                     == 
                                                     (0x1fU 
                                                      & (IData)(vlTOPp->core__DOT__ALU_Control__DOT___GEN_4))) 
                                                    | (1U 
                                                       == 
                                                       (0x1fU 
                                                        & (IData)(vlTOPp->core__DOT__ALU_Control__DOT___GEN_4))))
                                                    ? 
                                                   ((QData)((IData)(vlTOPp->core__DOT__ALU_io_in_A)) 
                                                    << 
                                                    (0x1fU 
                                                     & vlTOPp->core__DOT__ALU_io_in_B))
                                                    : 
                                                   (((QData)((IData)(
                                                                     (0x7fffffffU 
                                                                      & (- (IData)(
                                                                                (1U 
                                                                                & (vlTOPp->core__DOT__ALU__DOT___GEN_8 
                                                                                >> 0x1fU))))))) 
                                                     << 0x20U) 
                                                    | (QData)((IData)(vlTOPp->core__DOT__ALU__DOT___GEN_8))))));
    vlTOPp->core__DOT___Branch_M_io_arg_y_T_7 = ((3U 
                                                  == (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___GEN_28))
                                                  ? vlTOPp->core__DOT__RegFile_io_w_data
                                                  : 
                                                 ((2U 
                                                   == (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___GEN_28))
                                                   ? vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG
                                                   : 
                                                  ((1U 
                                                    == (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___GEN_28))
                                                    ? (IData)(vlTOPp->core__DOT__ALU__DOT___GEN_10)
                                                    : 
                                                   ((0U 
                                                     == (IData)(vlTOPp->core__DOT__Branch_Forward__DOT___GEN_28))
                                                     ? vlTOPp->core__DOT__RegFile_io_rdata2
                                                     : 0U))));
    vlTOPp->core__DOT__Branch_M_io_arg_x = ((0xaU == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                             ? vlTOPp->core__DOT__RegFile_io_rdata1
                                             : ((9U 
                                                 == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                 ? vlTOPp->core__DOT__RegFile_io_rdata1
                                                 : 
                                                ((8U 
                                                  == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                  ? vlTOPp->core__DOT__RegFile_io_rdata1
                                                  : 
                                                 ((7U 
                                                   == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                   ? vlTOPp->core__DOT__RegFile_io_rdata1
                                                   : 
                                                  ((6U 
                                                    == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                    ? vlTOPp->core__DOT__RegFile_io_rdata1
                                                    : 
                                                   ((5U 
                                                     == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                     ? vlTOPp->core__DOT__RegFile_io_w_data
                                                     : 
                                                    ((4U 
                                                      == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                      ? vlTOPp->core__DOT__DataMemory_io_dataOut
                                                      : 
                                                     ((3U 
                                                       == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                       ? vlTOPp->core__DOT__RegFile_io_w_data
                                                       : 
                                                      ((2U 
                                                        == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                        ? vlTOPp->core__DOT__EX_MEM_M__DOT__io_EXMEM_alu_out_REG
                                                        : 
                                                       ((1U 
                                                         == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                         ? (IData)(vlTOPp->core__DOT__ALU__DOT___GEN_10)
                                                         : 
                                                        ((0U 
                                                          == (IData)(vlTOPp->core__DOT__Branch_Forward_io_forward_rs1))
                                                          ? vlTOPp->core__DOT__RegFile_io_rdata1
                                                          : 0U)))))))))));
    vlTOPp->core__DOT__Branch_M_io_br_taken = ((IData)(vlTOPp->core__DOT__control_module_io_branch) 
                                               & ((0U 
                                                   == 
                                                   (7U 
                                                    & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                       >> 0xcU)))
                                                   ? 
                                                  (vlTOPp->core__DOT__Branch_M_io_arg_x 
                                                   == vlTOPp->core__DOT___Branch_M_io_arg_y_T_7)
                                                   : 
                                                  ((1U 
                                                    == 
                                                    (7U 
                                                     & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                        >> 0xcU)))
                                                    ? 
                                                   (vlTOPp->core__DOT__Branch_M_io_arg_x 
                                                    != vlTOPp->core__DOT___Branch_M_io_arg_y_T_7)
                                                    : 
                                                   ((4U 
                                                     == 
                                                     (7U 
                                                      & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                         >> 0xcU)))
                                                     ? 
                                                    VL_LTS_III(1,32,32, vlTOPp->core__DOT__Branch_M_io_arg_x, vlTOPp->core__DOT___Branch_M_io_arg_y_T_7)
                                                     : 
                                                    ((5U 
                                                      == 
                                                      (7U 
                                                       & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                          >> 0xcU)))
                                                      ? 
                                                     VL_GTES_III(1,32,32, vlTOPp->core__DOT__Branch_M_io_arg_x, vlTOPp->core__DOT___Branch_M_io_arg_y_T_7)
                                                      : 
                                                     ((6U 
                                                       == 
                                                       (7U 
                                                        & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                           >> 0xcU)))
                                                       ? 
                                                      (vlTOPp->core__DOT__Branch_M_io_arg_x 
                                                       < vlTOPp->core__DOT___Branch_M_io_arg_y_T_7)
                                                       : 
                                                      ((7U 
                                                        == 
                                                        (7U 
                                                         & (vlTOPp->core__DOT__IF_ID___DOT__S_instr 
                                                            >> 0xcU))) 
                                                       & (vlTOPp->core__DOT__Branch_M_io_arg_x 
                                                          >= vlTOPp->core__DOT___Branch_M_io_arg_y_T_7))))))));
    vlTOPp->core__DOT__PC_io_in = ((IData)(vlTOPp->core__DOT__HazardDetect_io_pc_forward)
                                    ? vlTOPp->core__DOT__IF_ID___DOT__Pc4_In
                                    : ((1U == (IData)(vlTOPp->core__DOT__control_module_io_next_pc_sel))
                                        ? (((IData)(vlTOPp->core__DOT__Branch_M_io_br_taken) 
                                            & (IData)(vlTOPp->core__DOT__control_module_io_branch))
                                            ? (((((0x80000000U 
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
                                            ? (((((0x80000000U 
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
                                                ? (0xfffffffeU 
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
                                                : ((IData)(4U) 
                                                   + vlTOPp->core__DOT__PC__DOT__PC)))));
}

void Vcore::_eval(Vcore__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcore::_eval\n"); );
    Vcore* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    if (((IData)(vlTOPp->clock) & (~ (IData)(vlTOPp->__Vclklast__TOP__clock)))) {
        vlTOPp->_sequent__TOP__2(vlSymsp);
    }
    // Final
    vlTOPp->__Vclklast__TOP__clock = vlTOPp->clock;
}

VL_INLINE_OPT QData Vcore::_change_request(Vcore__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcore::_change_request\n"); );
    Vcore* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    return (vlTOPp->_change_request_1(vlSymsp));
}

VL_INLINE_OPT QData Vcore::_change_request_1(Vcore__Syms* __restrict vlSymsp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcore::_change_request_1\n"); );
    Vcore* const __restrict vlTOPp VL_ATTR_UNUSED = vlSymsp->TOPp;
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void Vcore::_eval_debug_assertions() {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vcore::_eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((clock & 0xfeU))) {
        Verilated::overWidthError("clock");}
    if (VL_UNLIKELY((reset & 0xfeU))) {
        Verilated::overWidthError("reset");}
}
#endif  // VL_DEBUG
