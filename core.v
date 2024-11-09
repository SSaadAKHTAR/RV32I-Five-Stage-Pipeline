module IF_ID(
  input         clock,
  input         reset,
  input  [31:0] io_pc4_in,
  input  [31:0] io_SelectedPC,
  input  [31:0] io_SelectedInstr,
  output [31:0] io_pc4_out,
  output [31:0] io_SelectedPC_out,
  output [31:0] io_SelectedInstr_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] Pc4_In; // @[IF_ID.scala 19:39]
  reg [31:0] S_pc; // @[IF_ID.scala 20:39]
  reg [31:0] S_instr; // @[IF_ID.scala 21:39]
  assign io_pc4_out = Pc4_In; // @[IF_ID.scala 29:29]
  assign io_SelectedPC_out = S_pc; // @[IF_ID.scala 30:29]
  assign io_SelectedInstr_out = S_instr; // @[IF_ID.scala 31:29]
  always @(posedge clock) begin
    if (reset) begin // @[IF_ID.scala 19:39]
      Pc4_In <= 32'h0; // @[IF_ID.scala 19:39]
    end else begin
      Pc4_In <= io_pc4_in; // @[IF_ID.scala 24:11]
    end
    if (reset) begin // @[IF_ID.scala 20:39]
      S_pc <= 32'sh0; // @[IF_ID.scala 20:39]
    end else begin
      S_pc <= io_SelectedPC; // @[IF_ID.scala 25:9]
    end
    if (reset) begin // @[IF_ID.scala 21:39]
      S_instr <= 32'h0; // @[IF_ID.scala 21:39]
    end else begin
      S_instr <= io_SelectedInstr; // @[IF_ID.scala 26:12]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  Pc4_In = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  S_pc = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  S_instr = _RAND_2[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ID_EX(
  input         clock,
  input  [4:0]  io_rs1_in,
  input  [4:0]  io_rs2_in,
  input  [31:0] io_rs1_data_in,
  input  [31:0] io_rs2_data_in,
  input  [31:0] io_imm,
  input  [4:0]  io_rd_in,
  input  [2:0]  io_func3_in,
  input         io_func7_in,
  input         io_ctrl_MemWr_in,
  input         io_ctrl_MemRd_in,
  input         io_ctrl_Reg_W_in,
  input         io_ctrl_MemToReg_in,
  input  [2:0]  io_ctrl_AluOp_in,
  input  [1:0]  io_ctrl_OpA_in,
  input         io_ctrl_OpB_in,
  input  [31:0] io_IFID_pc4_in,
  output [4:0]  io_rs1_out,
  output [4:0]  io_rs2_out,
  output [31:0] io_rs1_data_out,
  output [31:0] io_rs2_data_out,
  output [4:0]  io_rd_out,
  output [31:0] io_imm_out,
  output [2:0]  io_func3_out,
  output        io_func7_out,
  output        io_ctrl_MemWr_out,
  output        io_ctrl_MemRd_out,
  output        io_ctrl_Reg_W_out,
  output        io_ctrl_MemToReg_out,
  output [2:0]  io_ctrl_AluOp_out,
  output [1:0]  io_ctrl_OpA_out,
  output        io_ctrl_OpB_out,
  output [31:0] io_IFID_pc4_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
`endif // RANDOMIZE_REG_INIT
  reg [4:0] io_rs1_out_REG; // @[ID_EX.scala 46:36]
  reg [4:0] io_rs2_out_REG; // @[ID_EX.scala 47:36]
  reg [31:0] io_rs1_data_out_REG; // @[ID_EX.scala 48:36]
  reg [31:0] io_rs2_data_out_REG; // @[ID_EX.scala 49:36]
  reg [31:0] io_imm_out_REG; // @[ID_EX.scala 50:36]
  reg [4:0] io_rd_out_REG; // @[ID_EX.scala 51:36]
  reg [2:0] io_func3_out_REG; // @[ID_EX.scala 52:36]
  reg  io_func7_out_REG; // @[ID_EX.scala 53:36]
  reg  io_ctrl_MemWr_out_REG; // @[ID_EX.scala 54:36]
  reg  io_ctrl_MemRd_out_REG; // @[ID_EX.scala 56:36]
  reg  io_ctrl_Reg_W_out_REG; // @[ID_EX.scala 57:36]
  reg  io_ctrl_MemToReg_out_REG; // @[ID_EX.scala 58:36]
  reg [2:0] io_ctrl_AluOp_out_REG; // @[ID_EX.scala 59:36]
  reg [1:0] io_ctrl_OpA_out_REG; // @[ID_EX.scala 60:36]
  reg  io_ctrl_OpB_out_REG; // @[ID_EX.scala 61:36]
  reg [31:0] io_IFID_pc4_out_REG; // @[ID_EX.scala 63:36]
  assign io_rs1_out = io_rs1_out_REG; // @[ID_EX.scala 46:25]
  assign io_rs2_out = io_rs2_out_REG; // @[ID_EX.scala 47:25]
  assign io_rs1_data_out = io_rs1_data_out_REG; // @[ID_EX.scala 48:25]
  assign io_rs2_data_out = io_rs2_data_out_REG; // @[ID_EX.scala 49:25]
  assign io_rd_out = io_rd_out_REG; // @[ID_EX.scala 51:25]
  assign io_imm_out = io_imm_out_REG; // @[ID_EX.scala 50:25]
  assign io_func3_out = io_func3_out_REG; // @[ID_EX.scala 52:25]
  assign io_func7_out = io_func7_out_REG; // @[ID_EX.scala 53:25]
  assign io_ctrl_MemWr_out = io_ctrl_MemWr_out_REG; // @[ID_EX.scala 54:25]
  assign io_ctrl_MemRd_out = io_ctrl_MemRd_out_REG; // @[ID_EX.scala 56:25]
  assign io_ctrl_Reg_W_out = io_ctrl_Reg_W_out_REG; // @[ID_EX.scala 57:25]
  assign io_ctrl_MemToReg_out = io_ctrl_MemToReg_out_REG; // @[ID_EX.scala 58:25]
  assign io_ctrl_AluOp_out = io_ctrl_AluOp_out_REG; // @[ID_EX.scala 59:25]
  assign io_ctrl_OpA_out = io_ctrl_OpA_out_REG; // @[ID_EX.scala 60:25]
  assign io_ctrl_OpB_out = io_ctrl_OpB_out_REG; // @[ID_EX.scala 61:25]
  assign io_IFID_pc4_out = io_IFID_pc4_out_REG; // @[ID_EX.scala 63:25]
  always @(posedge clock) begin
    io_rs1_out_REG <= io_rs1_in; // @[ID_EX.scala 46:36]
    io_rs2_out_REG <= io_rs2_in; // @[ID_EX.scala 47:36]
    io_rs1_data_out_REG <= io_rs1_data_in; // @[ID_EX.scala 48:36]
    io_rs2_data_out_REG <= io_rs2_data_in; // @[ID_EX.scala 49:36]
    io_imm_out_REG <= io_imm; // @[ID_EX.scala 50:36]
    io_rd_out_REG <= io_rd_in; // @[ID_EX.scala 51:36]
    io_func3_out_REG <= io_func3_in; // @[ID_EX.scala 52:36]
    io_func7_out_REG <= io_func7_in; // @[ID_EX.scala 53:36]
    io_ctrl_MemWr_out_REG <= io_ctrl_MemWr_in; // @[ID_EX.scala 54:36]
    io_ctrl_MemRd_out_REG <= io_ctrl_MemRd_in; // @[ID_EX.scala 56:36]
    io_ctrl_Reg_W_out_REG <= io_ctrl_Reg_W_in; // @[ID_EX.scala 57:36]
    io_ctrl_MemToReg_out_REG <= io_ctrl_MemToReg_in; // @[ID_EX.scala 58:36]
    io_ctrl_AluOp_out_REG <= io_ctrl_AluOp_in; // @[ID_EX.scala 59:36]
    io_ctrl_OpA_out_REG <= io_ctrl_OpA_in; // @[ID_EX.scala 60:36]
    io_ctrl_OpB_out_REG <= io_ctrl_OpB_in; // @[ID_EX.scala 61:36]
    io_IFID_pc4_out_REG <= io_IFID_pc4_in; // @[ID_EX.scala 63:36]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  io_rs1_out_REG = _RAND_0[4:0];
  _RAND_1 = {1{`RANDOM}};
  io_rs2_out_REG = _RAND_1[4:0];
  _RAND_2 = {1{`RANDOM}};
  io_rs1_data_out_REG = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  io_rs2_data_out_REG = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  io_imm_out_REG = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  io_rd_out_REG = _RAND_5[4:0];
  _RAND_6 = {1{`RANDOM}};
  io_func3_out_REG = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  io_func7_out_REG = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  io_ctrl_MemWr_out_REG = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  io_ctrl_MemRd_out_REG = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  io_ctrl_Reg_W_out_REG = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  io_ctrl_MemToReg_out_REG = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  io_ctrl_AluOp_out_REG = _RAND_12[2:0];
  _RAND_13 = {1{`RANDOM}};
  io_ctrl_OpA_out_REG = _RAND_13[1:0];
  _RAND_14 = {1{`RANDOM}};
  io_ctrl_OpB_out_REG = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  io_IFID_pc4_out_REG = _RAND_15[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module EX_MEM(
  input         clock,
  input         io_IDEX_MEMRD,
  input         io_IDEX_MEMWR,
  input         io_IDEX_MEMTOREG,
  input         io_IDEX_REG_W,
  input  [31:0] io_IDEX_rs2,
  input  [4:0]  io_IDEX_rd,
  input  [31:0] io_alu_out,
  input  [2:0]  io_fun3in,
  output        io_EXMEM_memRd_out,
  output        io_EXMEM_memWr_out,
  output        io_EXMEM_memToReg_out,
  output        io_EXMEM_reg_w_out,
  output [31:0] io_EXMEM_rs2_out,
  output [4:0]  io_EXMEM_rd_out,
  output [31:0] io_EXMEM_alu_out,
  output [2:0]  io_fun3out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  reg  io_EXMEM_memRd_out_REG; // @[EX_MEM.scala 26:39]
  reg  io_EXMEM_memWr_out_REG; // @[EX_MEM.scala 27:39]
  reg  io_EXMEM_memToReg_out_REG; // @[EX_MEM.scala 28:39]
  reg  io_EXMEM_reg_w_out_REG; // @[EX_MEM.scala 29:39]
  reg [31:0] io_EXMEM_rs2_out_REG; // @[EX_MEM.scala 30:39]
  reg [4:0] io_EXMEM_rd_out_REG; // @[EX_MEM.scala 31:39]
  reg [31:0] io_EXMEM_alu_out_REG; // @[EX_MEM.scala 32:39]
  reg [2:0] io_fun3out_REG; // @[EX_MEM.scala 33:25]
  assign io_EXMEM_memRd_out = io_EXMEM_memRd_out_REG; // @[EX_MEM.scala 26:29]
  assign io_EXMEM_memWr_out = io_EXMEM_memWr_out_REG; // @[EX_MEM.scala 27:29]
  assign io_EXMEM_memToReg_out = io_EXMEM_memToReg_out_REG; // @[EX_MEM.scala 28:29]
  assign io_EXMEM_reg_w_out = io_EXMEM_reg_w_out_REG; // @[EX_MEM.scala 29:29]
  assign io_EXMEM_rs2_out = io_EXMEM_rs2_out_REG; // @[EX_MEM.scala 30:29]
  assign io_EXMEM_rd_out = io_EXMEM_rd_out_REG; // @[EX_MEM.scala 31:29]
  assign io_EXMEM_alu_out = io_EXMEM_alu_out_REG; // @[EX_MEM.scala 32:29]
  assign io_fun3out = io_fun3out_REG; // @[EX_MEM.scala 33:15]
  always @(posedge clock) begin
    io_EXMEM_memRd_out_REG <= io_IDEX_MEMRD; // @[EX_MEM.scala 26:39]
    io_EXMEM_memWr_out_REG <= io_IDEX_MEMWR; // @[EX_MEM.scala 27:39]
    io_EXMEM_memToReg_out_REG <= io_IDEX_MEMTOREG; // @[EX_MEM.scala 28:39]
    io_EXMEM_reg_w_out_REG <= io_IDEX_REG_W; // @[EX_MEM.scala 29:39]
    io_EXMEM_rs2_out_REG <= io_IDEX_rs2; // @[EX_MEM.scala 30:39]
    io_EXMEM_rd_out_REG <= io_IDEX_rd; // @[EX_MEM.scala 31:39]
    io_EXMEM_alu_out_REG <= io_alu_out; // @[EX_MEM.scala 32:39]
    io_fun3out_REG <= io_fun3in; // @[EX_MEM.scala 33:25]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  io_EXMEM_memRd_out_REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  io_EXMEM_memWr_out_REG = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  io_EXMEM_memToReg_out_REG = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  io_EXMEM_reg_w_out_REG = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  io_EXMEM_rs2_out_REG = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  io_EXMEM_rd_out_REG = _RAND_5[4:0];
  _RAND_6 = {1{`RANDOM}};
  io_EXMEM_alu_out_REG = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  io_fun3out_REG = _RAND_7[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module MEM_WB(
  input         clock,
  input         io_EXMEM_MEMTOREG,
  input         io_EXMEM_REG_W,
  input         io_EXMEM_MEMRD,
  input  [4:0]  io_EXMEM_rd,
  input  [31:0] io_in_dataMem_out,
  input  [31:0] io_in_alu_out,
  output        io_MEMWB_memToReg_out,
  output        io_MEMWB_reg_w_out,
  output        io_MEMWB_memRd_out,
  output [4:0]  io_MEMWB_rd_out,
  output [31:0] io_MEMWB_dataMem_out,
  output [31:0] io_MEMWB_alu_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg  io_MEMWB_memToReg_out_REG; // @[MEM_WR.scala 22:39]
  reg  io_MEMWB_reg_w_out_REG; // @[MEM_WR.scala 23:39]
  reg  io_MEMWB_memRd_out_REG; // @[MEM_WR.scala 24:39]
  reg [4:0] io_MEMWB_rd_out_REG; // @[MEM_WR.scala 25:39]
  reg [31:0] io_MEMWB_dataMem_out_REG; // @[MEM_WR.scala 26:39]
  reg [31:0] io_MEMWB_alu_out_REG; // @[MEM_WR.scala 27:39]
  assign io_MEMWB_memToReg_out = io_MEMWB_memToReg_out_REG; // @[MEM_WR.scala 22:29]
  assign io_MEMWB_reg_w_out = io_MEMWB_reg_w_out_REG; // @[MEM_WR.scala 23:29]
  assign io_MEMWB_memRd_out = io_MEMWB_memRd_out_REG; // @[MEM_WR.scala 24:29]
  assign io_MEMWB_rd_out = io_MEMWB_rd_out_REG; // @[MEM_WR.scala 25:29]
  assign io_MEMWB_dataMem_out = io_MEMWB_dataMem_out_REG; // @[MEM_WR.scala 26:29]
  assign io_MEMWB_alu_out = io_MEMWB_alu_out_REG; // @[MEM_WR.scala 27:29]
  always @(posedge clock) begin
    io_MEMWB_memToReg_out_REG <= io_EXMEM_MEMTOREG; // @[MEM_WR.scala 22:39]
    io_MEMWB_reg_w_out_REG <= io_EXMEM_REG_W; // @[MEM_WR.scala 23:39]
    io_MEMWB_memRd_out_REG <= io_EXMEM_MEMRD; // @[MEM_WR.scala 24:39]
    io_MEMWB_rd_out_REG <= io_EXMEM_rd; // @[MEM_WR.scala 25:39]
    io_MEMWB_dataMem_out_REG <= io_in_dataMem_out; // @[MEM_WR.scala 26:39]
    io_MEMWB_alu_out_REG <= io_in_alu_out; // @[MEM_WR.scala 27:39]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  io_MEMWB_memToReg_out_REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  io_MEMWB_reg_w_out_REG = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  io_MEMWB_memRd_out_REG = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  io_MEMWB_rd_out_REG = _RAND_3[4:0];
  _RAND_4 = {1{`RANDOM}};
  io_MEMWB_dataMem_out_REG = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  io_MEMWB_alu_out_REG = _RAND_5[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PC(
  input         clock,
  input         reset,
  input  [31:0] io_in,
  output [31:0] io_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] PC; // @[Pc.scala 9:21]
  assign io_out = PC; // @[Pc.scala 10:12]
  always @(posedge clock) begin
    if (reset) begin // @[Pc.scala 9:21]
      PC <= 32'sh0; // @[Pc.scala 9:21]
    end else begin
      PC <= io_in; // @[Pc.scala 11:8]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  PC = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PC4(
  input  [31:0] io_pc,
  output [31:0] io_out
);
  assign io_out = io_pc + 32'h4; // @[pc4.scala 11:21]
endmodule
module InstMem(
  input         clock,
  input  [31:0] io_addr,
  output [31:0] io_data
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [31:0] imem [0:1023]; // @[InsMem.scala 11:17]
  wire [31:0] imem_io_data_MPORT_data; // @[InsMem.scala 11:17]
  wire [9:0] imem_io_data_MPORT_addr; // @[InsMem.scala 11:17]
  wire [31:0] _io_data_T = io_addr / 3'h4; // @[InsMem.scala 13:26]
  assign imem_io_data_MPORT_addr = _io_data_T[9:0];
  assign imem_io_data_MPORT_data = imem[imem_io_data_MPORT_addr]; // @[InsMem.scala 11:17]
  assign io_data = imem_io_data_MPORT_data; // @[InsMem.scala 13:11]
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    imem[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Datamem(
  input         clock,
  input         reset,
  input         io_mem_write,
  input  [31:0] io_addr,
  input  [31:0] io_dataIn,
  output [31:0] io_dataOut,
  input  [2:0]  io_fun3,
  input         io_mem_read
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_MEM_INIT
  reg [7:0] memory_0 [0:1023]; // @[DataMem.scala 14:19]
  wire [7:0] memory_0_MPORT_1_data; // @[DataMem.scala 14:19]
  wire [9:0] memory_0_MPORT_1_addr; // @[DataMem.scala 14:19]
  wire [7:0] memory_0_MPORT_2_data; // @[DataMem.scala 14:19]
  wire [9:0] memory_0_MPORT_2_addr; // @[DataMem.scala 14:19]
  wire [7:0] memory_0_MPORT_data; // @[DataMem.scala 14:19]
  wire [9:0] memory_0_MPORT_addr; // @[DataMem.scala 14:19]
  wire  memory_0_MPORT_mask; // @[DataMem.scala 14:19]
  wire  memory_0_MPORT_en; // @[DataMem.scala 14:19]
  reg [7:0] memory_1 [0:1023]; // @[DataMem.scala 14:19]
  wire [7:0] memory_1_MPORT_1_data; // @[DataMem.scala 14:19]
  wire [9:0] memory_1_MPORT_1_addr; // @[DataMem.scala 14:19]
  wire [7:0] memory_1_MPORT_2_data; // @[DataMem.scala 14:19]
  wire [9:0] memory_1_MPORT_2_addr; // @[DataMem.scala 14:19]
  wire [7:0] memory_1_MPORT_data; // @[DataMem.scala 14:19]
  wire [9:0] memory_1_MPORT_addr; // @[DataMem.scala 14:19]
  wire  memory_1_MPORT_mask; // @[DataMem.scala 14:19]
  wire  memory_1_MPORT_en; // @[DataMem.scala 14:19]
  reg [7:0] memory_2 [0:1023]; // @[DataMem.scala 14:19]
  wire [7:0] memory_2_MPORT_1_data; // @[DataMem.scala 14:19]
  wire [9:0] memory_2_MPORT_1_addr; // @[DataMem.scala 14:19]
  wire [7:0] memory_2_MPORT_2_data; // @[DataMem.scala 14:19]
  wire [9:0] memory_2_MPORT_2_addr; // @[DataMem.scala 14:19]
  wire [7:0] memory_2_MPORT_data; // @[DataMem.scala 14:19]
  wire [9:0] memory_2_MPORT_addr; // @[DataMem.scala 14:19]
  wire  memory_2_MPORT_mask; // @[DataMem.scala 14:19]
  wire  memory_2_MPORT_en; // @[DataMem.scala 14:19]
  reg [7:0] memory_3 [0:1023]; // @[DataMem.scala 14:19]
  wire [7:0] memory_3_MPORT_1_data; // @[DataMem.scala 14:19]
  wire [9:0] memory_3_MPORT_1_addr; // @[DataMem.scala 14:19]
  wire [7:0] memory_3_MPORT_2_data; // @[DataMem.scala 14:19]
  wire [9:0] memory_3_MPORT_2_addr; // @[DataMem.scala 14:19]
  wire [7:0] memory_3_MPORT_data; // @[DataMem.scala 14:19]
  wire [9:0] memory_3_MPORT_addr; // @[DataMem.scala 14:19]
  wire  memory_3_MPORT_mask; // @[DataMem.scala 14:19]
  wire  memory_3_MPORT_en; // @[DataMem.scala 14:19]
  wire [7:0] data_0 = io_dataIn[7:0]; // @[DataMem.scala 21:36]
  wire [7:0] _data_1_T_1 = io_dataIn[15:8]; // @[DataMem.scala 22:37]
  wire [7:0] _data_2_T_1 = io_dataIn[23:16]; // @[DataMem.scala 23:38]
  wire [7:0] _data_3_T_1 = io_dataIn[31:24]; // @[DataMem.scala 24:38]
  wire  _T = io_fun3 == 3'h0; // @[DataMem.scala 37:18]
  wire  _T_2 = io_addr[1:0] == 2'h0; // @[DataMem.scala 38:26]
  wire  _T_4 = io_addr[1:0] == 2'h1; // @[DataMem.scala 43:32]
  wire  _T_6 = io_addr[1:0] == 2'h2; // @[DataMem.scala 52:32]
  wire  _T_8 = io_addr[1:0] == 2'h3; // @[DataMem.scala 61:32]
  wire [7:0] _GEN_2 = io_addr[1:0] == 2'h3 ? $signed(data_0) : $signed(_data_3_T_1); // @[DataMem.scala 61:41 DataMem.scala 67:17 DataMem.scala 24:11]
  wire [7:0] _GEN_6 = io_addr[1:0] == 2'h2 ? $signed(data_0) : $signed(_data_2_T_1); // @[DataMem.scala 52:41 DataMem.scala 58:17 DataMem.scala 23:11]
  wire [7:0] _GEN_7 = io_addr[1:0] == 2'h2 ? $signed(_data_3_T_1) : $signed(_GEN_2); // @[DataMem.scala 52:41 DataMem.scala 24:11]
  wire [7:0] _GEN_12 = io_addr[1:0] == 2'h1 ? $signed(data_0) : $signed(_data_1_T_1); // @[DataMem.scala 43:41 DataMem.scala 49:17 DataMem.scala 22:11]
  wire [7:0] _GEN_13 = io_addr[1:0] == 2'h1 ? $signed(_data_2_T_1) : $signed(_GEN_6); // @[DataMem.scala 43:41 DataMem.scala 23:11]
  wire [7:0] _GEN_14 = io_addr[1:0] == 2'h1 ? $signed(_data_3_T_1) : $signed(_GEN_7); // @[DataMem.scala 43:41 DataMem.scala 24:11]
  wire [7:0] _GEN_19 = io_addr[1:0] == 2'h0 ? $signed(_data_1_T_1) : $signed(_GEN_12); // @[DataMem.scala 38:35 DataMem.scala 22:11]
  wire [7:0] _GEN_20 = io_addr[1:0] == 2'h0 ? $signed(_data_2_T_1) : $signed(_GEN_13); // @[DataMem.scala 38:35 DataMem.scala 23:11]
  wire [7:0] _GEN_21 = io_addr[1:0] == 2'h0 ? $signed(_data_3_T_1) : $signed(_GEN_14); // @[DataMem.scala 38:35 DataMem.scala 24:11]
  wire  _T_9 = io_fun3 == 3'h1; // @[DataMem.scala 71:25]
  wire [7:0] _GEN_29 = _T_6 ? $signed(_data_1_T_1) : $signed(_GEN_2); // @[DataMem.scala 88:43 DataMem.scala 95:19]
  wire [7:0] _GEN_35 = _T_4 ? $signed(_data_1_T_1) : $signed(_GEN_6); // @[DataMem.scala 78:43 DataMem.scala 85:19]
  wire [7:0] _GEN_36 = _T_4 ? $signed(_data_3_T_1) : $signed(_GEN_29); // @[DataMem.scala 78:43 DataMem.scala 24:11]
  wire [7:0] _GEN_42 = _T_2 ? $signed(_data_2_T_1) : $signed(_GEN_35); // @[DataMem.scala 72:37 DataMem.scala 23:11]
  wire [7:0] _GEN_43 = _T_2 ? $signed(_data_3_T_1) : $signed(_GEN_36); // @[DataMem.scala 72:37 DataMem.scala 24:11]
  wire  _T_18 = io_fun3 == 3'h2; // @[DataMem.scala 108:25]
  wire [7:0] _GEN_49 = io_fun3 == 3'h1 ? $signed(_GEN_19) : $signed(_data_1_T_1); // @[DataMem.scala 71:34 DataMem.scala 22:11]
  wire [7:0] _GEN_50 = io_fun3 == 3'h1 ? $signed(_GEN_42) : $signed(_data_2_T_1); // @[DataMem.scala 71:34 DataMem.scala 23:11]
  wire [7:0] _GEN_51 = io_fun3 == 3'h1 ? $signed(_GEN_43) : $signed(_data_3_T_1); // @[DataMem.scala 71:34 DataMem.scala 24:11]
  wire [7:0] _GEN_56 = io_fun3 == 3'h0 ? $signed(_GEN_19) : $signed(_GEN_49); // @[DataMem.scala 37:27]
  wire [7:0] _GEN_57 = io_fun3 == 3'h0 ? $signed(_GEN_20) : $signed(_GEN_50); // @[DataMem.scala 37:27]
  wire [7:0] _GEN_58 = io_fun3 == 3'h0 ? $signed(_GEN_21) : $signed(_GEN_51); // @[DataMem.scala 37:27]
  wire [7:0] tempread_0 = io_mem_read ? $signed(memory_0_MPORT_2_data) : $signed(memory_0_MPORT_1_data); // @[DataMem.scala 125:20 DataMem.scala 126:12 DataMem.scala 124:12]
  wire [23:0] io_dataOut_hi = tempread_0[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [7:0] io_dataOut_lo = io_mem_read ? $signed(memory_0_MPORT_2_data) : $signed(memory_0_MPORT_1_data); // @[Cat.scala 30:58]
  wire [31:0] _io_dataOut_T_3 = {io_dataOut_hi,io_dataOut_lo}; // @[DataMem.scala 129:66]
  wire [7:0] tempread_1 = io_mem_read ? $signed(memory_1_MPORT_2_data) : $signed(memory_1_MPORT_1_data); // @[DataMem.scala 125:20 DataMem.scala 126:12 DataMem.scala 124:12]
  wire [23:0] io_dataOut_hi_1 = tempread_1[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [7:0] io_dataOut_lo_1 = io_mem_read ? $signed(memory_1_MPORT_2_data) : $signed(memory_1_MPORT_1_data); // @[Cat.scala 30:58]
  wire [31:0] _io_dataOut_T_7 = {io_dataOut_hi_1,io_dataOut_lo_1}; // @[DataMem.scala 131:66]
  wire [7:0] tempread_2 = io_mem_read ? $signed(memory_2_MPORT_2_data) : $signed(memory_2_MPORT_1_data); // @[DataMem.scala 125:20 DataMem.scala 126:12 DataMem.scala 124:12]
  wire [23:0] io_dataOut_hi_2 = tempread_2[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [7:0] io_dataOut_lo_2 = io_mem_read ? $signed(memory_2_MPORT_2_data) : $signed(memory_2_MPORT_1_data); // @[Cat.scala 30:58]
  wire [31:0] _io_dataOut_T_11 = {io_dataOut_hi_2,io_dataOut_lo_2}; // @[DataMem.scala 133:66]
  wire [7:0] tempread_3 = io_mem_read ? $signed(memory_3_MPORT_2_data) : $signed(memory_3_MPORT_1_data); // @[DataMem.scala 125:20 DataMem.scala 126:12 DataMem.scala 124:12]
  wire [23:0] io_dataOut_hi_3 = tempread_3[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 72:12]
  wire [7:0] io_dataOut_lo_3 = io_mem_read ? $signed(memory_3_MPORT_2_data) : $signed(memory_3_MPORT_1_data); // @[Cat.scala 30:58]
  wire [31:0] _io_dataOut_T_15 = {io_dataOut_hi_3,io_dataOut_lo_3}; // @[DataMem.scala 135:66]
  wire [31:0] _GEN_82 = _T_8 ? $signed(_io_dataOut_T_15) : $signed(32'sh0); // @[DataMem.scala 134:35 DataMem.scala 135:16 DataMem.scala 19:14]
  wire [31:0] _GEN_83 = _T_6 ? $signed(_io_dataOut_T_11) : $signed(_GEN_82); // @[DataMem.scala 132:35 DataMem.scala 133:16]
  wire [31:0] _GEN_84 = _T_4 ? $signed(_io_dataOut_T_7) : $signed(_GEN_83); // @[DataMem.scala 130:35 DataMem.scala 131:16]
  wire [31:0] _GEN_85 = _T_2 ? $signed(_io_dataOut_T_3) : $signed(_GEN_84); // @[DataMem.scala 128:31 DataMem.scala 129:16]
  wire [15:0] io_dataOut_hi_hi = tempread_0[7] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _io_dataOut_T_19 = {io_dataOut_hi_hi,io_dataOut_lo,io_dataOut_lo_1}; // @[DataMem.scala 139:78]
  wire [15:0] io_dataOut_hi_hi_1 = tempread_1[7] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _io_dataOut_T_23 = {io_dataOut_hi_hi_1,io_dataOut_lo_1,io_dataOut_lo_2}; // @[DataMem.scala 141:78]
  wire [15:0] io_dataOut_hi_hi_2 = tempread_2[7] ? 16'hffff : 16'h0; // @[Bitwise.scala 72:12]
  wire [31:0] _io_dataOut_T_27 = {io_dataOut_hi_hi_2,io_dataOut_lo_2,io_dataOut_lo_3}; // @[DataMem.scala 143:78]
  wire [31:0] _GEN_87 = _T_6 ? $signed(_io_dataOut_T_27) : $signed(_GEN_82); // @[DataMem.scala 142:35 DataMem.scala 143:16]
  wire [31:0] _GEN_88 = _T_4 ? $signed(_io_dataOut_T_23) : $signed(_GEN_87); // @[DataMem.scala 140:35 DataMem.scala 141:16]
  wire [31:0] _GEN_89 = _T_2 ? $signed(_io_dataOut_T_19) : $signed(_GEN_88); // @[DataMem.scala 138:31 DataMem.scala 139:16]
  wire [31:0] _io_dataOut_T_33 = {io_dataOut_lo_3,io_dataOut_lo_2,io_dataOut_lo_1,io_dataOut_lo}; // @[DataMem.scala 148:81]
  wire [31:0] _GEN_90 = _T_18 ? $signed(_io_dataOut_T_33) : $signed(32'sh0); // @[DataMem.scala 147:31 DataMem.scala 148:16 DataMem.scala 19:14]
  wire [31:0] _GEN_91 = _T_9 ? $signed(_GEN_89) : $signed(_GEN_90); // @[DataMem.scala 137:31]
  wire [31:0] _GEN_92 = _T ? $signed(_GEN_85) : $signed(_GEN_91); // @[DataMem.scala 127:25]
  assign memory_0_MPORT_1_addr = io_addr[11:2];
  assign memory_0_MPORT_1_data = memory_0[memory_0_MPORT_1_addr]; // @[DataMem.scala 14:19]
  assign memory_0_MPORT_2_addr = io_addr[11:2];
  assign memory_0_MPORT_2_data = memory_0[memory_0_MPORT_2_addr]; // @[DataMem.scala 14:19]
  assign memory_0_MPORT_data = io_dataIn[7:0];
  assign memory_0_MPORT_addr = io_addr[11:2];
  assign memory_0_MPORT_mask = io_mem_write;
  assign memory_0_MPORT_en = io_mem_write;
  assign memory_1_MPORT_1_addr = io_addr[11:2];
  assign memory_1_MPORT_1_data = memory_1[memory_1_MPORT_1_addr]; // @[DataMem.scala 14:19]
  assign memory_1_MPORT_2_addr = io_addr[11:2];
  assign memory_1_MPORT_2_data = memory_1[memory_1_MPORT_2_addr]; // @[DataMem.scala 14:19]
  assign memory_1_MPORT_data = io_mem_write ? $signed(_GEN_56) : $signed(_data_1_T_1);
  assign memory_1_MPORT_addr = io_addr[11:2];
  assign memory_1_MPORT_mask = 1'h0;
  assign memory_1_MPORT_en = io_mem_write;
  assign memory_2_MPORT_1_addr = io_addr[11:2];
  assign memory_2_MPORT_1_data = memory_2[memory_2_MPORT_1_addr]; // @[DataMem.scala 14:19]
  assign memory_2_MPORT_2_addr = io_addr[11:2];
  assign memory_2_MPORT_2_data = memory_2[memory_2_MPORT_2_addr]; // @[DataMem.scala 14:19]
  assign memory_2_MPORT_data = io_mem_write ? $signed(_GEN_57) : $signed(_data_2_T_1);
  assign memory_2_MPORT_addr = io_addr[11:2];
  assign memory_2_MPORT_mask = 1'h0;
  assign memory_2_MPORT_en = io_mem_write;
  assign memory_3_MPORT_1_addr = io_addr[11:2];
  assign memory_3_MPORT_1_data = memory_3[memory_3_MPORT_1_addr]; // @[DataMem.scala 14:19]
  assign memory_3_MPORT_2_addr = io_addr[11:2];
  assign memory_3_MPORT_2_data = memory_3[memory_3_MPORT_2_addr]; // @[DataMem.scala 14:19]
  assign memory_3_MPORT_data = io_mem_write ? $signed(_GEN_58) : $signed(_data_3_T_1);
  assign memory_3_MPORT_addr = io_addr[11:2];
  assign memory_3_MPORT_mask = 1'h0;
  assign memory_3_MPORT_en = io_mem_write;
  assign io_dataOut = io_mem_read ? $signed(_GEN_92) : $signed(32'sh0); // @[DataMem.scala 125:20 DataMem.scala 19:14]
  always @(posedge clock) begin
    if(memory_0_MPORT_en & memory_0_MPORT_mask) begin
      memory_0[memory_0_MPORT_addr] <= memory_0_MPORT_data; // @[DataMem.scala 14:19]
    end
    if(memory_1_MPORT_en & memory_1_MPORT_mask) begin
      memory_1[memory_1_MPORT_addr] <= memory_1_MPORT_data; // @[DataMem.scala 14:19]
    end
    if(memory_2_MPORT_en & memory_2_MPORT_mask) begin
      memory_2[memory_2_MPORT_addr] <= memory_2_MPORT_data; // @[DataMem.scala 14:19]
    end
    if(memory_3_MPORT_en & memory_3_MPORT_mask) begin
      memory_3[memory_3_MPORT_addr] <= memory_3_MPORT_data; // @[DataMem.scala 14:19]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (io_mem_write & ~reset) begin
          $fwrite(32'h80000002,"%x\n",io_dataIn); // @[DataMem.scala 152:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    memory_0[initvar] = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    memory_1[initvar] = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    memory_2[initvar] = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    memory_3[initvar] = _RAND_3[7:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Control(
  input  [6:0] io_opcode,
  output       io_mem_write,
  output       io_branch,
  output       io_mem_read,
  output       io_reg_write,
  output       io_men_to_reg,
  output [2:0] io_alu_operation,
  output [1:0] io_operand_A,
  output       io_operand_B,
  output [1:0] io_extend,
  output [1:0] io_next_pc_sel
);
  wire  _T = 7'h33 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_1 = 7'h13 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_2 = 7'h23 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_3 = 7'h3 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_4 = 7'h63 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_5 = 7'h6f == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_6 = 7'h67 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_7 = 7'h37 == io_opcode; // @[Conditional.scala 37:30]
  wire  _T_8 = 7'h17 == io_opcode; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_2 = _T_8 ? 3'h7 : 3'h0; // @[Conditional.scala 39:67 control.scala 151:24 control.scala 25:20]
  wire [1:0] _GEN_3 = _T_8 ? 2'h2 : 2'h0; // @[Conditional.scala 39:67 control.scala 152:20 control.scala 26:16]
  wire  _GEN_5 = _T_7 | _T_8; // @[Conditional.scala 39:67 control.scala 135:20]
  wire [2:0] _GEN_6 = _T_7 ? 3'h6 : _GEN_2; // @[Conditional.scala 39:67 control.scala 137:24]
  wire [1:0] _GEN_7 = _T_7 ? 2'h3 : _GEN_3; // @[Conditional.scala 39:67 control.scala 138:20]
  wire [1:0] _GEN_8 = _T_7 ? 2'h2 : _GEN_3; // @[Conditional.scala 39:67 control.scala 140:17]
  wire  _GEN_10 = _T_6 | _GEN_5; // @[Conditional.scala 39:67 control.scala 121:20]
  wire [2:0] _GEN_11 = _T_6 ? 3'h3 : _GEN_6; // @[Conditional.scala 39:67 control.scala 123:24]
  wire [1:0] _GEN_12 = _T_6 ? 2'h1 : _GEN_7; // @[Conditional.scala 39:67 control.scala 124:20]
  wire  _GEN_13 = _T_6 ? 1'h0 : _GEN_5; // @[Conditional.scala 39:67 control.scala 125:20]
  wire [1:0] _GEN_14 = _T_6 ? 2'h0 : _GEN_8; // @[Conditional.scala 39:67 control.scala 126:17]
  wire [1:0] _GEN_15 = _T_6 ? 2'h3 : 2'h0; // @[Conditional.scala 39:67 control.scala 127:22]
  wire  _GEN_17 = _T_5 | _GEN_10; // @[Conditional.scala 39:67 control.scala 107:20]
  wire [2:0] _GEN_18 = _T_5 ? 3'h3 : _GEN_11; // @[Conditional.scala 39:67 control.scala 109:24]
  wire [1:0] _GEN_19 = _T_5 ? 2'h1 : _GEN_12; // @[Conditional.scala 39:67 control.scala 110:20]
  wire  _GEN_20 = _T_5 ? 1'h0 : _GEN_13; // @[Conditional.scala 39:67 control.scala 111:20]
  wire [1:0] _GEN_21 = _T_5 ? 2'h0 : _GEN_14; // @[Conditional.scala 39:67 control.scala 112:17]
  wire [1:0] _GEN_22 = _T_5 ? 2'h2 : _GEN_15; // @[Conditional.scala 39:67 control.scala 113:22]
  wire  _GEN_25 = _T_4 ? 1'h0 : _GEN_17; // @[Conditional.scala 39:67 control.scala 93:20]
  wire [2:0] _GEN_26 = _T_4 ? 3'h2 : _GEN_18; // @[Conditional.scala 39:67 control.scala 95:24]
  wire [1:0] _GEN_27 = _T_4 ? 2'h0 : _GEN_19; // @[Conditional.scala 39:67 control.scala 96:20]
  wire  _GEN_28 = _T_4 ? 1'h0 : _GEN_20; // @[Conditional.scala 39:67 control.scala 97:20]
  wire [1:0] _GEN_29 = _T_4 ? 2'h0 : _GEN_21; // @[Conditional.scala 39:67 control.scala 98:17]
  wire [1:0] _GEN_30 = _T_4 ? 2'h1 : _GEN_22; // @[Conditional.scala 39:67 control.scala 99:22]
  wire  _GEN_32 = _T_3 ? 1'h0 : _T_4; // @[Conditional.scala 39:67 control.scala 77:17]
  wire  _GEN_34 = _T_3 | _GEN_25; // @[Conditional.scala 39:67 control.scala 79:20]
  wire [2:0] _GEN_35 = _T_3 ? 3'h4 : _GEN_26; // @[Conditional.scala 39:67 control.scala 81:24]
  wire [1:0] _GEN_36 = _T_3 ? 2'h0 : _GEN_27; // @[Conditional.scala 39:67 control.scala 82:20]
  wire  _GEN_37 = _T_3 | _GEN_28; // @[Conditional.scala 39:67 control.scala 83:20]
  wire [1:0] _GEN_38 = _T_3 ? 2'h0 : _GEN_29; // @[Conditional.scala 39:67 control.scala 84:17]
  wire [1:0] _GEN_39 = _T_3 ? 2'h0 : _GEN_30; // @[Conditional.scala 39:67 control.scala 85:22]
  wire  _GEN_41 = _T_2 ? 1'h0 : _GEN_32; // @[Conditional.scala 39:67 control.scala 63:17]
  wire  _GEN_42 = _T_2 ? 1'h0 : _T_3; // @[Conditional.scala 39:67 control.scala 64:19]
  wire  _GEN_43 = _T_2 ? 1'h0 : _GEN_34; // @[Conditional.scala 39:67 control.scala 65:20]
  wire [2:0] _GEN_44 = _T_2 ? 3'h5 : _GEN_35; // @[Conditional.scala 39:67 control.scala 67:24]
  wire [1:0] _GEN_45 = _T_2 ? 2'h0 : _GEN_36; // @[Conditional.scala 39:67 control.scala 68:20]
  wire  _GEN_46 = _T_2 | _GEN_37; // @[Conditional.scala 39:67 control.scala 69:20]
  wire [1:0] _GEN_47 = _T_2 ? 2'h1 : _GEN_38; // @[Conditional.scala 39:67 control.scala 70:17]
  wire [1:0] _GEN_48 = _T_2 ? 2'h0 : _GEN_39; // @[Conditional.scala 39:67 control.scala 71:22]
  wire  _GEN_49 = _T_1 ? 1'h0 : _T_2; // @[Conditional.scala 39:67 control.scala 48:20]
  wire  _GEN_50 = _T_1 ? 1'h0 : _GEN_41; // @[Conditional.scala 39:67 control.scala 49:17]
  wire  _GEN_51 = _T_1 ? 1'h0 : _GEN_42; // @[Conditional.scala 39:67 control.scala 50:19]
  wire  _GEN_52 = _T_1 | _GEN_43; // @[Conditional.scala 39:67 control.scala 51:20]
  wire [2:0] _GEN_53 = _T_1 ? 3'h1 : _GEN_44; // @[Conditional.scala 39:67 control.scala 53:24]
  wire [1:0] _GEN_54 = _T_1 ? 2'h0 : _GEN_45; // @[Conditional.scala 39:67 control.scala 54:20]
  wire  _GEN_55 = _T_1 | _GEN_46; // @[Conditional.scala 39:67 control.scala 55:20]
  wire [1:0] _GEN_56 = _T_1 ? 2'h0 : _GEN_47; // @[Conditional.scala 39:67 control.scala 56:17]
  wire [1:0] _GEN_57 = _T_1 ? 2'h0 : _GEN_48; // @[Conditional.scala 39:67 control.scala 57:22]
  assign io_mem_write = _T ? 1'h0 : _GEN_49; // @[Conditional.scala 40:58 control.scala 34:20]
  assign io_branch = _T ? 1'h0 : _GEN_50; // @[Conditional.scala 40:58 control.scala 35:17]
  assign io_mem_read = _T ? 1'h0 : _GEN_51; // @[Conditional.scala 40:58 control.scala 36:19]
  assign io_reg_write = _T | _GEN_52; // @[Conditional.scala 40:58 control.scala 37:20]
  assign io_men_to_reg = _T ? 1'h0 : _GEN_51; // @[Conditional.scala 40:58 control.scala 36:19]
  assign io_alu_operation = _T ? 3'h0 : _GEN_53; // @[Conditional.scala 40:58 control.scala 39:24]
  assign io_operand_A = _T ? 2'h0 : _GEN_54; // @[Conditional.scala 40:58 control.scala 40:20]
  assign io_operand_B = _T ? 1'h0 : _GEN_55; // @[Conditional.scala 40:58 control.scala 41:20]
  assign io_extend = _T ? 2'h0 : _GEN_56; // @[Conditional.scala 40:58 control.scala 42:17]
  assign io_next_pc_sel = _T ? 2'h0 : _GEN_57; // @[Conditional.scala 40:58 control.scala 43:22]
endmodule
module ImmGenerator(
  input  [31:0] io_instr,
  input  [31:0] io_pc,
  output [31:0] io_I_type,
  output [31:0] io_S_type,
  output [31:0] io_SB_type,
  output [31:0] io_U_type,
  output [31:0] io_UJ_type
);
  wire [19:0] io_I_type_hi = io_instr[31] ? 20'hfffff : 20'h0; // @[Bitwise.scala 72:12]
  wire [11:0] io_I_type_lo = io_instr[31:20]; // @[IMM.scala 17:52]
  wire [6:0] io_S_type_hi_lo = io_instr[31:25]; // @[IMM.scala 20:52]
  wire [4:0] io_S_type_lo = io_instr[11:7]; // @[IMM.scala 20:70]
  wire [18:0] sbImm_hi_hi_hi = io_instr[31] ? 19'h7ffff : 19'h0; // @[Bitwise.scala 72:12]
  wire  sbImm_hi_lo = io_instr[7]; // @[IMM.scala 23:65]
  wire [5:0] sbImm_lo_hi_hi = io_instr[30:25]; // @[IMM.scala 23:78]
  wire [3:0] sbImm_lo_hi_lo = io_instr[11:8]; // @[IMM.scala 23:96]
  wire [31:0] sbImm = {sbImm_hi_hi_hi,io_instr[31],sbImm_hi_lo,sbImm_lo_hi_hi,sbImm_lo_hi_lo,1'h0}; // @[IMM.scala 23:115]
  wire [19:0] io_U_type_hi = io_instr[31:12]; // @[IMM.scala 27:28]
  wire [10:0] ujImm_hi_hi_hi = io_instr[31] ? 11'h7ff : 11'h0; // @[Bitwise.scala 72:12]
  wire [7:0] ujImm_hi_lo = io_instr[19:12]; // @[IMM.scala 30:65]
  wire  ujImm_lo_hi_hi = io_instr[20]; // @[IMM.scala 30:83]
  wire [9:0] ujImm_lo_hi_lo = io_instr[30:21]; // @[IMM.scala 30:97]
  wire [31:0] ujImm = {ujImm_hi_hi_hi,io_instr[31],ujImm_hi_lo,ujImm_lo_hi_hi,ujImm_lo_hi_lo,1'h0}; // @[IMM.scala 30:117]
  assign io_I_type = {io_I_type_hi,io_I_type_lo}; // @[IMM.scala 17:62]
  assign io_S_type = {io_I_type_hi,io_S_type_hi_lo,io_S_type_lo}; // @[IMM.scala 20:79]
  assign io_SB_type = $signed(sbImm) + $signed(io_pc); // @[IMM.scala 24:23]
  assign io_U_type = {io_U_type_hi,12'h0}; // @[IMM.scala 27:53]
  assign io_UJ_type = $signed(ujImm) + $signed(io_pc); // @[IMM.scala 31:23]
endmodule
module RegisterFile(
  input         clock,
  input         reset,
  input  [4:0]  io_rs1,
  input  [4:0]  io_rs2,
  input         io_reg_write,
  input  [4:0]  io_w_reg,
  input  [31:0] io_w_data,
  output [31:0] io_rdata1,
  output [31:0] io_rdata2
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
  reg [31:0] _RAND_31;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] regfile_0; // @[RegFile.scala 15:24]
  reg [31:0] regfile_1; // @[RegFile.scala 15:24]
  reg [31:0] regfile_2; // @[RegFile.scala 15:24]
  reg [31:0] regfile_3; // @[RegFile.scala 15:24]
  reg [31:0] regfile_4; // @[RegFile.scala 15:24]
  reg [31:0] regfile_5; // @[RegFile.scala 15:24]
  reg [31:0] regfile_6; // @[RegFile.scala 15:24]
  reg [31:0] regfile_7; // @[RegFile.scala 15:24]
  reg [31:0] regfile_8; // @[RegFile.scala 15:24]
  reg [31:0] regfile_9; // @[RegFile.scala 15:24]
  reg [31:0] regfile_10; // @[RegFile.scala 15:24]
  reg [31:0] regfile_11; // @[RegFile.scala 15:24]
  reg [31:0] regfile_12; // @[RegFile.scala 15:24]
  reg [31:0] regfile_13; // @[RegFile.scala 15:24]
  reg [31:0] regfile_14; // @[RegFile.scala 15:24]
  reg [31:0] regfile_15; // @[RegFile.scala 15:24]
  reg [31:0] regfile_16; // @[RegFile.scala 15:24]
  reg [31:0] regfile_17; // @[RegFile.scala 15:24]
  reg [31:0] regfile_18; // @[RegFile.scala 15:24]
  reg [31:0] regfile_19; // @[RegFile.scala 15:24]
  reg [31:0] regfile_20; // @[RegFile.scala 15:24]
  reg [31:0] regfile_21; // @[RegFile.scala 15:24]
  reg [31:0] regfile_22; // @[RegFile.scala 15:24]
  reg [31:0] regfile_23; // @[RegFile.scala 15:24]
  reg [31:0] regfile_24; // @[RegFile.scala 15:24]
  reg [31:0] regfile_25; // @[RegFile.scala 15:24]
  reg [31:0] regfile_26; // @[RegFile.scala 15:24]
  reg [31:0] regfile_27; // @[RegFile.scala 15:24]
  reg [31:0] regfile_28; // @[RegFile.scala 15:24]
  reg [31:0] regfile_29; // @[RegFile.scala 15:24]
  reg [31:0] regfile_30; // @[RegFile.scala 15:24]
  reg [31:0] regfile_31; // @[RegFile.scala 15:24]
  wire [31:0] _GEN_1 = 5'h1 == io_rs1 ? $signed(regfile_1) : $signed(regfile_0); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_2 = 5'h2 == io_rs1 ? $signed(regfile_2) : $signed(_GEN_1); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_3 = 5'h3 == io_rs1 ? $signed(regfile_3) : $signed(_GEN_2); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_4 = 5'h4 == io_rs1 ? $signed(regfile_4) : $signed(_GEN_3); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_5 = 5'h5 == io_rs1 ? $signed(regfile_5) : $signed(_GEN_4); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_6 = 5'h6 == io_rs1 ? $signed(regfile_6) : $signed(_GEN_5); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_7 = 5'h7 == io_rs1 ? $signed(regfile_7) : $signed(_GEN_6); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_8 = 5'h8 == io_rs1 ? $signed(regfile_8) : $signed(_GEN_7); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_9 = 5'h9 == io_rs1 ? $signed(regfile_9) : $signed(_GEN_8); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_10 = 5'ha == io_rs1 ? $signed(regfile_10) : $signed(_GEN_9); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_11 = 5'hb == io_rs1 ? $signed(regfile_11) : $signed(_GEN_10); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_12 = 5'hc == io_rs1 ? $signed(regfile_12) : $signed(_GEN_11); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_13 = 5'hd == io_rs1 ? $signed(regfile_13) : $signed(_GEN_12); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_14 = 5'he == io_rs1 ? $signed(regfile_14) : $signed(_GEN_13); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_15 = 5'hf == io_rs1 ? $signed(regfile_15) : $signed(_GEN_14); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_16 = 5'h10 == io_rs1 ? $signed(regfile_16) : $signed(_GEN_15); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_17 = 5'h11 == io_rs1 ? $signed(regfile_17) : $signed(_GEN_16); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_18 = 5'h12 == io_rs1 ? $signed(regfile_18) : $signed(_GEN_17); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_19 = 5'h13 == io_rs1 ? $signed(regfile_19) : $signed(_GEN_18); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_20 = 5'h14 == io_rs1 ? $signed(regfile_20) : $signed(_GEN_19); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_21 = 5'h15 == io_rs1 ? $signed(regfile_21) : $signed(_GEN_20); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_22 = 5'h16 == io_rs1 ? $signed(regfile_22) : $signed(_GEN_21); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_23 = 5'h17 == io_rs1 ? $signed(regfile_23) : $signed(_GEN_22); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_24 = 5'h18 == io_rs1 ? $signed(regfile_24) : $signed(_GEN_23); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_25 = 5'h19 == io_rs1 ? $signed(regfile_25) : $signed(_GEN_24); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_26 = 5'h1a == io_rs1 ? $signed(regfile_26) : $signed(_GEN_25); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_27 = 5'h1b == io_rs1 ? $signed(regfile_27) : $signed(_GEN_26); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_28 = 5'h1c == io_rs1 ? $signed(regfile_28) : $signed(_GEN_27); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_29 = 5'h1d == io_rs1 ? $signed(regfile_29) : $signed(_GEN_28); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_30 = 5'h1e == io_rs1 ? $signed(regfile_30) : $signed(_GEN_29); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_31 = 5'h1f == io_rs1 ? $signed(regfile_31) : $signed(_GEN_30); // @[RegFile.scala 17:19 RegFile.scala 17:19]
  wire [31:0] _GEN_33 = 5'h1 == io_rs2 ? $signed(regfile_1) : $signed(regfile_0); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_34 = 5'h2 == io_rs2 ? $signed(regfile_2) : $signed(_GEN_33); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_35 = 5'h3 == io_rs2 ? $signed(regfile_3) : $signed(_GEN_34); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_36 = 5'h4 == io_rs2 ? $signed(regfile_4) : $signed(_GEN_35); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_37 = 5'h5 == io_rs2 ? $signed(regfile_5) : $signed(_GEN_36); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_38 = 5'h6 == io_rs2 ? $signed(regfile_6) : $signed(_GEN_37); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_39 = 5'h7 == io_rs2 ? $signed(regfile_7) : $signed(_GEN_38); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_40 = 5'h8 == io_rs2 ? $signed(regfile_8) : $signed(_GEN_39); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_41 = 5'h9 == io_rs2 ? $signed(regfile_9) : $signed(_GEN_40); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_42 = 5'ha == io_rs2 ? $signed(regfile_10) : $signed(_GEN_41); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_43 = 5'hb == io_rs2 ? $signed(regfile_11) : $signed(_GEN_42); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_44 = 5'hc == io_rs2 ? $signed(regfile_12) : $signed(_GEN_43); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_45 = 5'hd == io_rs2 ? $signed(regfile_13) : $signed(_GEN_44); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_46 = 5'he == io_rs2 ? $signed(regfile_14) : $signed(_GEN_45); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_47 = 5'hf == io_rs2 ? $signed(regfile_15) : $signed(_GEN_46); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_48 = 5'h10 == io_rs2 ? $signed(regfile_16) : $signed(_GEN_47); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_49 = 5'h11 == io_rs2 ? $signed(regfile_17) : $signed(_GEN_48); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_50 = 5'h12 == io_rs2 ? $signed(regfile_18) : $signed(_GEN_49); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_51 = 5'h13 == io_rs2 ? $signed(regfile_19) : $signed(_GEN_50); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_52 = 5'h14 == io_rs2 ? $signed(regfile_20) : $signed(_GEN_51); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_53 = 5'h15 == io_rs2 ? $signed(regfile_21) : $signed(_GEN_52); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_54 = 5'h16 == io_rs2 ? $signed(regfile_22) : $signed(_GEN_53); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_55 = 5'h17 == io_rs2 ? $signed(regfile_23) : $signed(_GEN_54); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_56 = 5'h18 == io_rs2 ? $signed(regfile_24) : $signed(_GEN_55); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_57 = 5'h19 == io_rs2 ? $signed(regfile_25) : $signed(_GEN_56); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_58 = 5'h1a == io_rs2 ? $signed(regfile_26) : $signed(_GEN_57); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_59 = 5'h1b == io_rs2 ? $signed(regfile_27) : $signed(_GEN_58); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_60 = 5'h1c == io_rs2 ? $signed(regfile_28) : $signed(_GEN_59); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_61 = 5'h1d == io_rs2 ? $signed(regfile_29) : $signed(_GEN_60); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_62 = 5'h1e == io_rs2 ? $signed(regfile_30) : $signed(_GEN_61); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  wire [31:0] _GEN_63 = 5'h1f == io_rs2 ? $signed(regfile_31) : $signed(_GEN_62); // @[RegFile.scala 18:19 RegFile.scala 18:19]
  assign io_rdata1 = io_rs1 == 5'h0 ? $signed(32'sh0) : $signed(_GEN_31); // @[RegFile.scala 17:19]
  assign io_rdata2 = io_rs2 == 5'h0 ? $signed(32'sh0) : $signed(_GEN_63); // @[RegFile.scala 18:19]
  always @(posedge clock) begin
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_0 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'h0 == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_0 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_1 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'h1 == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_1 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_2 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'h2 == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_2 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_3 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'h3 == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_3 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_4 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'h4 == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_4 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_5 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'h5 == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_5 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_6 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'h6 == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_6 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_7 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'h7 == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_7 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_8 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'h8 == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_8 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_9 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'h9 == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_9 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_10 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'ha == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_10 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_11 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'hb == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_11 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_12 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'hc == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_12 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_13 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'hd == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_13 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_14 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'he == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_14 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_15 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'hf == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_15 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_16 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'h10 == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_16 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_17 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'h11 == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_17 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_18 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'h12 == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_18 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_19 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'h13 == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_19 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_20 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'h14 == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_20 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_21 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'h15 == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_21 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_22 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'h16 == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_22 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_23 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'h17 == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_23 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_24 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'h18 == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_24 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_25 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'h19 == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_25 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_26 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'h1a == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_26 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_27 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'h1b == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_27 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_28 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'h1c == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_28 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_29 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'h1d == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_29 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_30 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'h1e == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_30 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
    if (reset) begin // @[RegFile.scala 15:24]
      regfile_31 <= 32'sh0; // @[RegFile.scala 15:24]
    end else if (io_reg_write & io_w_reg != 5'h0) begin // @[RegFile.scala 20:42]
      if (5'h1f == io_w_reg) begin // @[RegFile.scala 21:23]
        regfile_31 <= io_w_data; // @[RegFile.scala 21:23]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  regfile_0 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  regfile_1 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  regfile_2 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  regfile_3 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  regfile_4 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  regfile_5 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  regfile_6 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  regfile_7 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  regfile_8 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  regfile_9 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  regfile_10 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  regfile_11 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  regfile_12 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  regfile_13 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  regfile_14 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  regfile_15 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  regfile_16 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  regfile_17 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  regfile_18 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  regfile_19 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  regfile_20 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  regfile_21 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  regfile_22 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  regfile_23 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  regfile_24 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  regfile_25 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  regfile_26 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  regfile_27 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  regfile_28 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  regfile_29 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  regfile_30 = _RAND_30[31:0];
  _RAND_31 = {1{`RANDOM}};
  regfile_31 = _RAND_31[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module AluControl(
  input  [2:0] io_func3,
  input        io_func7,
  input  [2:0] io_aluOp,
  output [4:0] io_out
);
  wire [5:0] _io_out_T = {2'h0,io_func7,io_func3}; // @[Cat.scala 30:58]
  wire [4:0] _io_out_T_1 = {2'h0,io_func3}; // @[Cat.scala 30:58]
  wire [5:0] _io_out_T_2 = {3'h2,io_func3}; // @[Cat.scala 30:58]
  wire [4:0] _GEN_1 = io_aluOp == 3'h3 ? 5'h1f : 5'h0; // @[Alu_Control.scala 26:32 Alu_Control.scala 27:12]
  wire [5:0] _GEN_2 = io_aluOp == 3'h2 ? _io_out_T_2 : {{1'd0}, _GEN_1}; // @[Alu_Control.scala 22:32 Alu_Control.scala 23:12]
  wire [5:0] _GEN_3 = io_aluOp == 3'h1 ? {{1'd0}, _io_out_T_1} : _GEN_2; // @[Alu_Control.scala 18:32 Alu_Control.scala 19:12]
  wire [5:0] _GEN_4 = io_aluOp == 3'h0 ? _io_out_T : _GEN_3; // @[Alu_Control.scala 15:26 Alu_Control.scala 16:12]
  assign io_out = _GEN_4[4:0];
endmodule
module ALU(
  input  [31:0] io_in_A,
  input  [31:0] io_in_B,
  input  [4:0]  io_alu_Op,
  output [31:0] io_out
);
  wire  _T_10 = 5'h0 == io_alu_Op | 5'h0 == io_alu_Op | 5'h0 == io_alu_Op | 5'h0 == io_alu_Op | 5'h0 == io_alu_Op | 5'h0
     == io_alu_Op; // @[Conditional.scala 37:55]
  wire [31:0] _result_T_2 = $signed(io_in_A) + $signed(io_in_B); // @[ALU.scala 47:25]
  wire  _T_13 = 5'h1 == io_alu_Op | 5'h1 == io_alu_Op; // @[Conditional.scala 37:55]
  wire [31:0] _result_T_3 = io_in_A; // @[ALU.scala 50:26]
  wire [62:0] _GEN_11 = {{31'd0}, _result_T_3}; // @[ALU.scala 50:33]
  wire [62:0] _result_T_6 = _GEN_11 << io_in_B[4:0]; // @[ALU.scala 50:51]
  wire  _T_16 = 5'h2 == io_alu_Op | 5'h2 == io_alu_Op; // @[Conditional.scala 37:55]
  wire [1:0] _result_T_8 = $signed(io_in_A) < $signed(io_in_B) ? $signed(2'sh1) : $signed(2'sh0); // @[ALU.scala 53:20]
  wire  _T_19 = 5'h3 == io_alu_Op | 5'h3 == io_alu_Op; // @[Conditional.scala 37:55]
  wire [1:0] _result_T_12 = io_in_A < io_in_B ? $signed(2'sh1) : $signed(2'sh0); // @[ALU.scala 56:20]
  wire  _T_22 = 5'h4 == io_alu_Op | 5'h4 == io_alu_Op; // @[Conditional.scala 37:55]
  wire [31:0] _result_T_14 = $signed(io_in_A) ^ $signed(io_in_B); // @[ALU.scala 59:25]
  wire  _T_25 = 5'h5 == io_alu_Op | 5'h5 == io_alu_Op; // @[Conditional.scala 37:55]
  wire [31:0] _result_T_18 = io_in_A >> io_in_B[4:0]; // @[ALU.scala 62:51]
  wire  _T_28 = 5'h6 == io_alu_Op | 5'h6 == io_alu_Op; // @[Conditional.scala 37:55]
  wire [31:0] _result_T_20 = $signed(io_in_A) | $signed(io_in_B); // @[ALU.scala 65:25]
  wire  _T_31 = 5'h7 == io_alu_Op | 5'h7 == io_alu_Op; // @[Conditional.scala 37:55]
  wire [31:0] _result_T_22 = $signed(io_in_A) & $signed(io_in_B); // @[ALU.scala 68:25]
  wire  _T_32 = 5'h8 == io_alu_Op; // @[Conditional.scala 37:30]
  wire [31:0] _result_T_25 = $signed(io_in_A) - $signed(io_in_B); // @[ALU.scala 71:25]
  wire  _T_35 = 5'hd == io_alu_Op | 5'hd == io_alu_Op; // @[Conditional.scala 37:55]
  wire [31:0] _result_T_27 = $signed(io_in_A) >>> io_in_B[4:0]; // @[ALU.scala 74:26]
  wire  _T_38 = 5'h1f == io_alu_Op | 5'h1f == io_alu_Op; // @[Conditional.scala 37:55]
  wire [31:0] _GEN_0 = _T_38 ? $signed(io_in_A) : $signed(32'sh0); // @[Conditional.scala 39:67 ALU.scala 77:14]
  wire [31:0] _GEN_1 = _T_35 ? $signed(_result_T_27) : $signed(_GEN_0); // @[Conditional.scala 39:67 ALU.scala 74:14]
  wire [31:0] _GEN_2 = _T_32 ? $signed(_result_T_25) : $signed(_GEN_1); // @[Conditional.scala 39:67 ALU.scala 71:14]
  wire [31:0] _GEN_3 = _T_31 ? $signed(_result_T_22) : $signed(_GEN_2); // @[Conditional.scala 39:67 ALU.scala 68:14]
  wire [31:0] _GEN_4 = _T_28 ? $signed(_result_T_20) : $signed(_GEN_3); // @[Conditional.scala 39:67 ALU.scala 65:14]
  wire [31:0] _GEN_5 = _T_25 ? $signed(_result_T_18) : $signed(_GEN_4); // @[Conditional.scala 39:67 ALU.scala 62:14]
  wire [31:0] _GEN_6 = _T_22 ? $signed(_result_T_14) : $signed(_GEN_5); // @[Conditional.scala 39:67 ALU.scala 59:14]
  wire [31:0] _GEN_7 = _T_19 ? $signed({{30{_result_T_12[1]}},_result_T_12}) : $signed(_GEN_6); // @[Conditional.scala 39:67 ALU.scala 56:14]
  wire [31:0] _GEN_8 = _T_16 ? $signed({{30{_result_T_8[1]}},_result_T_8}) : $signed(_GEN_7); // @[Conditional.scala 39:67 ALU.scala 53:14]
  wire [62:0] _GEN_9 = _T_13 ? $signed(_result_T_6) : $signed({{31{_GEN_8[31]}},_GEN_8}); // @[Conditional.scala 39:67 ALU.scala 50:14]
  wire [62:0] _GEN_10 = _T_10 ? $signed({{31{_result_T_2[31]}},_result_T_2}) : $signed(_GEN_9); // @[Conditional.scala 40:58 ALU.scala 47:14]
  assign io_out = _GEN_10[31:0]; // @[ALU.scala 81:10]
endmodule
module Branch(
  input  [2:0]  io_fnct3,
  input         io_branch,
  input  [31:0] io_arg_x,
  input  [31:0] io_arg_y,
  output        io_br_taken
);
  wire  _GEN_0 = io_fnct3 == 3'h7 & io_arg_x >= io_arg_y; // @[Branch.scala 38:33 Branch.scala 39:19 Branch.scala 14:15]
  wire  _GEN_1 = io_fnct3 == 3'h6 ? io_arg_x < io_arg_y : _GEN_0; // @[Branch.scala 34:33 Branch.scala 35:19]
  wire  _GEN_2 = io_fnct3 == 3'h5 ? $signed(io_arg_x) >= $signed(io_arg_y) : _GEN_1; // @[Branch.scala 30:33 Branch.scala 31:19]
  wire  _GEN_3 = io_fnct3 == 3'h4 ? $signed(io_arg_x) < $signed(io_arg_y) : _GEN_2; // @[Branch.scala 26:33 Branch.scala 27:19]
  wire  _GEN_4 = io_fnct3 == 3'h1 ? $signed(io_arg_x) != $signed(io_arg_y) : _GEN_3; // @[Branch.scala 22:33 Branch.scala 23:19]
  wire  _GEN_5 = io_fnct3 == 3'h0 ? $signed(io_arg_x) == $signed(io_arg_y) : _GEN_4; // @[Branch.scala 18:28 Branch.scala 19:19]
  assign io_br_taken = io_branch & _GEN_5; // @[Branch.scala 16:19 Branch.scala 14:15]
endmodule
module Jalr(
  input  [31:0] io_imme,
  input  [31:0] io_rdata1,
  output [31:0] io_out
);
  wire [31:0] computedAddr = io_imme + io_rdata1; // @[Jalr.scala 11:30]
  assign io_out = computedAddr & 32'hfffffffe; // @[Jalr.scala 14:26]
endmodule
module Forwarding(
  input  [4:0] io_IDEX_rs1,
  input  [4:0] io_IDEX_rs2,
  input  [4:0] io_EXMEM_rd,
  input        io_EXMEM_regWr,
  input  [4:0] io_MEMWB_rd,
  input        io_MEMWB_regWr,
  output [1:0] io_forward_a,
  output [1:0] io_forward_b
);
  wire  _T_2 = io_EXMEM_regWr & io_EXMEM_rd != 5'h0; // @[Forwarding.scala 22:36]
  wire  _T_3 = io_EXMEM_rd == io_IDEX_rs1; // @[Forwarding.scala 23:26]
  wire  _T_4 = io_EXMEM_regWr & io_EXMEM_rd != 5'h0 & _T_3; // @[Forwarding.scala 22:66]
  wire  _T_5 = io_EXMEM_rd == io_IDEX_rs2; // @[Forwarding.scala 23:66]
  wire  _T_6 = _T_4 & io_EXMEM_rd == io_IDEX_rs2; // @[Forwarding.scala 23:50]
  wire  _T_11 = _T_2 & _T_5; // @[Forwarding.scala 27:72]
  wire [1:0] _GEN_0 = _T_4 ? 2'h2 : 2'h0; // @[Forwarding.scala 32:44 Forwarding.scala 33:22 Forwarding.scala 19:18]
  wire [1:0] _GEN_1 = _T_11 ? 2'h2 : 2'h0; // @[Forwarding.scala 28:44 Forwarding.scala 29:22 Forwarding.scala 20:18]
  wire [1:0] _GEN_2 = _T_11 ? 2'h0 : _GEN_0; // @[Forwarding.scala 28:44 Forwarding.scala 19:18]
  wire [1:0] _GEN_3 = _T_4 & io_EXMEM_rd == io_IDEX_rs2 ? 2'h2 : _GEN_2; // @[Forwarding.scala 23:84 Forwarding.scala 24:22]
  wire [1:0] _GEN_4 = _T_4 & io_EXMEM_rd == io_IDEX_rs2 ? 2'h2 : _GEN_1; // @[Forwarding.scala 23:84 Forwarding.scala 25:22]
  wire  _T_19 = io_MEMWB_regWr & io_MEMWB_rd != 5'h0; // @[Forwarding.scala 37:38]
  wire  _T_21 = io_MEMWB_regWr & io_MEMWB_rd != 5'h0 & io_MEMWB_rd == io_IDEX_rs1; // @[Forwarding.scala 37:70]
  wire  _T_22 = io_MEMWB_rd == io_IDEX_rs2; // @[Forwarding.scala 37:119]
  wire  _T_31 = ~_T_6; // @[Forwarding.scala 38:13]
  wire  _T_32 = io_MEMWB_regWr & io_MEMWB_rd != 5'h0 & io_MEMWB_rd == io_IDEX_rs1 & io_MEMWB_rd == io_IDEX_rs2 & _T_31; // @[Forwarding.scala 37:136]
  wire  _T_43 = ~_T_11; // @[Forwarding.scala 43:13]
  wire  _T_44 = _T_19 & _T_22 & _T_43; // @[Forwarding.scala 42:109]
  wire  _T_55 = ~_T_4; // @[Forwarding.scala 47:13]
  wire  _T_56 = _T_21 & _T_55; // @[Forwarding.scala 46:109]
  wire [1:0] _GEN_5 = _T_56 ? 2'h1 : _GEN_3; // @[Forwarding.scala 47:105 Forwarding.scala 48:22]
  wire [1:0] _GEN_6 = _T_44 ? 2'h1 : _GEN_4; // @[Forwarding.scala 43:105 Forwarding.scala 44:22]
  wire [1:0] _GEN_7 = _T_44 ? _GEN_3 : _GEN_5; // @[Forwarding.scala 43:105]
  assign io_forward_a = _T_32 ? 2'h1 : _GEN_7; // @[Forwarding.scala 38:139 Forwarding.scala 39:22]
  assign io_forward_b = _T_32 ? 2'h1 : _GEN_6; // @[Forwarding.scala 38:139 Forwarding.scala 40:22]
endmodule
module HazardDetection(
  input  [31:0] io_IF_ID_inst,
  input         io_ID_EX_memRead,
  input  [4:0]  io_ID_EX_rd,
  input  [31:0] io_pc_in,
  input  [31:0] io_current_pc,
  output        io_inst_forward,
  output        io_pc_forward,
  output        io_ctrl_forward,
  output [31:0] io_inst_out,
  output [31:0] io_pc_out,
  output [31:0] io_current_pc_out
);
  wire [4:0] Rs1 = io_IF_ID_inst[19:15]; // @[HazardDetectionUnit.scala 21:26]
  wire [4:0] Rs2 = io_IF_ID_inst[24:20]; // @[HazardDetectionUnit.scala 22:26]
  assign io_inst_forward = io_ID_EX_memRead & (io_ID_EX_rd == Rs1 | io_ID_EX_rd == Rs2); // @[HazardDetectionUnit.scala 24:33]
  assign io_pc_forward = io_ID_EX_memRead & (io_ID_EX_rd == Rs1 | io_ID_EX_rd == Rs2); // @[HazardDetectionUnit.scala 24:33]
  assign io_ctrl_forward = io_ID_EX_memRead & (io_ID_EX_rd == Rs1 | io_ID_EX_rd == Rs2); // @[HazardDetectionUnit.scala 24:33]
  assign io_inst_out = io_IF_ID_inst; // @[HazardDetectionUnit.scala 33:15]
  assign io_pc_out = io_pc_in; // @[HazardDetectionUnit.scala 34:13]
  assign io_current_pc_out = io_current_pc; // @[HazardDetectionUnit.scala 35:21]
endmodule
module BranchForward(
  input  [4:0] io_ID_EX_RD,
  input  [4:0] io_EX_MEM_RD,
  input  [4:0] io_MEM_WB_RD,
  input        io_ID_EX_memRd,
  input        io_EX_MEM_memRd,
  input        io_MEM_WB_memRd,
  input  [4:0] io_rs1,
  input  [4:0] io_rs2,
  input        io_ctrl_branch,
  output [3:0] io_forward_rs1,
  output [3:0] io_forward_rs2
);
  wire  _T_1 = io_ID_EX_RD != 5'h0; // @[BranchForward.scala 28:22]
  wire  _T_3 = io_ID_EX_RD != 5'h0 & ~io_ID_EX_memRd; // @[BranchForward.scala 28:30]
  wire  _T_4 = io_ID_EX_RD == io_rs1; // @[BranchForward.scala 29:24]
  wire  _T_5 = io_ID_EX_RD == io_rs2; // @[BranchForward.scala 29:50]
  wire  _GEN_2 = _T_4 ? 1'h0 : _T_5; // @[BranchForward.scala 32:42 BranchForward.scala 23:18]
  wire  _GEN_3 = io_ID_EX_RD == io_rs1 & io_ID_EX_RD == io_rs2 | io_ID_EX_RD == io_rs1; // @[BranchForward.scala 29:62 BranchForward.scala 30:24]
  wire  _GEN_4 = io_ID_EX_RD == io_rs1 & io_ID_EX_RD == io_rs2 | _GEN_2; // @[BranchForward.scala 29:62 BranchForward.scala 31:24]
  wire  _GEN_5 = io_ID_EX_RD != 5'h0 & ~io_ID_EX_memRd & _GEN_3; // @[BranchForward.scala 28:57 BranchForward.scala 22:18]
  wire  _GEN_6 = io_ID_EX_RD != 5'h0 & ~io_ID_EX_memRd & _GEN_4; // @[BranchForward.scala 28:57 BranchForward.scala 23:18]
  wire  _T_9 = io_EX_MEM_RD != 5'h0; // @[BranchForward.scala 40:23]
  wire  _T_11 = io_EX_MEM_RD != 5'h0 & ~io_EX_MEM_memRd; // @[BranchForward.scala 40:31]
  wire  _T_12 = io_EX_MEM_RD == io_rs1; // @[BranchForward.scala 41:25]
  wire  _T_13 = io_EX_MEM_RD == io_rs2; // @[BranchForward.scala 41:52]
  wire  _T_17 = _T_1 & _T_4; // @[BranchForward.scala 41:88]
  wire  _T_20 = ~(_T_1 & _T_4 & _T_5); // @[BranchForward.scala 41:66]
  wire  _T_26 = ~_T_17; // @[BranchForward.scala 44:45]
  wire  _T_32 = ~(_T_1 & _T_5); // @[BranchForward.scala 46:45]
  wire [1:0] _GEN_7 = _T_13 & ~(_T_1 & _T_5) ? 2'h2 : {{1'd0}, _GEN_6}; // @[BranchForward.scala 46:95 BranchForward.scala 47:24]
  wire [1:0] _GEN_8 = _T_12 & ~_T_17 ? 2'h2 : {{1'd0}, _GEN_5}; // @[BranchForward.scala 44:95 BranchForward.scala 45:24]
  wire [1:0] _GEN_9 = _T_12 & ~_T_17 ? {{1'd0}, _GEN_6} : _GEN_7; // @[BranchForward.scala 44:95]
  wire [1:0] _GEN_10 = io_EX_MEM_RD == io_rs1 & io_EX_MEM_RD == io_rs2 & ~(_T_1 & _T_4 & _T_5) ? 2'h2 : _GEN_8; // @[BranchForward.scala 41:142 BranchForward.scala 42:24]
  wire [1:0] _GEN_11 = io_EX_MEM_RD == io_rs1 & io_EX_MEM_RD == io_rs2 & ~(_T_1 & _T_4 & _T_5) ? 2'h2 : _GEN_9; // @[BranchForward.scala 41:142 BranchForward.scala 43:24]
  wire [1:0] _GEN_12 = io_EX_MEM_RD != 5'h0 & ~io_EX_MEM_memRd ? _GEN_10 : {{1'd0}, _GEN_5}; // @[BranchForward.scala 40:59]
  wire [1:0] _GEN_13 = io_EX_MEM_RD != 5'h0 & ~io_EX_MEM_memRd ? _GEN_11 : {{1'd0}, _GEN_6}; // @[BranchForward.scala 40:59]
  wire  _T_34 = io_MEM_WB_RD != 5'h0; // @[BranchForward.scala 52:23]
  wire  _T_36 = io_MEM_WB_RD != 5'h0 & ~io_MEM_WB_memRd; // @[BranchForward.scala 52:31]
  wire  _T_37 = io_MEM_WB_RD == io_rs1; // @[BranchForward.scala 53:25]
  wire  _T_38 = io_MEM_WB_RD == io_rs2; // @[BranchForward.scala 53:52]
  wire  _T_49 = _T_9 & _T_12; // @[BranchForward.scala 53:167]
  wire  _T_63 = ~_T_49; // @[BranchForward.scala 56:97]
  wire [1:0] _GEN_14 = _T_38 & _T_32 & ~(_T_9 & _T_13) ? 2'h3 : _GEN_13; // @[BranchForward.scala 58:149 BranchForward.scala 59:24]
  wire [1:0] _GEN_15 = _T_37 & _T_26 & ~_T_49 ? 2'h3 : _GEN_12; // @[BranchForward.scala 56:149 BranchForward.scala 57:24]
  wire [1:0] _GEN_16 = _T_37 & _T_26 & ~_T_49 ? _GEN_13 : _GEN_14; // @[BranchForward.scala 56:149]
  wire [1:0] _GEN_17 = io_MEM_WB_RD == io_rs1 & io_MEM_WB_RD == io_rs2 & _T_20 & ~(_T_9 & _T_12 & _T_13) ? 2'h3 :
    _GEN_15; // @[BranchForward.scala 53:223 BranchForward.scala 54:24]
  wire [1:0] _GEN_18 = io_MEM_WB_RD == io_rs1 & io_MEM_WB_RD == io_rs2 & _T_20 & ~(_T_9 & _T_12 & _T_13) ? 2'h3 :
    _GEN_16; // @[BranchForward.scala 53:223 BranchForward.scala 55:24]
  wire [1:0] _GEN_19 = io_MEM_WB_RD != 5'h0 & ~io_MEM_WB_memRd ? _GEN_17 : _GEN_12; // @[BranchForward.scala 52:59]
  wire [1:0] _GEN_20 = io_MEM_WB_RD != 5'h0 & ~io_MEM_WB_memRd ? _GEN_18 : _GEN_13; // @[BranchForward.scala 52:59]
  wire [3:0] _GEN_21 = _T_34 & io_MEM_WB_memRd & _T_37 & _T_26 & _T_63 ? 4'ha : 4'h0; // @[BranchForward.scala 73:198 BranchForward.scala 74:22 BranchForward.scala 22:18]
  wire [3:0] _GEN_22 = _T_36 & _T_37 & _T_26 & _T_63 ? 4'h8 : _GEN_21; // @[BranchForward.scala 71:198 BranchForward.scala 72:22]
  wire [3:0] _GEN_23 = _T_9 & io_EX_MEM_memRd & _T_12 & _T_26 ? 4'h9 : _GEN_22; // @[BranchForward.scala 69:144 BranchForward.scala 70:22]
  wire [3:0] _GEN_24 = _T_11 & _T_12 & _T_26 ? 4'h7 : _GEN_23; // @[BranchForward.scala 67:144 BranchForward.scala 68:22]
  wire [3:0] _GEN_25 = _T_3 & _T_4 ? 4'h6 : _GEN_24; // @[BranchForward.scala 65:83 BranchForward.scala 66:22]
  wire [3:0] _GEN_26 = ~io_ctrl_branch ? _GEN_25 : 4'h0; // @[BranchForward.scala 64:38 BranchForward.scala 22:18]
  wire [1:0] _GEN_28 = io_ctrl_branch ? _GEN_20 : 2'h0; // @[BranchForward.scala 26:32 BranchForward.scala 23:18]
  assign io_forward_rs1 = io_ctrl_branch ? {{2'd0}, _GEN_19} : _GEN_26; // @[BranchForward.scala 26:32]
  assign io_forward_rs2 = {{2'd0}, _GEN_28}; // @[BranchForward.scala 26:32 BranchForward.scala 23:18]
endmodule
module StructuralHazard(
  input  [4:0] io_rs1,
  input  [4:0] io_rs2,
  input        io_MEM_WB_regWr,
  input  [4:0] io_MEM_WB_Rd,
  output       io_fwd_rs1,
  output       io_fwd_rs2
);
  assign io_fwd_rs1 = io_MEM_WB_regWr & io_MEM_WB_Rd == io_rs1; // @[StructuralHazard.scala 17:24]
  assign io_fwd_rs2 = io_MEM_WB_regWr & io_MEM_WB_Rd == io_rs2; // @[StructuralHazard.scala 24:24]
endmodule
module core(
  input        clock,
  input        reset,
  output [3:0] io_out
);
  wire  IF_ID__clock; // @[core.scala 9:26]
  wire  IF_ID__reset; // @[core.scala 9:26]
  wire [31:0] IF_ID__io_pc4_in; // @[core.scala 9:26]
  wire [31:0] IF_ID__io_SelectedPC; // @[core.scala 9:26]
  wire [31:0] IF_ID__io_SelectedInstr; // @[core.scala 9:26]
  wire [31:0] IF_ID__io_pc4_out; // @[core.scala 9:26]
  wire [31:0] IF_ID__io_SelectedPC_out; // @[core.scala 9:26]
  wire [31:0] IF_ID__io_SelectedInstr_out; // @[core.scala 9:26]
  wire  ID_EX__clock; // @[core.scala 10:26]
  wire [4:0] ID_EX__io_rs1_in; // @[core.scala 10:26]
  wire [4:0] ID_EX__io_rs2_in; // @[core.scala 10:26]
  wire [31:0] ID_EX__io_rs1_data_in; // @[core.scala 10:26]
  wire [31:0] ID_EX__io_rs2_data_in; // @[core.scala 10:26]
  wire [31:0] ID_EX__io_imm; // @[core.scala 10:26]
  wire [4:0] ID_EX__io_rd_in; // @[core.scala 10:26]
  wire [2:0] ID_EX__io_func3_in; // @[core.scala 10:26]
  wire  ID_EX__io_func7_in; // @[core.scala 10:26]
  wire  ID_EX__io_ctrl_MemWr_in; // @[core.scala 10:26]
  wire  ID_EX__io_ctrl_MemRd_in; // @[core.scala 10:26]
  wire  ID_EX__io_ctrl_Reg_W_in; // @[core.scala 10:26]
  wire  ID_EX__io_ctrl_MemToReg_in; // @[core.scala 10:26]
  wire [2:0] ID_EX__io_ctrl_AluOp_in; // @[core.scala 10:26]
  wire [1:0] ID_EX__io_ctrl_OpA_in; // @[core.scala 10:26]
  wire  ID_EX__io_ctrl_OpB_in; // @[core.scala 10:26]
  wire [31:0] ID_EX__io_IFID_pc4_in; // @[core.scala 10:26]
  wire [4:0] ID_EX__io_rs1_out; // @[core.scala 10:26]
  wire [4:0] ID_EX__io_rs2_out; // @[core.scala 10:26]
  wire [31:0] ID_EX__io_rs1_data_out; // @[core.scala 10:26]
  wire [31:0] ID_EX__io_rs2_data_out; // @[core.scala 10:26]
  wire [4:0] ID_EX__io_rd_out; // @[core.scala 10:26]
  wire [31:0] ID_EX__io_imm_out; // @[core.scala 10:26]
  wire [2:0] ID_EX__io_func3_out; // @[core.scala 10:26]
  wire  ID_EX__io_func7_out; // @[core.scala 10:26]
  wire  ID_EX__io_ctrl_MemWr_out; // @[core.scala 10:26]
  wire  ID_EX__io_ctrl_MemRd_out; // @[core.scala 10:26]
  wire  ID_EX__io_ctrl_Reg_W_out; // @[core.scala 10:26]
  wire  ID_EX__io_ctrl_MemToReg_out; // @[core.scala 10:26]
  wire [2:0] ID_EX__io_ctrl_AluOp_out; // @[core.scala 10:26]
  wire [1:0] ID_EX__io_ctrl_OpA_out; // @[core.scala 10:26]
  wire  ID_EX__io_ctrl_OpB_out; // @[core.scala 10:26]
  wire [31:0] ID_EX__io_IFID_pc4_out; // @[core.scala 10:26]
  wire  EX_MEM_M_clock; // @[core.scala 11:28]
  wire  EX_MEM_M_io_IDEX_MEMRD; // @[core.scala 11:28]
  wire  EX_MEM_M_io_IDEX_MEMWR; // @[core.scala 11:28]
  wire  EX_MEM_M_io_IDEX_MEMTOREG; // @[core.scala 11:28]
  wire  EX_MEM_M_io_IDEX_REG_W; // @[core.scala 11:28]
  wire [31:0] EX_MEM_M_io_IDEX_rs2; // @[core.scala 11:28]
  wire [4:0] EX_MEM_M_io_IDEX_rd; // @[core.scala 11:28]
  wire [31:0] EX_MEM_M_io_alu_out; // @[core.scala 11:28]
  wire [2:0] EX_MEM_M_io_fun3in; // @[core.scala 11:28]
  wire  EX_MEM_M_io_EXMEM_memRd_out; // @[core.scala 11:28]
  wire  EX_MEM_M_io_EXMEM_memWr_out; // @[core.scala 11:28]
  wire  EX_MEM_M_io_EXMEM_memToReg_out; // @[core.scala 11:28]
  wire  EX_MEM_M_io_EXMEM_reg_w_out; // @[core.scala 11:28]
  wire [31:0] EX_MEM_M_io_EXMEM_rs2_out; // @[core.scala 11:28]
  wire [4:0] EX_MEM_M_io_EXMEM_rd_out; // @[core.scala 11:28]
  wire [31:0] EX_MEM_M_io_EXMEM_alu_out; // @[core.scala 11:28]
  wire [2:0] EX_MEM_M_io_fun3out; // @[core.scala 11:28]
  wire  MEM_WB_M_clock; // @[core.scala 12:28]
  wire  MEM_WB_M_io_EXMEM_MEMTOREG; // @[core.scala 12:28]
  wire  MEM_WB_M_io_EXMEM_REG_W; // @[core.scala 12:28]
  wire  MEM_WB_M_io_EXMEM_MEMRD; // @[core.scala 12:28]
  wire [4:0] MEM_WB_M_io_EXMEM_rd; // @[core.scala 12:28]
  wire [31:0] MEM_WB_M_io_in_dataMem_out; // @[core.scala 12:28]
  wire [31:0] MEM_WB_M_io_in_alu_out; // @[core.scala 12:28]
  wire  MEM_WB_M_io_MEMWB_memToReg_out; // @[core.scala 12:28]
  wire  MEM_WB_M_io_MEMWB_reg_w_out; // @[core.scala 12:28]
  wire  MEM_WB_M_io_MEMWB_memRd_out; // @[core.scala 12:28]
  wire [4:0] MEM_WB_M_io_MEMWB_rd_out; // @[core.scala 12:28]
  wire [31:0] MEM_WB_M_io_MEMWB_dataMem_out; // @[core.scala 12:28]
  wire [31:0] MEM_WB_M_io_MEMWB_alu_out; // @[core.scala 12:28]
  wire  PC_clock; // @[core.scala 15:22]
  wire  PC_reset; // @[core.scala 15:22]
  wire [31:0] PC_io_in; // @[core.scala 15:22]
  wire [31:0] PC_io_out; // @[core.scala 15:22]
  wire [31:0] PC4_io_pc; // @[core.scala 16:24]
  wire [31:0] PC4_io_out; // @[core.scala 16:24]
  wire  InstMemory_clock; // @[core.scala 19:30]
  wire [31:0] InstMemory_io_addr; // @[core.scala 19:30]
  wire [31:0] InstMemory_io_data; // @[core.scala 19:30]
  wire  DataMemory_clock; // @[core.scala 20:30]
  wire  DataMemory_reset; // @[core.scala 20:30]
  wire  DataMemory_io_mem_write; // @[core.scala 20:30]
  wire [31:0] DataMemory_io_addr; // @[core.scala 20:30]
  wire [31:0] DataMemory_io_dataIn; // @[core.scala 20:30]
  wire [31:0] DataMemory_io_dataOut; // @[core.scala 20:30]
  wire [2:0] DataMemory_io_fun3; // @[core.scala 20:30]
  wire  DataMemory_io_mem_read; // @[core.scala 20:30]
  wire [6:0] control_module_io_opcode; // @[core.scala 23:33]
  wire  control_module_io_mem_write; // @[core.scala 23:33]
  wire  control_module_io_branch; // @[core.scala 23:33]
  wire  control_module_io_mem_read; // @[core.scala 23:33]
  wire  control_module_io_reg_write; // @[core.scala 23:33]
  wire  control_module_io_men_to_reg; // @[core.scala 23:33]
  wire [2:0] control_module_io_alu_operation; // @[core.scala 23:33]
  wire [1:0] control_module_io_operand_A; // @[core.scala 23:33]
  wire  control_module_io_operand_B; // @[core.scala 23:33]
  wire [1:0] control_module_io_extend; // @[core.scala 23:33]
  wire [1:0] control_module_io_next_pc_sel; // @[core.scala 23:33]
  wire [31:0] ImmGen_io_instr; // @[core.scala 24:27]
  wire [31:0] ImmGen_io_pc; // @[core.scala 24:27]
  wire [31:0] ImmGen_io_I_type; // @[core.scala 24:27]
  wire [31:0] ImmGen_io_S_type; // @[core.scala 24:27]
  wire [31:0] ImmGen_io_SB_type; // @[core.scala 24:27]
  wire [31:0] ImmGen_io_U_type; // @[core.scala 24:27]
  wire [31:0] ImmGen_io_UJ_type; // @[core.scala 24:27]
  wire  RegFile_clock; // @[core.scala 25:27]
  wire  RegFile_reset; // @[core.scala 25:27]
  wire [4:0] RegFile_io_rs1; // @[core.scala 25:27]
  wire [4:0] RegFile_io_rs2; // @[core.scala 25:27]
  wire  RegFile_io_reg_write; // @[core.scala 25:27]
  wire [4:0] RegFile_io_w_reg; // @[core.scala 25:27]
  wire [31:0] RegFile_io_w_data; // @[core.scala 25:27]
  wire [31:0] RegFile_io_rdata1; // @[core.scala 25:27]
  wire [31:0] RegFile_io_rdata2; // @[core.scala 25:27]
  wire [2:0] ALU_Control_io_func3; // @[core.scala 26:32]
  wire  ALU_Control_io_func7; // @[core.scala 26:32]
  wire [2:0] ALU_Control_io_aluOp; // @[core.scala 26:32]
  wire [4:0] ALU_Control_io_out; // @[core.scala 26:32]
  wire [31:0] ALU_io_in_A; // @[core.scala 28:24]
  wire [31:0] ALU_io_in_B; // @[core.scala 28:24]
  wire [4:0] ALU_io_alu_Op; // @[core.scala 28:24]
  wire [31:0] ALU_io_out; // @[core.scala 28:24]
  wire [2:0] Branch_M_io_fnct3; // @[core.scala 30:29]
  wire  Branch_M_io_branch; // @[core.scala 30:29]
  wire [31:0] Branch_M_io_arg_x; // @[core.scala 30:29]
  wire [31:0] Branch_M_io_arg_y; // @[core.scala 30:29]
  wire  Branch_M_io_br_taken; // @[core.scala 30:29]
  wire [31:0] JALR_io_imme; // @[core.scala 31:26]
  wire [31:0] JALR_io_rdata1; // @[core.scala 31:26]
  wire [31:0] JALR_io_out; // @[core.scala 31:26]
  wire [4:0] Forwarding_io_IDEX_rs1; // @[core.scala 34:30]
  wire [4:0] Forwarding_io_IDEX_rs2; // @[core.scala 34:30]
  wire [4:0] Forwarding_io_EXMEM_rd; // @[core.scala 34:30]
  wire  Forwarding_io_EXMEM_regWr; // @[core.scala 34:30]
  wire [4:0] Forwarding_io_MEMWB_rd; // @[core.scala 34:30]
  wire  Forwarding_io_MEMWB_regWr; // @[core.scala 34:30]
  wire [1:0] Forwarding_io_forward_a; // @[core.scala 34:30]
  wire [1:0] Forwarding_io_forward_b; // @[core.scala 34:30]
  wire [31:0] HazardDetect_io_IF_ID_inst; // @[core.scala 35:32]
  wire  HazardDetect_io_ID_EX_memRead; // @[core.scala 35:32]
  wire [4:0] HazardDetect_io_ID_EX_rd; // @[core.scala 35:32]
  wire [31:0] HazardDetect_io_pc_in; // @[core.scala 35:32]
  wire [31:0] HazardDetect_io_current_pc; // @[core.scala 35:32]
  wire  HazardDetect_io_inst_forward; // @[core.scala 35:32]
  wire  HazardDetect_io_pc_forward; // @[core.scala 35:32]
  wire  HazardDetect_io_ctrl_forward; // @[core.scala 35:32]
  wire [31:0] HazardDetect_io_inst_out; // @[core.scala 35:32]
  wire [31:0] HazardDetect_io_pc_out; // @[core.scala 35:32]
  wire [31:0] HazardDetect_io_current_pc_out; // @[core.scala 35:32]
  wire [4:0] Branch_Forward_io_ID_EX_RD; // @[core.scala 36:35]
  wire [4:0] Branch_Forward_io_EX_MEM_RD; // @[core.scala 36:35]
  wire [4:0] Branch_Forward_io_MEM_WB_RD; // @[core.scala 36:35]
  wire  Branch_Forward_io_ID_EX_memRd; // @[core.scala 36:35]
  wire  Branch_Forward_io_EX_MEM_memRd; // @[core.scala 36:35]
  wire  Branch_Forward_io_MEM_WB_memRd; // @[core.scala 36:35]
  wire [4:0] Branch_Forward_io_rs1; // @[core.scala 36:35]
  wire [4:0] Branch_Forward_io_rs2; // @[core.scala 36:35]
  wire  Branch_Forward_io_ctrl_branch; // @[core.scala 36:35]
  wire [3:0] Branch_Forward_io_forward_rs1; // @[core.scala 36:35]
  wire [3:0] Branch_Forward_io_forward_rs2; // @[core.scala 36:35]
  wire [4:0] Structural_io_rs1; // @[core.scala 37:30]
  wire [4:0] Structural_io_rs2; // @[core.scala 37:30]
  wire  Structural_io_MEM_WB_regWr; // @[core.scala 37:30]
  wire [4:0] Structural_io_MEM_WB_Rd; // @[core.scala 37:30]
  wire  Structural_io_fwd_rs1; // @[core.scala 37:30]
  wire  Structural_io_fwd_rs2; // @[core.scala 37:30]
  wire  _T_3 = HazardDetect_io_pc_forward; // @[core.scala 46:45]
  wire  _T_4 = ~HazardDetect_io_inst_forward; // @[core.scala 57:40]
  wire  _T_5 = HazardDetect_io_inst_forward; // @[core.scala 59:47]
  wire [31:0] _GEN_2 = HazardDetect_io_inst_forward ? $signed(HazardDetect_io_current_pc_out) : $signed(32'sh0); // @[core.scala 59:56 core.scala 60:14 core.scala 62:14]
  wire [31:0] PC_for = ~HazardDetect_io_inst_forward ? $signed(PC_io_out) : $signed(_GEN_2); // @[core.scala 57:49 core.scala 58:14]
  wire [31:0] _GEN_4 = _T_5 ? HazardDetect_io_inst_out : 32'h0; // @[core.scala 68:56 core.scala 69:21 core.scala 71:21]
  wire [31:0] Instruction_F = _T_4 ? InstMemory_io_data : _GEN_4; // @[core.scala 66:49 core.scala 67:21]
  wire  _T_8 = control_module_io_opcode == 7'h33; // @[core.scala 87:36]
  wire  _T_9 = control_module_io_opcode == 7'h13; // @[core.scala 88:32]
  wire  _T_10 = control_module_io_opcode == 7'h33 | _T_9; // @[core.scala 87:45]
  wire  _T_11 = control_module_io_opcode == 7'h23; // @[core.scala 89:32]
  wire  _T_12 = _T_10 | _T_11; // @[core.scala 88:41]
  wire  _T_13 = control_module_io_opcode == 7'h3; // @[core.scala 90:32]
  wire  _T_14 = _T_12 | _T_13; // @[core.scala 89:41]
  wire  _T_15 = control_module_io_opcode == 7'h63; // @[core.scala 91:32]
  wire  _T_16 = _T_14 | _T_15; // @[core.scala 90:40]
  wire  _T_17 = control_module_io_opcode == 7'h67; // @[core.scala 92:32]
  wire  _T_18 = _T_16 | _T_17; // @[core.scala 91:41]
  wire  _T_21 = _T_8 | _T_11; // @[core.scala 99:45]
  wire  _T_23 = _T_21 | _T_15; // @[core.scala 100:41]
  wire [31:0] _GEN_8 = control_module_io_extend == 2'h2 ? $signed(ImmGen_io_U_type) : $signed(32'sh0); // @[core.scala 116:52 core.scala 117:16 core.scala 119:16]
  wire [31:0] _GEN_9 = control_module_io_extend == 2'h1 ? $signed(ImmGen_io_S_type) : $signed(_GEN_8); // @[core.scala 114:52 core.scala 115:16]
  wire [31:0] _GEN_11 = Structural_io_fwd_rs1 ? $signed(RegFile_io_w_data) : $signed(32'sh0); // @[core.scala 133:48 core.scala 134:19 core.scala 136:19]
  wire [31:0] _GEN_13 = Structural_io_fwd_rs2 ? $signed(RegFile_io_w_data) : $signed(32'sh0); // @[core.scala 141:48 core.scala 142:19 core.scala 144:19]
  wire [31:0] _Branch_M_io_arg_x_T_1 = 4'h0 == Branch_Forward_io_forward_rs1 ? $signed(RegFile_io_rdata1) : $signed(32'sh0
    ); // @[Mux.scala 80:57]
  wire [31:0] _Branch_M_io_arg_x_T_3 = 4'h1 == Branch_Forward_io_forward_rs1 ? $signed(ALU_io_out) : $signed(
    _Branch_M_io_arg_x_T_1); // @[Mux.scala 80:57]
  wire [31:0] _Branch_M_io_arg_x_T_5 = 4'h2 == Branch_Forward_io_forward_rs1 ? $signed(EX_MEM_M_io_EXMEM_alu_out) :
    $signed(_Branch_M_io_arg_x_T_3); // @[Mux.scala 80:57]
  wire [31:0] _Branch_M_io_arg_x_T_7 = 4'h3 == Branch_Forward_io_forward_rs1 ? $signed(RegFile_io_w_data) : $signed(
    _Branch_M_io_arg_x_T_5); // @[Mux.scala 80:57]
  wire [31:0] _Branch_M_io_arg_x_T_9 = 4'h4 == Branch_Forward_io_forward_rs1 ? $signed(DataMemory_io_dataOut) : $signed(
    _Branch_M_io_arg_x_T_7); // @[Mux.scala 80:57]
  wire [31:0] _Branch_M_io_arg_x_T_11 = 4'h5 == Branch_Forward_io_forward_rs1 ? $signed(RegFile_io_w_data) : $signed(
    _Branch_M_io_arg_x_T_9); // @[Mux.scala 80:57]
  wire [31:0] _Branch_M_io_arg_x_T_13 = 4'h6 == Branch_Forward_io_forward_rs1 ? $signed(RegFile_io_rdata1) : $signed(
    _Branch_M_io_arg_x_T_11); // @[Mux.scala 80:57]
  wire [31:0] _Branch_M_io_arg_x_T_15 = 4'h7 == Branch_Forward_io_forward_rs1 ? $signed(RegFile_io_rdata1) : $signed(
    _Branch_M_io_arg_x_T_13); // @[Mux.scala 80:57]
  wire [31:0] _Branch_M_io_arg_x_T_17 = 4'h8 == Branch_Forward_io_forward_rs1 ? $signed(RegFile_io_rdata1) : $signed(
    _Branch_M_io_arg_x_T_15); // @[Mux.scala 80:57]
  wire [31:0] _Branch_M_io_arg_x_T_19 = 4'h9 == Branch_Forward_io_forward_rs1 ? $signed(RegFile_io_rdata1) : $signed(
    _Branch_M_io_arg_x_T_17); // @[Mux.scala 80:57]
  wire [31:0] _JALR_io_rdata1_T_12 = 4'h0 == Branch_Forward_io_forward_rs1 ? RegFile_io_rdata1 : 32'h0; // @[Mux.scala 80:57]
  wire [31:0] _JALR_io_rdata1_T_14 = 4'h1 == Branch_Forward_io_forward_rs1 ? RegFile_io_rdata1 : _JALR_io_rdata1_T_12; // @[Mux.scala 80:57]
  wire [31:0] _JALR_io_rdata1_T_16 = 4'h2 == Branch_Forward_io_forward_rs1 ? RegFile_io_rdata1 : _JALR_io_rdata1_T_14; // @[Mux.scala 80:57]
  wire [31:0] _JALR_io_rdata1_T_18 = 4'h3 == Branch_Forward_io_forward_rs1 ? RegFile_io_rdata1 : _JALR_io_rdata1_T_16; // @[Mux.scala 80:57]
  wire [31:0] _JALR_io_rdata1_T_20 = 4'h4 == Branch_Forward_io_forward_rs1 ? RegFile_io_rdata1 : _JALR_io_rdata1_T_18; // @[Mux.scala 80:57]
  wire [31:0] _JALR_io_rdata1_T_22 = 4'h5 == Branch_Forward_io_forward_rs1 ? RegFile_io_rdata1 : _JALR_io_rdata1_T_20; // @[Mux.scala 80:57]
  wire [31:0] _JALR_io_rdata1_T_24 = 4'h6 == Branch_Forward_io_forward_rs1 ? ALU_io_out : _JALR_io_rdata1_T_22; // @[Mux.scala 80:57]
  wire [31:0] _JALR_io_rdata1_T_26 = 4'h7 == Branch_Forward_io_forward_rs1 ? EX_MEM_M_io_EXMEM_alu_out :
    _JALR_io_rdata1_T_24; // @[Mux.scala 80:57]
  wire [31:0] _JALR_io_rdata1_T_28 = 4'h8 == Branch_Forward_io_forward_rs1 ? RegFile_io_w_data : _JALR_io_rdata1_T_26; // @[Mux.scala 80:57]
  wire [31:0] _JALR_io_rdata1_T_30 = 4'h9 == Branch_Forward_io_forward_rs1 ? DataMemory_io_dataOut :
    _JALR_io_rdata1_T_28; // @[Mux.scala 80:57]
  wire [31:0] _Branch_M_io_arg_y_T_1 = 4'h0 == Branch_Forward_io_forward_rs2 ? $signed(RegFile_io_rdata2) : $signed(32'sh0
    ); // @[Mux.scala 80:57]
  wire [31:0] _Branch_M_io_arg_y_T_3 = 4'h1 == Branch_Forward_io_forward_rs2 ? $signed(ALU_io_out) : $signed(
    _Branch_M_io_arg_y_T_1); // @[Mux.scala 80:57]
  wire [31:0] _Branch_M_io_arg_y_T_5 = 4'h2 == Branch_Forward_io_forward_rs2 ? $signed(EX_MEM_M_io_EXMEM_alu_out) :
    $signed(_Branch_M_io_arg_y_T_3); // @[Mux.scala 80:57]
  wire [31:0] _Branch_M_io_arg_y_T_7 = 4'h3 == Branch_Forward_io_forward_rs2 ? $signed(RegFile_io_w_data) : $signed(
    _Branch_M_io_arg_y_T_5); // @[Mux.scala 80:57]
  wire [31:0] _Branch_M_io_arg_y_T_9 = 4'h4 == Branch_Forward_io_forward_rs2 ? $signed(DataMemory_io_dataOut) : $signed(
    _Branch_M_io_arg_y_T_7); // @[Mux.scala 80:57]
  wire [31:0] _GEN_23 = Branch_M_io_br_taken & control_module_io_branch ? $signed(ImmGen_io_SB_type) : $signed(
    PC4_io_out); // @[core.scala 234:84 core.scala 235:26 core.scala 241:26]
  wire [31:0] _GEN_25 = Branch_M_io_br_taken & control_module_io_branch ? 32'h0 : PC4_io_out; // @[core.scala 234:84 core.scala 237:34 core.scala 76:23]
  wire [31:0] _GEN_26 = Branch_M_io_br_taken & control_module_io_branch ? $signed(32'sh0) : $signed(PC_for); // @[core.scala 234:84 core.scala 238:37 core.scala 77:26]
  wire [31:0] _GEN_27 = Branch_M_io_br_taken & control_module_io_branch ? 32'h0 : Instruction_F; // @[core.scala 234:84 core.scala 239:41 core.scala 78:29]
  wire [31:0] _GEN_28 = control_module_io_next_pc_sel == 2'h3 ? $signed(JALR_io_out) : $signed(PC4_io_out); // @[core.scala 249:63 core.scala 250:22 core.scala 256:22]
  wire [31:0] _GEN_30 = control_module_io_next_pc_sel == 2'h3 ? 32'h0 : PC4_io_out; // @[core.scala 249:63 core.scala 252:30 core.scala 76:23]
  wire [31:0] _GEN_31 = control_module_io_next_pc_sel == 2'h3 ? $signed(32'sh0) : $signed(PC_for); // @[core.scala 249:63 core.scala 253:33 core.scala 77:26]
  wire [31:0] _GEN_32 = control_module_io_next_pc_sel == 2'h3 ? 32'h0 : Instruction_F; // @[core.scala 249:63 core.scala 254:37 core.scala 78:29]
  wire [31:0] _GEN_33 = control_module_io_next_pc_sel == 2'h2 ? $signed(ImmGen_io_UJ_type) : $signed(_GEN_28); // @[core.scala 243:63 core.scala 244:22]
  wire [31:0] _GEN_35 = control_module_io_next_pc_sel == 2'h2 ? 32'h0 : _GEN_30; // @[core.scala 243:63 core.scala 246:30]
  wire [31:0] _GEN_36 = control_module_io_next_pc_sel == 2'h2 ? $signed(32'sh0) : $signed(_GEN_31); // @[core.scala 243:63 core.scala 247:33]
  wire [31:0] _GEN_37 = control_module_io_next_pc_sel == 2'h2 ? 32'h0 : _GEN_32; // @[core.scala 243:63 core.scala 248:37]
  wire [31:0] _GEN_38 = control_module_io_next_pc_sel == 2'h1 ? $signed(_GEN_23) : $signed(_GEN_33); // @[core.scala 233:57]
  wire [31:0] _GEN_40 = control_module_io_next_pc_sel == 2'h1 ? _GEN_25 : _GEN_35; // @[core.scala 233:57]
  wire [31:0] _GEN_41 = control_module_io_next_pc_sel == 2'h1 ? $signed(_GEN_26) : $signed(_GEN_36); // @[core.scala 233:57]
  wire [31:0] _GEN_42 = control_module_io_next_pc_sel == 2'h1 ? _GEN_27 : _GEN_37; // @[core.scala 233:57]
  wire [31:0] _GEN_48 = Forwarding_io_forward_a == 2'h2 ? $signed(EX_MEM_M_io_EXMEM_alu_out) : $signed(
    ID_EX__io_rs1_data_out); // @[core.scala 294:57 core.scala 295:25 core.scala 297:25]
  wire [31:0] _GEN_56 = MEM_WB_M_io_MEMWB_memToReg_out ? $signed(MEM_WB_M_io_MEMWB_dataMem_out) : $signed(32'sh0); // @[core.scala 346:57 core.scala 347:9 core.scala 349:9]
  wire [31:0] d = ~MEM_WB_M_io_MEMWB_memToReg_out ? $signed(MEM_WB_M_io_MEMWB_alu_out) : $signed(_GEN_56); // @[core.scala 344:51 core.scala 345:9]
  wire [31:0] _GEN_49 = Forwarding_io_forward_a == 2'h1 ? $signed(d) : $signed(_GEN_48); // @[core.scala 292:57 core.scala 293:25]
  wire [31:0] _GEN_50 = Forwarding_io_forward_a == 2'h0 ? $signed(ID_EX__io_rs1_data_out) : $signed(_GEN_49); // @[core.scala 290:51 core.scala 291:25]
  wire [31:0] _GEN_52 = Forwarding_io_forward_b == 2'h2 ? $signed(EX_MEM_M_io_EXMEM_alu_out) : $signed(32'sh0); // @[core.scala 306:50 core.scala 307:17 core.scala 309:17]
  wire [31:0] _GEN_53 = Forwarding_io_forward_b == 2'h1 ? $signed(d) : $signed(_GEN_52); // @[core.scala 304:50 core.scala 305:17]
  wire [31:0] RS2_value = Forwarding_io_forward_b == 2'h0 ? $signed(ID_EX__io_rs2_data_out) : $signed(_GEN_53); // @[core.scala 302:44 core.scala 303:17]
  IF_ID IF_ID_ ( // @[core.scala 9:26]
    .clock(IF_ID__clock),
    .reset(IF_ID__reset),
    .io_pc4_in(IF_ID__io_pc4_in),
    .io_SelectedPC(IF_ID__io_SelectedPC),
    .io_SelectedInstr(IF_ID__io_SelectedInstr),
    .io_pc4_out(IF_ID__io_pc4_out),
    .io_SelectedPC_out(IF_ID__io_SelectedPC_out),
    .io_SelectedInstr_out(IF_ID__io_SelectedInstr_out)
  );
  ID_EX ID_EX_ ( // @[core.scala 10:26]
    .clock(ID_EX__clock),
    .io_rs1_in(ID_EX__io_rs1_in),
    .io_rs2_in(ID_EX__io_rs2_in),
    .io_rs1_data_in(ID_EX__io_rs1_data_in),
    .io_rs2_data_in(ID_EX__io_rs2_data_in),
    .io_imm(ID_EX__io_imm),
    .io_rd_in(ID_EX__io_rd_in),
    .io_func3_in(ID_EX__io_func3_in),
    .io_func7_in(ID_EX__io_func7_in),
    .io_ctrl_MemWr_in(ID_EX__io_ctrl_MemWr_in),
    .io_ctrl_MemRd_in(ID_EX__io_ctrl_MemRd_in),
    .io_ctrl_Reg_W_in(ID_EX__io_ctrl_Reg_W_in),
    .io_ctrl_MemToReg_in(ID_EX__io_ctrl_MemToReg_in),
    .io_ctrl_AluOp_in(ID_EX__io_ctrl_AluOp_in),
    .io_ctrl_OpA_in(ID_EX__io_ctrl_OpA_in),
    .io_ctrl_OpB_in(ID_EX__io_ctrl_OpB_in),
    .io_IFID_pc4_in(ID_EX__io_IFID_pc4_in),
    .io_rs1_out(ID_EX__io_rs1_out),
    .io_rs2_out(ID_EX__io_rs2_out),
    .io_rs1_data_out(ID_EX__io_rs1_data_out),
    .io_rs2_data_out(ID_EX__io_rs2_data_out),
    .io_rd_out(ID_EX__io_rd_out),
    .io_imm_out(ID_EX__io_imm_out),
    .io_func3_out(ID_EX__io_func3_out),
    .io_func7_out(ID_EX__io_func7_out),
    .io_ctrl_MemWr_out(ID_EX__io_ctrl_MemWr_out),
    .io_ctrl_MemRd_out(ID_EX__io_ctrl_MemRd_out),
    .io_ctrl_Reg_W_out(ID_EX__io_ctrl_Reg_W_out),
    .io_ctrl_MemToReg_out(ID_EX__io_ctrl_MemToReg_out),
    .io_ctrl_AluOp_out(ID_EX__io_ctrl_AluOp_out),
    .io_ctrl_OpA_out(ID_EX__io_ctrl_OpA_out),
    .io_ctrl_OpB_out(ID_EX__io_ctrl_OpB_out),
    .io_IFID_pc4_out(ID_EX__io_IFID_pc4_out)
  );
  EX_MEM EX_MEM_M ( // @[core.scala 11:28]
    .clock(EX_MEM_M_clock),
    .io_IDEX_MEMRD(EX_MEM_M_io_IDEX_MEMRD),
    .io_IDEX_MEMWR(EX_MEM_M_io_IDEX_MEMWR),
    .io_IDEX_MEMTOREG(EX_MEM_M_io_IDEX_MEMTOREG),
    .io_IDEX_REG_W(EX_MEM_M_io_IDEX_REG_W),
    .io_IDEX_rs2(EX_MEM_M_io_IDEX_rs2),
    .io_IDEX_rd(EX_MEM_M_io_IDEX_rd),
    .io_alu_out(EX_MEM_M_io_alu_out),
    .io_fun3in(EX_MEM_M_io_fun3in),
    .io_EXMEM_memRd_out(EX_MEM_M_io_EXMEM_memRd_out),
    .io_EXMEM_memWr_out(EX_MEM_M_io_EXMEM_memWr_out),
    .io_EXMEM_memToReg_out(EX_MEM_M_io_EXMEM_memToReg_out),
    .io_EXMEM_reg_w_out(EX_MEM_M_io_EXMEM_reg_w_out),
    .io_EXMEM_rs2_out(EX_MEM_M_io_EXMEM_rs2_out),
    .io_EXMEM_rd_out(EX_MEM_M_io_EXMEM_rd_out),
    .io_EXMEM_alu_out(EX_MEM_M_io_EXMEM_alu_out),
    .io_fun3out(EX_MEM_M_io_fun3out)
  );
  MEM_WB MEM_WB_M ( // @[core.scala 12:28]
    .clock(MEM_WB_M_clock),
    .io_EXMEM_MEMTOREG(MEM_WB_M_io_EXMEM_MEMTOREG),
    .io_EXMEM_REG_W(MEM_WB_M_io_EXMEM_REG_W),
    .io_EXMEM_MEMRD(MEM_WB_M_io_EXMEM_MEMRD),
    .io_EXMEM_rd(MEM_WB_M_io_EXMEM_rd),
    .io_in_dataMem_out(MEM_WB_M_io_in_dataMem_out),
    .io_in_alu_out(MEM_WB_M_io_in_alu_out),
    .io_MEMWB_memToReg_out(MEM_WB_M_io_MEMWB_memToReg_out),
    .io_MEMWB_reg_w_out(MEM_WB_M_io_MEMWB_reg_w_out),
    .io_MEMWB_memRd_out(MEM_WB_M_io_MEMWB_memRd_out),
    .io_MEMWB_rd_out(MEM_WB_M_io_MEMWB_rd_out),
    .io_MEMWB_dataMem_out(MEM_WB_M_io_MEMWB_dataMem_out),
    .io_MEMWB_alu_out(MEM_WB_M_io_MEMWB_alu_out)
  );
  PC PC ( // @[core.scala 15:22]
    .clock(PC_clock),
    .reset(PC_reset),
    .io_in(PC_io_in),
    .io_out(PC_io_out)
  );
  PC4 PC4 ( // @[core.scala 16:24]
    .io_pc(PC4_io_pc),
    .io_out(PC4_io_out)
  );
  InstMem InstMemory ( // @[core.scala 19:30]
    .clock(InstMemory_clock),
    .io_addr(InstMemory_io_addr),
    .io_data(InstMemory_io_data)
  );
  Datamem DataMemory ( // @[core.scala 20:30]
    .clock(DataMemory_clock),
    .reset(DataMemory_reset),
    .io_mem_write(DataMemory_io_mem_write),
    .io_addr(DataMemory_io_addr),
    .io_dataIn(DataMemory_io_dataIn),
    .io_dataOut(DataMemory_io_dataOut),
    .io_fun3(DataMemory_io_fun3),
    .io_mem_read(DataMemory_io_mem_read)
  );
  Control control_module ( // @[core.scala 23:33]
    .io_opcode(control_module_io_opcode),
    .io_mem_write(control_module_io_mem_write),
    .io_branch(control_module_io_branch),
    .io_mem_read(control_module_io_mem_read),
    .io_reg_write(control_module_io_reg_write),
    .io_men_to_reg(control_module_io_men_to_reg),
    .io_alu_operation(control_module_io_alu_operation),
    .io_operand_A(control_module_io_operand_A),
    .io_operand_B(control_module_io_operand_B),
    .io_extend(control_module_io_extend),
    .io_next_pc_sel(control_module_io_next_pc_sel)
  );
  ImmGenerator ImmGen ( // @[core.scala 24:27]
    .io_instr(ImmGen_io_instr),
    .io_pc(ImmGen_io_pc),
    .io_I_type(ImmGen_io_I_type),
    .io_S_type(ImmGen_io_S_type),
    .io_SB_type(ImmGen_io_SB_type),
    .io_U_type(ImmGen_io_U_type),
    .io_UJ_type(ImmGen_io_UJ_type)
  );
  RegisterFile RegFile ( // @[core.scala 25:27]
    .clock(RegFile_clock),
    .reset(RegFile_reset),
    .io_rs1(RegFile_io_rs1),
    .io_rs2(RegFile_io_rs2),
    .io_reg_write(RegFile_io_reg_write),
    .io_w_reg(RegFile_io_w_reg),
    .io_w_data(RegFile_io_w_data),
    .io_rdata1(RegFile_io_rdata1),
    .io_rdata2(RegFile_io_rdata2)
  );
  AluControl ALU_Control ( // @[core.scala 26:32]
    .io_func3(ALU_Control_io_func3),
    .io_func7(ALU_Control_io_func7),
    .io_aluOp(ALU_Control_io_aluOp),
    .io_out(ALU_Control_io_out)
  );
  ALU ALU ( // @[core.scala 28:24]
    .io_in_A(ALU_io_in_A),
    .io_in_B(ALU_io_in_B),
    .io_alu_Op(ALU_io_alu_Op),
    .io_out(ALU_io_out)
  );
  Branch Branch_M ( // @[core.scala 30:29]
    .io_fnct3(Branch_M_io_fnct3),
    .io_branch(Branch_M_io_branch),
    .io_arg_x(Branch_M_io_arg_x),
    .io_arg_y(Branch_M_io_arg_y),
    .io_br_taken(Branch_M_io_br_taken)
  );
  Jalr JALR ( // @[core.scala 31:26]
    .io_imme(JALR_io_imme),
    .io_rdata1(JALR_io_rdata1),
    .io_out(JALR_io_out)
  );
  Forwarding Forwarding ( // @[core.scala 34:30]
    .io_IDEX_rs1(Forwarding_io_IDEX_rs1),
    .io_IDEX_rs2(Forwarding_io_IDEX_rs2),
    .io_EXMEM_rd(Forwarding_io_EXMEM_rd),
    .io_EXMEM_regWr(Forwarding_io_EXMEM_regWr),
    .io_MEMWB_rd(Forwarding_io_MEMWB_rd),
    .io_MEMWB_regWr(Forwarding_io_MEMWB_regWr),
    .io_forward_a(Forwarding_io_forward_a),
    .io_forward_b(Forwarding_io_forward_b)
  );
  HazardDetection HazardDetect ( // @[core.scala 35:32]
    .io_IF_ID_inst(HazardDetect_io_IF_ID_inst),
    .io_ID_EX_memRead(HazardDetect_io_ID_EX_memRead),
    .io_ID_EX_rd(HazardDetect_io_ID_EX_rd),
    .io_pc_in(HazardDetect_io_pc_in),
    .io_current_pc(HazardDetect_io_current_pc),
    .io_inst_forward(HazardDetect_io_inst_forward),
    .io_pc_forward(HazardDetect_io_pc_forward),
    .io_ctrl_forward(HazardDetect_io_ctrl_forward),
    .io_inst_out(HazardDetect_io_inst_out),
    .io_pc_out(HazardDetect_io_pc_out),
    .io_current_pc_out(HazardDetect_io_current_pc_out)
  );
  BranchForward Branch_Forward ( // @[core.scala 36:35]
    .io_ID_EX_RD(Branch_Forward_io_ID_EX_RD),
    .io_EX_MEM_RD(Branch_Forward_io_EX_MEM_RD),
    .io_MEM_WB_RD(Branch_Forward_io_MEM_WB_RD),
    .io_ID_EX_memRd(Branch_Forward_io_ID_EX_memRd),
    .io_EX_MEM_memRd(Branch_Forward_io_EX_MEM_memRd),
    .io_MEM_WB_memRd(Branch_Forward_io_MEM_WB_memRd),
    .io_rs1(Branch_Forward_io_rs1),
    .io_rs2(Branch_Forward_io_rs2),
    .io_ctrl_branch(Branch_Forward_io_ctrl_branch),
    .io_forward_rs1(Branch_Forward_io_forward_rs1),
    .io_forward_rs2(Branch_Forward_io_forward_rs2)
  );
  StructuralHazard Structural ( // @[core.scala 37:30]
    .io_rs1(Structural_io_rs1),
    .io_rs2(Structural_io_rs2),
    .io_MEM_WB_regWr(Structural_io_MEM_WB_regWr),
    .io_MEM_WB_Rd(Structural_io_MEM_WB_Rd),
    .io_fwd_rs1(Structural_io_fwd_rs1),
    .io_fwd_rs2(Structural_io_fwd_rs2)
  );
  assign io_out = 4'sh0; // @[core.scala 353:12]
  assign IF_ID__clock = clock;
  assign IF_ID__reset = reset;
  assign IF_ID__io_pc4_in = _T_3 ? PC4_io_out : _GEN_40; // @[core.scala 230:46 core.scala 76:23]
  assign IF_ID__io_SelectedPC = _T_3 ? $signed(PC_for) : $signed(_GEN_41); // @[core.scala 230:46 core.scala 77:26]
  assign IF_ID__io_SelectedInstr = _T_3 ? Instruction_F : _GEN_42; // @[core.scala 230:46 core.scala 78:29]
  assign ID_EX__clock = clock;
  assign ID_EX__io_rs1_in = RegFile_io_rs1; // @[core.scala 260:33]
  assign ID_EX__io_rs2_in = RegFile_io_rs2; // @[core.scala 261:33]
  assign ID_EX__io_rs1_data_in = ~Structural_io_fwd_rs1 ? $signed(RegFile_io_rdata1) : $signed(_GEN_11); // @[core.scala 131:42 core.scala 132:19]
  assign ID_EX__io_rs2_data_in = ~Structural_io_fwd_rs2 ? $signed(RegFile_io_rdata2) : $signed(_GEN_13); // @[core.scala 139:42 core.scala 140:19]
  assign ID_EX__io_imm = control_module_io_extend == 2'h0 ? $signed(ImmGen_io_I_type) : $signed(_GEN_9); // @[core.scala 112:45 core.scala 113:16]
  assign ID_EX__io_rd_in = IF_ID__io_SelectedInstr_out[11:7]; // @[core.scala 265:63]
  assign ID_EX__io_func3_in = IF_ID__io_SelectedInstr_out[14:12]; // @[core.scala 263:63]
  assign ID_EX__io_func7_in = IF_ID__io_SelectedInstr_out[30]; // @[core.scala 264:63]
  assign ID_EX__io_ctrl_MemWr_in = HazardDetect_io_ctrl_forward ? 1'h0 : control_module_io_mem_write; // @[core.scala 151:51 core.scala 152:33 core.scala 161:33]
  assign ID_EX__io_ctrl_MemRd_in = HazardDetect_io_ctrl_forward ? 1'h0 : control_module_io_mem_read; // @[core.scala 151:51 core.scala 153:34 core.scala 162:33]
  assign ID_EX__io_ctrl_Reg_W_in = HazardDetect_io_ctrl_forward ? 1'h0 : control_module_io_reg_write; // @[core.scala 151:51 core.scala 155:34 core.scala 164:34]
  assign ID_EX__io_ctrl_MemToReg_in = HazardDetect_io_ctrl_forward ? 1'h0 : control_module_io_men_to_reg; // @[core.scala 151:51 core.scala 154:36 core.scala 163:38]
  assign ID_EX__io_ctrl_AluOp_in = HazardDetect_io_ctrl_forward ? 3'h0 : control_module_io_alu_operation; // @[core.scala 151:51 core.scala 156:34 core.scala 165:34]
  assign ID_EX__io_ctrl_OpA_in = control_module_io_operand_A; // @[core.scala 281:27]
  assign ID_EX__io_ctrl_OpB_in = HazardDetect_io_ctrl_forward ? 1'h0 : control_module_io_operand_B; // @[core.scala 151:51 core.scala 157:33 core.scala 166:32]
  assign ID_EX__io_IFID_pc4_in = IF_ID__io_pc4_out; // @[core.scala 282:27]
  assign EX_MEM_M_clock = clock;
  assign EX_MEM_M_io_IDEX_MEMRD = ID_EX__io_ctrl_MemRd_out; // @[core.scala 318:37]
  assign EX_MEM_M_io_IDEX_MEMWR = ID_EX__io_ctrl_MemWr_out; // @[core.scala 319:37]
  assign EX_MEM_M_io_IDEX_MEMTOREG = ID_EX__io_ctrl_MemToReg_out; // @[core.scala 320:37]
  assign EX_MEM_M_io_IDEX_REG_W = ID_EX__io_ctrl_Reg_W_out; // @[core.scala 321:37]
  assign EX_MEM_M_io_IDEX_rs2 = Forwarding_io_forward_b == 2'h0 ? $signed(ID_EX__io_rs2_data_out) : $signed(_GEN_53); // @[core.scala 302:44 core.scala 303:17]
  assign EX_MEM_M_io_IDEX_rd = ID_EX__io_rd_out; // @[core.scala 271:37]
  assign EX_MEM_M_io_alu_out = ALU_io_out; // @[core.scala 323:37]
  assign EX_MEM_M_io_fun3in = ID_EX__io_func3_out; // @[core.scala 324:23]
  assign MEM_WB_M_clock = clock;
  assign MEM_WB_M_io_EXMEM_MEMTOREG = EX_MEM_M_io_EXMEM_memToReg_out; // @[core.scala 333:37]
  assign MEM_WB_M_io_EXMEM_REG_W = EX_MEM_M_io_EXMEM_reg_w_out; // @[core.scala 334:37]
  assign MEM_WB_M_io_EXMEM_MEMRD = EX_MEM_M_io_EXMEM_memRd_out; // @[core.scala 177:29]
  assign MEM_WB_M_io_EXMEM_rd = EX_MEM_M_io_EXMEM_rd_out; // @[core.scala 335:37]
  assign MEM_WB_M_io_in_dataMem_out = DataMemory_io_dataOut; // @[core.scala 336:37]
  assign MEM_WB_M_io_in_alu_out = EX_MEM_M_io_EXMEM_alu_out; // @[core.scala 337:37]
  assign PC_clock = clock;
  assign PC_reset = reset;
  assign PC_io_in = _T_3 ? $signed(HazardDetect_io_pc_out) : $signed(_GEN_38); // @[core.scala 230:46 core.scala 231:18]
  assign PC4_io_pc = PC_io_out; // @[core.scala 53:28]
  assign InstMemory_clock = clock;
  assign InstMemory_io_addr = PC_io_out; // @[core.scala 54:37]
  assign DataMemory_clock = clock;
  assign DataMemory_reset = reset;
  assign DataMemory_io_mem_write = EX_MEM_M_io_EXMEM_memWr_out; // @[core.scala 328:37]
  assign DataMemory_io_addr = EX_MEM_M_io_EXMEM_alu_out; // @[core.scala 330:66]
  assign DataMemory_io_dataIn = EX_MEM_M_io_EXMEM_rs2_out; // @[core.scala 329:37]
  assign DataMemory_io_fun3 = EX_MEM_M_io_fun3out; // @[core.scala 331:24]
  assign DataMemory_io_mem_read = EX_MEM_M_io_EXMEM_memRd_out; // @[core.scala 327:37]
  assign control_module_io_opcode = IF_ID__io_SelectedInstr_out[6:0]; // @[core.scala 85:60]
  assign ImmGen_io_instr = IF_ID__io_SelectedInstr_out; // @[core.scala 81:21]
  assign ImmGen_io_pc = IF_ID__io_SelectedPC_out; // @[core.scala 82:47]
  assign RegFile_clock = clock;
  assign RegFile_reset = reset;
  assign RegFile_io_rs1 = _T_18 ? IF_ID__io_SelectedInstr_out[19:15] : 5'h0; // @[core.scala 92:43 core.scala 93:22 core.scala 95:22]
  assign RegFile_io_rs2 = _T_23 ? IF_ID__io_SelectedInstr_out[24:20] : 5'h0; // @[core.scala 101:42 core.scala 102:22 core.scala 104:22]
  assign RegFile_io_reg_write = MEM_WB_M_io_MEMWB_reg_w_out; // @[core.scala 341:37]
  assign RegFile_io_w_reg = MEM_WB_M_io_MEMWB_rd_out; // @[core.scala 340:37]
  assign RegFile_io_w_data = ~MEM_WB_M_io_MEMWB_memToReg_out ? $signed(MEM_WB_M_io_MEMWB_alu_out) : $signed(_GEN_56); // @[core.scala 344:51 core.scala 345:9]
  assign ALU_Control_io_func3 = ID_EX__io_func3_out; // @[core.scala 269:37]
  assign ALU_Control_io_func7 = ID_EX__io_func7_out; // @[core.scala 270:37]
  assign ALU_Control_io_aluOp = ID_EX__io_ctrl_AluOp_out; // @[core.scala 267:37]
  assign ALU_io_in_A = ID_EX__io_ctrl_OpA_out == 2'h1 ? $signed(ID_EX__io_IFID_pc4_out) : $signed(_GEN_50); // @[core.scala 286:47 core.scala 287:21]
  assign ALU_io_in_B = ~ID_EX__io_ctrl_OpB_out ? $signed(RS2_value) : $signed(ID_EX__io_imm_out); // @[core.scala 311:43 core.scala 312:21 core.scala 314:21]
  assign ALU_io_alu_Op = ALU_Control_io_out; // @[core.scala 268:37]
  assign Branch_M_io_fnct3 = IF_ID__io_SelectedInstr_out[14:12]; // @[core.scala 227:53]
  assign Branch_M_io_branch = control_module_io_branch; // @[core.scala 228:24]
  assign Branch_M_io_arg_x = 4'ha == Branch_Forward_io_forward_rs1 ? $signed(RegFile_io_rdata1) : $signed(
    _Branch_M_io_arg_x_T_19); // @[Mux.scala 80:57]
  assign Branch_M_io_arg_y = 4'h5 == Branch_Forward_io_forward_rs2 ? $signed(RegFile_io_w_data) : $signed(
    _Branch_M_io_arg_y_T_9); // @[Mux.scala 80:57]
  assign JALR_io_imme = control_module_io_extend == 2'h0 ? $signed(ImmGen_io_I_type) : $signed(_GEN_9); // @[core.scala 217:30]
  assign JALR_io_rdata1 = 4'ha == Branch_Forward_io_forward_rs1 ? RegFile_io_w_data : _JALR_io_rdata1_T_30; // @[Mux.scala 80:57]
  assign Forwarding_io_IDEX_rs1 = ID_EX__io_rs1_out; // @[core.scala 274:35]
  assign Forwarding_io_IDEX_rs2 = ID_EX__io_rs2_out; // @[core.scala 275:35]
  assign Forwarding_io_EXMEM_rd = EX_MEM_M_io_EXMEM_rd_out; // @[core.scala 276:35]
  assign Forwarding_io_EXMEM_regWr = EX_MEM_M_io_EXMEM_reg_w_out; // @[core.scala 277:35]
  assign Forwarding_io_MEMWB_rd = MEM_WB_M_io_MEMWB_rd_out; // @[core.scala 278:35]
  assign Forwarding_io_MEMWB_regWr = MEM_WB_M_io_MEMWB_reg_w_out; // @[core.scala 279:35]
  assign HazardDetect_io_IF_ID_inst = IF_ID__io_SelectedInstr_out; // @[core.scala 171:32]
  assign HazardDetect_io_ID_EX_memRead = ID_EX__io_ctrl_MemRd_out; // @[core.scala 172:35]
  assign HazardDetect_io_ID_EX_rd = ID_EX__io_rd_out; // @[core.scala 173:30]
  assign HazardDetect_io_pc_in = IF_ID__io_pc4_out; // @[core.scala 174:48]
  assign HazardDetect_io_current_pc = IF_ID__io_SelectedPC_out; // @[core.scala 175:32]
  assign Branch_Forward_io_ID_EX_RD = ID_EX__io_rd_out; // @[core.scala 180:32]
  assign Branch_Forward_io_EX_MEM_RD = EX_MEM_M_io_EXMEM_rd_out; // @[core.scala 181:33]
  assign Branch_Forward_io_MEM_WB_RD = MEM_WB_M_io_MEMWB_rd_out; // @[core.scala 182:33]
  assign Branch_Forward_io_ID_EX_memRd = ID_EX__io_ctrl_MemRd_out; // @[core.scala 183:35]
  assign Branch_Forward_io_EX_MEM_memRd = EX_MEM_M_io_EXMEM_memRd_out; // @[core.scala 184:37]
  assign Branch_Forward_io_MEM_WB_memRd = MEM_WB_M_io_MEMWB_memRd_out; // @[core.scala 185:37]
  assign Branch_Forward_io_rs1 = IF_ID__io_SelectedInstr_out[19:15]; // @[core.scala 186:57]
  assign Branch_Forward_io_rs2 = IF_ID__io_SelectedInstr_out[24:20]; // @[core.scala 187:57]
  assign Branch_Forward_io_ctrl_branch = control_module_io_branch; // @[core.scala 188:35]
  assign Structural_io_rs1 = IF_ID__io_SelectedInstr_out[19:15]; // @[core.scala 123:54]
  assign Structural_io_rs2 = IF_ID__io_SelectedInstr_out[24:20]; // @[core.scala 124:55]
  assign Structural_io_MEM_WB_regWr = MEM_WB_M_io_EXMEM_REG_W; // @[core.scala 125:32]
  assign Structural_io_MEM_WB_Rd = MEM_WB_M_io_MEMWB_rd_out; // @[core.scala 126:29]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (DataMemory_io_mem_write & ~reset) begin
          $fwrite(32'h80000002,"Writing to DataMemory: %d\n",DataMemory_io_dataIn); // @[core.scala 40:15]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
