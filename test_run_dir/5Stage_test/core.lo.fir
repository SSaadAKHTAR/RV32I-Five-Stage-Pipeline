circuit core :
  module IF_ID :
    input clock : Clock
    input reset : UInt<1>
    input io_pc_in : SInt<32>
    input io_pc4_in : UInt<32>
    input io_SelectedPC : SInt<32>
    input io_SelectedInstr : UInt<32>
    output io_pc_out : SInt<32>
    output io_pc4_out : UInt<32>
    output io_SelectedPC_out : SInt<32>
    output io_SelectedInstr_out : UInt<32>

    reg Pc_In : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Pc_In) @[IF_ID.scala 18:39]
    reg Pc4_In : UInt<32>, clock with :
      reset => (UInt<1>("h0"), Pc4_In) @[IF_ID.scala 19:39]
    reg S_pc : SInt<32>, clock with :
      reset => (UInt<1>("h0"), S_pc) @[IF_ID.scala 20:39]
    reg S_instr : UInt<32>, clock with :
      reset => (UInt<1>("h0"), S_instr) @[IF_ID.scala 21:39]
    io_pc_out <= Pc_In @[IF_ID.scala 28:29]
    io_pc4_out <= Pc4_In @[IF_ID.scala 29:29]
    io_SelectedPC_out <= S_pc @[IF_ID.scala 30:29]
    io_SelectedInstr_out <= S_instr @[IF_ID.scala 31:29]
    Pc_In <= mux(reset, asSInt(UInt<32>("h0")), io_pc_in) @[IF_ID.scala 18:39 IF_ID.scala 18:39 IF_ID.scala 23:11]
    Pc4_In <= mux(reset, UInt<32>("h0"), io_pc4_in) @[IF_ID.scala 19:39 IF_ID.scala 19:39 IF_ID.scala 24:11]
    S_pc <= mux(reset, asSInt(UInt<32>("h0")), io_SelectedPC) @[IF_ID.scala 20:39 IF_ID.scala 20:39 IF_ID.scala 25:9]
    S_instr <= mux(reset, UInt<32>("h0"), io_SelectedInstr) @[IF_ID.scala 21:39 IF_ID.scala 21:39 IF_ID.scala 26:12]

  module ID_EX :
    input clock : Clock
    input reset : UInt<1>
    input io_rs1_in : UInt<5>
    input io_rs2_in : UInt<5>
    input io_rs1_data_in : SInt<32>
    input io_rs2_data_in : SInt<32>
    input io_imm : SInt<32>
    input io_rd_in : UInt<5>
    input io_func3_in : UInt<3>
    input io_func7_in : UInt<1>
    input io_ctrl_MemWr_in : UInt<1>
    input io_ctrl_Branch_in : UInt<1>
    input io_ctrl_MemRd_in : UInt<1>
    input io_ctrl_Reg_W_in : UInt<1>
    input io_ctrl_MemToReg_in : UInt<1>
    input io_ctrl_AluOp_in : UInt<3>
    input io_ctrl_OpA_in : UInt<2>
    input io_ctrl_OpB_in : UInt<1>
    input io_ctrl_nextpc_in : UInt<2>
    input io_IFID_pc4_in : UInt<32>
    output io_rs1_out : UInt<5>
    output io_rs2_out : UInt<5>
    output io_rs1_data_out : SInt<32>
    output io_rs2_data_out : SInt<32>
    output io_rd_out : UInt<5>
    output io_imm_out : SInt<32>
    output io_func3_out : UInt<3>
    output io_func7_out : UInt<1>
    output io_ctrl_MemWr_out : UInt<1>
    output io_ctrl_Branch_out : UInt<1>
    output io_ctrl_MemRd_out : UInt<1>
    output io_ctrl_Reg_W_out : UInt<1>
    output io_ctrl_MemToReg_out : UInt<1>
    output io_ctrl_AluOp_out : UInt<3>
    output io_ctrl_OpA_out : UInt<2>
    output io_ctrl_OpB_out : UInt<1>
    output io_ctrl_nextpc_out : UInt<2>
    output io_IFID_pc4_out : UInt<32>

    reg io_rs1_out_REG : UInt<5>, clock with :
      reset => (UInt<1>("h0"), io_rs1_out_REG) @[ID_EX.scala 46:36]
    reg io_rs2_out_REG : UInt<5>, clock with :
      reset => (UInt<1>("h0"), io_rs2_out_REG) @[ID_EX.scala 47:36]
    reg io_rs1_data_out_REG : SInt<32>, clock with :
      reset => (UInt<1>("h0"), io_rs1_data_out_REG) @[ID_EX.scala 48:36]
    reg io_rs2_data_out_REG : SInt<32>, clock with :
      reset => (UInt<1>("h0"), io_rs2_data_out_REG) @[ID_EX.scala 49:36]
    reg io_imm_out_REG : SInt<32>, clock with :
      reset => (UInt<1>("h0"), io_imm_out_REG) @[ID_EX.scala 50:36]
    reg io_rd_out_REG : UInt<5>, clock with :
      reset => (UInt<1>("h0"), io_rd_out_REG) @[ID_EX.scala 51:36]
    reg io_func3_out_REG : UInt<3>, clock with :
      reset => (UInt<1>("h0"), io_func3_out_REG) @[ID_EX.scala 52:36]
    reg io_func7_out_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_func7_out_REG) @[ID_EX.scala 53:36]
    reg io_ctrl_MemWr_out_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_ctrl_MemWr_out_REG) @[ID_EX.scala 54:36]
    reg io_ctrl_Branch_out_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_ctrl_Branch_out_REG) @[ID_EX.scala 55:36]
    reg io_ctrl_MemRd_out_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_ctrl_MemRd_out_REG) @[ID_EX.scala 56:36]
    reg io_ctrl_Reg_W_out_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_ctrl_Reg_W_out_REG) @[ID_EX.scala 57:36]
    reg io_ctrl_MemToReg_out_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_ctrl_MemToReg_out_REG) @[ID_EX.scala 58:36]
    reg io_ctrl_AluOp_out_REG : UInt<3>, clock with :
      reset => (UInt<1>("h0"), io_ctrl_AluOp_out_REG) @[ID_EX.scala 59:36]
    reg io_ctrl_OpA_out_REG : UInt<2>, clock with :
      reset => (UInt<1>("h0"), io_ctrl_OpA_out_REG) @[ID_EX.scala 60:36]
    reg io_ctrl_OpB_out_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_ctrl_OpB_out_REG) @[ID_EX.scala 61:36]
    reg io_ctrl_nextpc_out_REG : UInt<2>, clock with :
      reset => (UInt<1>("h0"), io_ctrl_nextpc_out_REG) @[ID_EX.scala 62:36]
    reg io_IFID_pc4_out_REG : UInt<32>, clock with :
      reset => (UInt<1>("h0"), io_IFID_pc4_out_REG) @[ID_EX.scala 63:36]
    io_rs1_out <= io_rs1_out_REG @[ID_EX.scala 46:25]
    io_rs2_out <= io_rs2_out_REG @[ID_EX.scala 47:25]
    io_rs1_data_out <= io_rs1_data_out_REG @[ID_EX.scala 48:25]
    io_rs2_data_out <= io_rs2_data_out_REG @[ID_EX.scala 49:25]
    io_rd_out <= io_rd_out_REG @[ID_EX.scala 51:25]
    io_imm_out <= io_imm_out_REG @[ID_EX.scala 50:25]
    io_func3_out <= io_func3_out_REG @[ID_EX.scala 52:25]
    io_func7_out <= io_func7_out_REG @[ID_EX.scala 53:25]
    io_ctrl_MemWr_out <= io_ctrl_MemWr_out_REG @[ID_EX.scala 54:25]
    io_ctrl_Branch_out <= io_ctrl_Branch_out_REG @[ID_EX.scala 55:25]
    io_ctrl_MemRd_out <= io_ctrl_MemRd_out_REG @[ID_EX.scala 56:25]
    io_ctrl_Reg_W_out <= io_ctrl_Reg_W_out_REG @[ID_EX.scala 57:25]
    io_ctrl_MemToReg_out <= io_ctrl_MemToReg_out_REG @[ID_EX.scala 58:25]
    io_ctrl_AluOp_out <= io_ctrl_AluOp_out_REG @[ID_EX.scala 59:25]
    io_ctrl_OpA_out <= io_ctrl_OpA_out_REG @[ID_EX.scala 60:25]
    io_ctrl_OpB_out <= io_ctrl_OpB_out_REG @[ID_EX.scala 61:25]
    io_ctrl_nextpc_out <= io_ctrl_nextpc_out_REG @[ID_EX.scala 62:25]
    io_IFID_pc4_out <= io_IFID_pc4_out_REG @[ID_EX.scala 63:25]
    io_rs1_out_REG <= io_rs1_in @[ID_EX.scala 46:36]
    io_rs2_out_REG <= io_rs2_in @[ID_EX.scala 47:36]
    io_rs1_data_out_REG <= io_rs1_data_in @[ID_EX.scala 48:36]
    io_rs2_data_out_REG <= io_rs2_data_in @[ID_EX.scala 49:36]
    io_imm_out_REG <= io_imm @[ID_EX.scala 50:36]
    io_rd_out_REG <= io_rd_in @[ID_EX.scala 51:36]
    io_func3_out_REG <= io_func3_in @[ID_EX.scala 52:36]
    io_func7_out_REG <= io_func7_in @[ID_EX.scala 53:36]
    io_ctrl_MemWr_out_REG <= io_ctrl_MemWr_in @[ID_EX.scala 54:36]
    io_ctrl_Branch_out_REG <= io_ctrl_Branch_in @[ID_EX.scala 55:36]
    io_ctrl_MemRd_out_REG <= io_ctrl_MemRd_in @[ID_EX.scala 56:36]
    io_ctrl_Reg_W_out_REG <= io_ctrl_Reg_W_in @[ID_EX.scala 57:36]
    io_ctrl_MemToReg_out_REG <= io_ctrl_MemToReg_in @[ID_EX.scala 58:36]
    io_ctrl_AluOp_out_REG <= io_ctrl_AluOp_in @[ID_EX.scala 59:36]
    io_ctrl_OpA_out_REG <= io_ctrl_OpA_in @[ID_EX.scala 60:36]
    io_ctrl_OpB_out_REG <= io_ctrl_OpB_in @[ID_EX.scala 61:36]
    io_ctrl_nextpc_out_REG <= io_ctrl_nextpc_in @[ID_EX.scala 62:36]
    io_IFID_pc4_out_REG <= io_IFID_pc4_in @[ID_EX.scala 63:36]

  module EX_MEM :
    input clock : Clock
    input reset : UInt<1>
    input io_IDEX_MEMRD : UInt<1>
    input io_IDEX_MEMWR : UInt<1>
    input io_IDEX_MEMTOREG : UInt<1>
    input io_IDEX_REG_W : UInt<1>
    input io_IDEX_rs2 : SInt<32>
    input io_IDEX_rd : UInt<5>
    input io_alu_out : SInt<32>
    input io_fun3in : UInt<3>
    output io_EXMEM_memRd_out : UInt<1>
    output io_EXMEM_memWr_out : UInt<1>
    output io_EXMEM_memToReg_out : UInt<1>
    output io_EXMEM_reg_w_out : UInt<1>
    output io_EXMEM_rs2_out : SInt<32>
    output io_EXMEM_rd_out : UInt<5>
    output io_EXMEM_alu_out : SInt<32>
    output io_fun3out : UInt<3>

    reg io_EXMEM_memRd_out_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_EXMEM_memRd_out_REG) @[EX_MEM.scala 26:39]
    reg io_EXMEM_memWr_out_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_EXMEM_memWr_out_REG) @[EX_MEM.scala 27:39]
    reg io_EXMEM_memToReg_out_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_EXMEM_memToReg_out_REG) @[EX_MEM.scala 28:39]
    reg io_EXMEM_reg_w_out_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_EXMEM_reg_w_out_REG) @[EX_MEM.scala 29:39]
    reg io_EXMEM_rs2_out_REG : SInt<32>, clock with :
      reset => (UInt<1>("h0"), io_EXMEM_rs2_out_REG) @[EX_MEM.scala 30:39]
    reg io_EXMEM_rd_out_REG : UInt<5>, clock with :
      reset => (UInt<1>("h0"), io_EXMEM_rd_out_REG) @[EX_MEM.scala 31:39]
    reg io_EXMEM_alu_out_REG : SInt<32>, clock with :
      reset => (UInt<1>("h0"), io_EXMEM_alu_out_REG) @[EX_MEM.scala 32:39]
    reg io_fun3out_REG : UInt<3>, clock with :
      reset => (UInt<1>("h0"), io_fun3out_REG) @[EX_MEM.scala 33:25]
    io_EXMEM_memRd_out <= io_EXMEM_memRd_out_REG @[EX_MEM.scala 26:29]
    io_EXMEM_memWr_out <= io_EXMEM_memWr_out_REG @[EX_MEM.scala 27:29]
    io_EXMEM_memToReg_out <= io_EXMEM_memToReg_out_REG @[EX_MEM.scala 28:29]
    io_EXMEM_reg_w_out <= io_EXMEM_reg_w_out_REG @[EX_MEM.scala 29:29]
    io_EXMEM_rs2_out <= io_EXMEM_rs2_out_REG @[EX_MEM.scala 30:29]
    io_EXMEM_rd_out <= io_EXMEM_rd_out_REG @[EX_MEM.scala 31:29]
    io_EXMEM_alu_out <= io_EXMEM_alu_out_REG @[EX_MEM.scala 32:29]
    io_fun3out <= io_fun3out_REG @[EX_MEM.scala 33:15]
    io_EXMEM_memRd_out_REG <= io_IDEX_MEMRD @[EX_MEM.scala 26:39]
    io_EXMEM_memWr_out_REG <= io_IDEX_MEMWR @[EX_MEM.scala 27:39]
    io_EXMEM_memToReg_out_REG <= io_IDEX_MEMTOREG @[EX_MEM.scala 28:39]
    io_EXMEM_reg_w_out_REG <= io_IDEX_REG_W @[EX_MEM.scala 29:39]
    io_EXMEM_rs2_out_REG <= io_IDEX_rs2 @[EX_MEM.scala 30:39]
    io_EXMEM_rd_out_REG <= io_IDEX_rd @[EX_MEM.scala 31:39]
    io_EXMEM_alu_out_REG <= io_alu_out @[EX_MEM.scala 32:39]
    io_fun3out_REG <= io_fun3in @[EX_MEM.scala 33:25]

  module MEM_WB :
    input clock : Clock
    input reset : UInt<1>
    input io_EXMEM_MEMTOREG : UInt<1>
    input io_EXMEM_REG_W : UInt<1>
    input io_EXMEM_MEMRD : UInt<1>
    input io_EXMEM_rd : UInt<5>
    input io_in_dataMem_out : SInt<32>
    input io_in_alu_out : SInt<32>
    output io_MEMWB_memToReg_out : UInt<1>
    output io_MEMWB_reg_w_out : UInt<1>
    output io_MEMWB_memRd_out : UInt<1>
    output io_MEMWB_rd_out : UInt<5>
    output io_MEMWB_dataMem_out : SInt<32>
    output io_MEMWB_alu_out : SInt<32>

    reg io_MEMWB_memToReg_out_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_MEMWB_memToReg_out_REG) @[MEM_WR.scala 22:39]
    reg io_MEMWB_reg_w_out_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_MEMWB_reg_w_out_REG) @[MEM_WR.scala 23:39]
    reg io_MEMWB_memRd_out_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), io_MEMWB_memRd_out_REG) @[MEM_WR.scala 24:39]
    reg io_MEMWB_rd_out_REG : UInt<5>, clock with :
      reset => (UInt<1>("h0"), io_MEMWB_rd_out_REG) @[MEM_WR.scala 25:39]
    reg io_MEMWB_dataMem_out_REG : SInt<32>, clock with :
      reset => (UInt<1>("h0"), io_MEMWB_dataMem_out_REG) @[MEM_WR.scala 26:39]
    reg io_MEMWB_alu_out_REG : SInt<32>, clock with :
      reset => (UInt<1>("h0"), io_MEMWB_alu_out_REG) @[MEM_WR.scala 27:39]
    io_MEMWB_memToReg_out <= io_MEMWB_memToReg_out_REG @[MEM_WR.scala 22:29]
    io_MEMWB_reg_w_out <= io_MEMWB_reg_w_out_REG @[MEM_WR.scala 23:29]
    io_MEMWB_memRd_out <= io_MEMWB_memRd_out_REG @[MEM_WR.scala 24:29]
    io_MEMWB_rd_out <= io_MEMWB_rd_out_REG @[MEM_WR.scala 25:29]
    io_MEMWB_dataMem_out <= io_MEMWB_dataMem_out_REG @[MEM_WR.scala 26:29]
    io_MEMWB_alu_out <= io_MEMWB_alu_out_REG @[MEM_WR.scala 27:29]
    io_MEMWB_memToReg_out_REG <= io_EXMEM_MEMTOREG @[MEM_WR.scala 22:39]
    io_MEMWB_reg_w_out_REG <= io_EXMEM_REG_W @[MEM_WR.scala 23:39]
    io_MEMWB_memRd_out_REG <= io_EXMEM_MEMRD @[MEM_WR.scala 24:39]
    io_MEMWB_rd_out_REG <= io_EXMEM_rd @[MEM_WR.scala 25:39]
    io_MEMWB_dataMem_out_REG <= io_in_dataMem_out @[MEM_WR.scala 26:39]
    io_MEMWB_alu_out_REG <= io_in_alu_out @[MEM_WR.scala 27:39]

  module PC :
    input clock : Clock
    input reset : UInt<1>
    input io_in : SInt<32>
    output io_out : SInt<32>

    reg PC : SInt<32>, clock with :
      reset => (UInt<1>("h0"), PC) @[Pc.scala 9:21]
    io_out <= PC @[Pc.scala 10:12]
    PC <= mux(reset, asSInt(UInt<32>("h0")), io_in) @[Pc.scala 9:21 Pc.scala 9:21 Pc.scala 11:8]

  module PC4 :
    input clock : Clock
    input reset : UInt<1>
    input io_pc : UInt<32>
    output io_out : UInt<32>

    node _io_out_T = add(io_pc, UInt<32>("h4")) @[pc4.scala 11:21]
    node _io_out_T_1 = tail(_io_out_T, 1) @[pc4.scala 11:21]
    io_out <= _io_out_T_1 @[pc4.scala 11:12]

  module InstMem :
    input clock : Clock
    input reset : UInt<1>
    input io_addr : UInt<32>
    output io_data : UInt<32>

    mem imem : @[InsMem.scala 11:17]
      data-type => UInt<32>
      depth => 1024
      read-latency => 0
      write-latency => 1
      reader => io_data_MPORT
      read-under-write => undefined
    node _io_data_T = div(io_addr, UInt<3>("h4")) @[InsMem.scala 13:26]
    node _io_data_T_1 = bits(_io_data_T, 9, 0) @[InsMem.scala 13:18]
    io_data <= imem.io_data_MPORT.data @[InsMem.scala 13:11]
    imem.io_data_MPORT.addr <= _io_data_T_1 @[InsMem.scala 13:18]
    imem.io_data_MPORT.en <= UInt<1>("h1") @[InsMem.scala 13:18]
    imem.io_data_MPORT.clk <= clock @[InsMem.scala 13:18]

  module Datamem :
    input clock : Clock
    input reset : UInt<1>
    input io_mem_write : UInt<1>
    input io_addr : UInt<32>
    input io_dataIn : SInt<32>
    output io_dataOut : SInt<32>
    input io_fun3 : UInt<3>
    input io_mem_read : UInt<1>

    mem memory_0 : @[DataMem.scala 14:19]
      data-type => SInt<8>
      depth => 1024
      read-latency => 0
      write-latency => 1
      reader => MPORT_1
      reader => MPORT_2
      writer => MPORT
      read-under-write => undefined
    mem memory_1 : @[DataMem.scala 14:19]
      data-type => SInt<8>
      depth => 1024
      read-latency => 0
      write-latency => 1
      reader => MPORT_1
      reader => MPORT_2
      writer => MPORT
      read-under-write => undefined
    mem memory_2 : @[DataMem.scala 14:19]
      data-type => SInt<8>
      depth => 1024
      read-latency => 0
      write-latency => 1
      reader => MPORT_1
      reader => MPORT_2
      writer => MPORT
      read-under-write => undefined
    mem memory_3 : @[DataMem.scala 14:19]
      data-type => SInt<8>
      depth => 1024
      read-latency => 0
      write-latency => 1
      reader => MPORT_1
      reader => MPORT_2
      writer => MPORT
      read-under-write => undefined
    node _data_0_T = bits(io_dataIn, 7, 0) @[DataMem.scala 21:23]
    node _data_0_T_1 = asSInt(_data_0_T) @[DataMem.scala 21:36]
    node _data_1_T = bits(io_dataIn, 15, 8) @[DataMem.scala 22:23]
    node _data_1_T_1 = asSInt(_data_1_T) @[DataMem.scala 22:37]
    node _data_2_T = bits(io_dataIn, 23, 16) @[DataMem.scala 23:23]
    node _data_2_T_1 = asSInt(_data_2_T) @[DataMem.scala 23:38]
    node _data_3_T = bits(io_dataIn, 31, 24) @[DataMem.scala 24:23]
    node _data_3_T_1 = asSInt(_data_3_T) @[DataMem.scala 24:38]
    node _T = eq(io_fun3, UInt<1>("h0")) @[DataMem.scala 37:18]
    node _T_1 = bits(io_addr, 1, 0) @[DataMem.scala 38:19]
    node _T_2 = eq(_T_1, UInt<1>("h0")) @[DataMem.scala 38:26]
    node _T_3 = bits(io_addr, 1, 0) @[DataMem.scala 43:25]
    node _T_4 = eq(_T_3, UInt<1>("h1")) @[DataMem.scala 43:32]
    node _data_1_T_2 = bits(io_dataIn, 7, 0) @[DataMem.scala 49:29]
    node _data_1_T_3 = asSInt(_data_1_T_2) @[DataMem.scala 49:42]
    node _T_5 = bits(io_addr, 1, 0) @[DataMem.scala 52:25]
    node _T_6 = eq(_T_5, UInt<2>("h2")) @[DataMem.scala 52:32]
    node _data_2_T_2 = bits(io_dataIn, 7, 0) @[DataMem.scala 58:29]
    node _data_2_T_3 = asSInt(_data_2_T_2) @[DataMem.scala 58:42]
    node _T_7 = bits(io_addr, 1, 0) @[DataMem.scala 61:25]
    node _T_8 = eq(_T_7, UInt<2>("h3")) @[DataMem.scala 61:32]
    node _data_3_T_2 = bits(io_dataIn, 7, 0) @[DataMem.scala 67:29]
    node _data_3_T_3 = asSInt(_data_3_T_2) @[DataMem.scala 67:42]
    node _GEN_0 = mux(_T_8, UInt<1>("h0"), UInt<1>("h0")) @[DataMem.scala 61:41 DataMem.scala 62:17 DataMem.scala 31:11]
    node _GEN_1 = mux(_T_8, UInt<1>("h1"), UInt<1>("h0")) @[DataMem.scala 61:41 DataMem.scala 65:17 DataMem.scala 34:11]
    node _GEN_2 = mux(_T_8, _data_3_T_3, _data_3_T_1) @[DataMem.scala 61:41 DataMem.scala 67:17 DataMem.scala 24:11]
    node _GEN_3 = mux(_T_6, UInt<1>("h0"), _GEN_0) @[DataMem.scala 52:41 DataMem.scala 53:17]
    node _GEN_4 = mux(_T_6, UInt<1>("h1"), _GEN_0) @[DataMem.scala 52:41 DataMem.scala 55:17]
    node _GEN_5 = mux(_T_6, UInt<1>("h0"), _GEN_1) @[DataMem.scala 52:41 DataMem.scala 56:17]
    node _GEN_6 = mux(_T_6, _data_2_T_3, _data_2_T_1) @[DataMem.scala 52:41 DataMem.scala 58:17 DataMem.scala 23:11]
    node _GEN_7 = mux(_T_6, _data_3_T_1, _GEN_2) @[DataMem.scala 52:41 DataMem.scala 24:11]
    node _GEN_8 = mux(_T_4, UInt<1>("h0"), _GEN_3) @[DataMem.scala 43:41 DataMem.scala 44:17]
    node _GEN_9 = mux(_T_4, UInt<1>("h1"), _GEN_3) @[DataMem.scala 43:41 DataMem.scala 45:17]
    node _GEN_10 = mux(_T_4, UInt<1>("h0"), _GEN_4) @[DataMem.scala 43:41 DataMem.scala 46:17]
    node _GEN_11 = mux(_T_4, UInt<1>("h0"), _GEN_5) @[DataMem.scala 43:41 DataMem.scala 47:17]
    node _GEN_12 = mux(_T_4, _data_1_T_3, _data_1_T_1) @[DataMem.scala 43:41 DataMem.scala 49:17 DataMem.scala 22:11]
    node _GEN_13 = mux(_T_4, _data_2_T_1, _GEN_6) @[DataMem.scala 43:41 DataMem.scala 23:11]
    node _GEN_14 = mux(_T_4, _data_3_T_1, _GEN_7) @[DataMem.scala 43:41 DataMem.scala 24:11]
    node _GEN_15 = mux(_T_2, UInt<1>("h1"), _GEN_8) @[DataMem.scala 38:35 DataMem.scala 39:17]
    node _GEN_16 = mux(_T_2, UInt<1>("h0"), _GEN_9) @[DataMem.scala 38:35 DataMem.scala 40:17]
    node _GEN_17 = mux(_T_2, UInt<1>("h0"), _GEN_10) @[DataMem.scala 38:35 DataMem.scala 41:17]
    node _GEN_18 = mux(_T_2, UInt<1>("h0"), _GEN_11) @[DataMem.scala 38:35 DataMem.scala 42:17]
    node _GEN_19 = mux(_T_2, _data_1_T_1, _GEN_12) @[DataMem.scala 38:35 DataMem.scala 22:11]
    node _GEN_20 = mux(_T_2, _data_2_T_1, _GEN_13) @[DataMem.scala 38:35 DataMem.scala 23:11]
    node _GEN_21 = mux(_T_2, _data_3_T_1, _GEN_14) @[DataMem.scala 38:35 DataMem.scala 24:11]
    node _T_9 = eq(io_fun3, UInt<1>("h1")) @[DataMem.scala 71:25]
    node _T_10 = bits(io_addr, 1, 0) @[DataMem.scala 72:21]
    node _T_11 = eq(_T_10, UInt<1>("h0")) @[DataMem.scala 72:28]
    node _T_12 = bits(io_addr, 1, 0) @[DataMem.scala 78:27]
    node _T_13 = eq(_T_12, UInt<1>("h1")) @[DataMem.scala 78:34]
    node _data_1_T_4 = bits(io_dataIn, 7, 0) @[DataMem.scala 84:31]
    node _data_1_T_5 = asSInt(_data_1_T_4) @[DataMem.scala 84:44]
    node _data_2_T_4 = bits(io_dataIn, 15, 8) @[DataMem.scala 85:31]
    node _data_2_T_5 = asSInt(_data_2_T_4) @[DataMem.scala 85:45]
    node _T_14 = bits(io_addr, 1, 0) @[DataMem.scala 88:27]
    node _T_15 = eq(_T_14, UInt<2>("h2")) @[DataMem.scala 88:34]
    node _data_2_T_6 = bits(io_dataIn, 7, 0) @[DataMem.scala 94:31]
    node _data_2_T_7 = asSInt(_data_2_T_6) @[DataMem.scala 94:44]
    node _data_3_T_4 = bits(io_dataIn, 15, 8) @[DataMem.scala 95:31]
    node _data_3_T_5 = asSInt(_data_3_T_4) @[DataMem.scala 95:45]
    node _T_16 = bits(io_addr, 1, 0) @[DataMem.scala 98:27]
    node _T_17 = eq(_T_16, UInt<2>("h3")) @[DataMem.scala 98:34]
    node _data_3_T_6 = bits(io_dataIn, 7, 0) @[DataMem.scala 104:31]
    node _data_3_T_7 = asSInt(_data_3_T_6) @[DataMem.scala 104:44]
    node _GEN_22 = mux(_T_17, UInt<1>("h0"), UInt<1>("h0")) @[DataMem.scala 98:43 DataMem.scala 99:19 DataMem.scala 31:11]
    node _GEN_23 = mux(_T_17, UInt<1>("h1"), UInt<1>("h0")) @[DataMem.scala 98:43 DataMem.scala 102:19 DataMem.scala 34:11]
    node _GEN_24 = mux(_T_17, _data_3_T_7, _data_3_T_1) @[DataMem.scala 98:43 DataMem.scala 104:19 DataMem.scala 24:11]
    node _GEN_25 = mux(_T_15, UInt<1>("h0"), _GEN_22) @[DataMem.scala 88:43 DataMem.scala 89:19]
    node _GEN_26 = mux(_T_15, UInt<1>("h1"), _GEN_22) @[DataMem.scala 88:43 DataMem.scala 91:19]
    node _GEN_27 = mux(_T_15, UInt<1>("h1"), _GEN_23) @[DataMem.scala 88:43 DataMem.scala 92:19]
    node _GEN_28 = mux(_T_15, _data_2_T_7, _data_2_T_1) @[DataMem.scala 88:43 DataMem.scala 94:19 DataMem.scala 23:11]
    node _GEN_29 = mux(_T_15, _data_3_T_5, _GEN_24) @[DataMem.scala 88:43 DataMem.scala 95:19]
    node _GEN_30 = mux(_T_13, UInt<1>("h0"), _GEN_25) @[DataMem.scala 78:43 DataMem.scala 79:19]
    node _GEN_31 = mux(_T_13, UInt<1>("h1"), _GEN_25) @[DataMem.scala 78:43 DataMem.scala 80:19]
    node _GEN_32 = mux(_T_13, UInt<1>("h1"), _GEN_26) @[DataMem.scala 78:43 DataMem.scala 81:19]
    node _GEN_33 = mux(_T_13, UInt<1>("h0"), _GEN_27) @[DataMem.scala 78:43 DataMem.scala 82:19]
    node _GEN_34 = mux(_T_13, _data_1_T_5, _data_1_T_1) @[DataMem.scala 78:43 DataMem.scala 84:19 DataMem.scala 22:11]
    node _GEN_35 = mux(_T_13, _data_2_T_5, _GEN_28) @[DataMem.scala 78:43 DataMem.scala 85:19]
    node _GEN_36 = mux(_T_13, _data_3_T_1, _GEN_29) @[DataMem.scala 78:43 DataMem.scala 24:11]
    node _GEN_37 = mux(_T_11, UInt<1>("h1"), _GEN_30) @[DataMem.scala 72:37 DataMem.scala 73:19]
    node _GEN_38 = mux(_T_11, UInt<1>("h1"), _GEN_31) @[DataMem.scala 72:37 DataMem.scala 74:19]
    node _GEN_39 = mux(_T_11, UInt<1>("h0"), _GEN_32) @[DataMem.scala 72:37 DataMem.scala 75:19]
    node _GEN_40 = mux(_T_11, UInt<1>("h0"), _GEN_33) @[DataMem.scala 72:37 DataMem.scala 76:19]
    node _GEN_41 = mux(_T_11, _data_1_T_1, _GEN_34) @[DataMem.scala 72:37 DataMem.scala 22:11]
    node _GEN_42 = mux(_T_11, _data_2_T_1, _GEN_35) @[DataMem.scala 72:37 DataMem.scala 23:11]
    node _GEN_43 = mux(_T_11, _data_3_T_1, _GEN_36) @[DataMem.scala 72:37 DataMem.scala 24:11]
    node _T_18 = eq(io_fun3, UInt<2>("h2")) @[DataMem.scala 108:25]
    node _GEN_44 = mux(_T_18, UInt<1>("h1"), UInt<1>("h0")) @[DataMem.scala 108:34 DataMem.scala 109:17 DataMem.scala 31:11]
    node _GEN_45 = mux(_T_9, _GEN_37, _GEN_44) @[DataMem.scala 71:34]
    node _GEN_46 = mux(_T_9, _GEN_38, _GEN_44) @[DataMem.scala 71:34]
    node _GEN_47 = mux(_T_9, _GEN_39, _GEN_44) @[DataMem.scala 71:34]
    node _GEN_48 = mux(_T_9, _GEN_40, _GEN_44) @[DataMem.scala 71:34]
    node _GEN_49 = mux(_T_9, _GEN_41, _data_1_T_1) @[DataMem.scala 71:34 DataMem.scala 22:11]
    node _GEN_50 = mux(_T_9, _GEN_42, _data_2_T_1) @[DataMem.scala 71:34 DataMem.scala 23:11]
    node _GEN_51 = mux(_T_9, _GEN_43, _data_3_T_1) @[DataMem.scala 71:34 DataMem.scala 24:11]
    node _GEN_52 = mux(_T, _GEN_15, _GEN_45) @[DataMem.scala 37:27]
    node _GEN_53 = mux(_T, _GEN_16, _GEN_46) @[DataMem.scala 37:27]
    node _GEN_54 = mux(_T, _GEN_17, _GEN_47) @[DataMem.scala 37:27]
    node _GEN_55 = mux(_T, _GEN_18, _GEN_48) @[DataMem.scala 37:27]
    node _GEN_56 = mux(_T, _GEN_19, _GEN_49) @[DataMem.scala 37:27]
    node _GEN_57 = mux(_T, _GEN_20, _GEN_50) @[DataMem.scala 37:27]
    node _GEN_58 = mux(_T, _GEN_21, _GEN_51) @[DataMem.scala 37:27]
    node _T_19 = bits(io_addr, 31, 2) @[DataMem.scala 119:25]
    node _T_20 = bits(_T_19, 9, 0)
    node _GEN_67 = mux(io_mem_write, UInt<1>("h1"), UInt<1>("h0")) @[DataMem.scala 36:22 DataMem.scala 115:15 DataMem.scala 31:11]
    node mask_0 = _GEN_67 @[DataMem.scala 15:18]
    node data_0 = _data_0_T_1 @[DataMem.scala 16:18 DataMem.scala 21:11]
    node _GEN_59 = validif(mask_0, data_0)
    node _GEN_60 = mux(mask_0, UInt<1>("h1"), UInt<1>("h0"))
    node _GEN_68 = mux(io_mem_write, UInt<1>("h0"), UInt<1>("h0")) @[DataMem.scala 36:22 DataMem.scala 116:15 DataMem.scala 32:11]
    node mask_1 = _GEN_68 @[DataMem.scala 15:18]
    node _GEN_69 = mux(io_mem_write, _GEN_56, _data_1_T_1) @[DataMem.scala 36:22 DataMem.scala 22:11]
    node data_1 = _GEN_69 @[DataMem.scala 16:18]
    node _GEN_61 = validif(mask_1, data_1)
    node _GEN_62 = mux(mask_1, UInt<1>("h1"), UInt<1>("h0"))
    node mask_2 = _GEN_68 @[DataMem.scala 15:18]
    node _GEN_70 = mux(io_mem_write, _GEN_57, _data_2_T_1) @[DataMem.scala 36:22 DataMem.scala 23:11]
    node data_2 = _GEN_70 @[DataMem.scala 16:18]
    node _GEN_63 = validif(mask_2, data_2)
    node _GEN_64 = mux(mask_2, UInt<1>("h1"), UInt<1>("h0"))
    node mask_3 = _GEN_68 @[DataMem.scala 15:18]
    node _GEN_71 = mux(io_mem_write, _GEN_58, _data_3_T_1) @[DataMem.scala 36:22 DataMem.scala 24:11]
    node data_3 = _GEN_71 @[DataMem.scala 16:18]
    node _GEN_65 = validif(mask_3, data_3)
    node _GEN_66 = mux(mask_3, UInt<1>("h1"), UInt<1>("h0"))
    node _GEN_72 = validif(io_mem_write, _T_20) @[DataMem.scala 36:22]
    node _GEN_73 = validif(io_mem_write, clock) @[DataMem.scala 36:22]
    node _GEN_74 = validif(io_mem_write, _GEN_60) @[DataMem.scala 36:22]
    node _GEN_75 = validif(io_mem_write, _GEN_62) @[DataMem.scala 36:22]
    node _GEN_76 = validif(io_mem_write, _GEN_64) @[DataMem.scala 36:22]
    node _GEN_77 = validif(io_mem_write, _GEN_66) @[DataMem.scala 36:22]
    node _GEN_78 = validif(io_mem_write, _GEN_59) @[DataMem.scala 36:22]
    node _GEN_79 = validif(io_mem_write, _GEN_61) @[DataMem.scala 36:22]
    node _GEN_80 = validif(io_mem_write, _GEN_63) @[DataMem.scala 36:22]
    node _GEN_81 = validif(io_mem_write, _GEN_65) @[DataMem.scala 36:22]
    node _T_21 = bits(io_addr, 31, 2) @[DataMem.scala 124:34]
    node _T_22 = bits(_T_21, 9, 0) @[DataMem.scala 124:26]
    node _T_23 = bits(io_addr, 31, 2) @[DataMem.scala 126:34]
    node _T_24 = bits(_T_23, 9, 0) @[DataMem.scala 126:26]
    node _T_25 = eq(io_fun3, UInt<1>("h0")) @[DataMem.scala 127:16]
    node _T_26 = bits(io_addr, 1, 0) @[DataMem.scala 128:17]
    node _T_27 = eq(_T_26, UInt<1>("h0")) @[DataMem.scala 128:23]
    node _GEN_96 = mux(io_mem_read, memory_0.MPORT_2.data, memory_0.MPORT_1.data) @[DataMem.scala 125:20 DataMem.scala 126:12 DataMem.scala 124:12]
    node tempread_0 = _GEN_96 @[DataMem.scala 17:22]
    node _io_dataOut_T = bits(tempread_0, 7, 7) @[DataMem.scala 129:42]
    node _io_dataOut_T_1 = bits(_io_dataOut_T, 0, 0) @[Bitwise.scala 72:15]
    node io_dataOut_hi = mux(_io_dataOut_T_1, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 72:12]
    node io_dataOut_lo = asUInt(tempread_0) @[Cat.scala 30:58]
    node _io_dataOut_T_2 = cat(io_dataOut_hi, io_dataOut_lo) @[Cat.scala 30:58]
    node _io_dataOut_T_3 = asSInt(_io_dataOut_T_2) @[DataMem.scala 129:66]
    node _T_28 = bits(io_addr, 1, 0) @[DataMem.scala 130:22]
    node _T_29 = eq(_T_28, UInt<1>("h1")) @[DataMem.scala 130:27]
    node _GEN_97 = mux(io_mem_read, memory_1.MPORT_2.data, memory_1.MPORT_1.data) @[DataMem.scala 125:20 DataMem.scala 126:12 DataMem.scala 124:12]
    node tempread_1 = _GEN_97 @[DataMem.scala 17:22]
    node _io_dataOut_T_4 = bits(tempread_1, 7, 7) @[DataMem.scala 131:42]
    node _io_dataOut_T_5 = bits(_io_dataOut_T_4, 0, 0) @[Bitwise.scala 72:15]
    node io_dataOut_hi_1 = mux(_io_dataOut_T_5, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 72:12]
    node io_dataOut_lo_1 = asUInt(tempread_1) @[Cat.scala 30:58]
    node _io_dataOut_T_6 = cat(io_dataOut_hi_1, io_dataOut_lo_1) @[Cat.scala 30:58]
    node _io_dataOut_T_7 = asSInt(_io_dataOut_T_6) @[DataMem.scala 131:66]
    node _T_30 = bits(io_addr, 1, 0) @[DataMem.scala 132:22]
    node _T_31 = eq(_T_30, UInt<2>("h2")) @[DataMem.scala 132:27]
    node _GEN_98 = mux(io_mem_read, memory_2.MPORT_2.data, memory_2.MPORT_1.data) @[DataMem.scala 125:20 DataMem.scala 126:12 DataMem.scala 124:12]
    node tempread_2 = _GEN_98 @[DataMem.scala 17:22]
    node _io_dataOut_T_8 = bits(tempread_2, 7, 7) @[DataMem.scala 133:42]
    node _io_dataOut_T_9 = bits(_io_dataOut_T_8, 0, 0) @[Bitwise.scala 72:15]
    node io_dataOut_hi_2 = mux(_io_dataOut_T_9, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 72:12]
    node io_dataOut_lo_2 = asUInt(tempread_2) @[Cat.scala 30:58]
    node _io_dataOut_T_10 = cat(io_dataOut_hi_2, io_dataOut_lo_2) @[Cat.scala 30:58]
    node _io_dataOut_T_11 = asSInt(_io_dataOut_T_10) @[DataMem.scala 133:66]
    node _T_32 = bits(io_addr, 1, 0) @[DataMem.scala 134:22]
    node _T_33 = eq(_T_32, UInt<2>("h3")) @[DataMem.scala 134:27]
    node _GEN_99 = mux(io_mem_read, memory_3.MPORT_2.data, memory_3.MPORT_1.data) @[DataMem.scala 125:20 DataMem.scala 126:12 DataMem.scala 124:12]
    node tempread_3 = _GEN_99 @[DataMem.scala 17:22]
    node _io_dataOut_T_12 = bits(tempread_3, 7, 7) @[DataMem.scala 135:42]
    node _io_dataOut_T_13 = bits(_io_dataOut_T_12, 0, 0) @[Bitwise.scala 72:15]
    node io_dataOut_hi_3 = mux(_io_dataOut_T_13, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 72:12]
    node io_dataOut_lo_3 = asUInt(tempread_3) @[Cat.scala 30:58]
    node _io_dataOut_T_14 = cat(io_dataOut_hi_3, io_dataOut_lo_3) @[Cat.scala 30:58]
    node _io_dataOut_T_15 = asSInt(_io_dataOut_T_14) @[DataMem.scala 135:66]
    node _GEN_82 = mux(_T_33, _io_dataOut_T_15, asSInt(UInt<1>("h0"))) @[DataMem.scala 134:35 DataMem.scala 135:16 DataMem.scala 19:14]
    node _GEN_83 = mux(_T_31, _io_dataOut_T_11, _GEN_82) @[DataMem.scala 132:35 DataMem.scala 133:16]
    node _GEN_84 = mux(_T_29, _io_dataOut_T_7, _GEN_83) @[DataMem.scala 130:35 DataMem.scala 131:16]
    node _GEN_85 = mux(_T_27, _io_dataOut_T_3, _GEN_84) @[DataMem.scala 128:31 DataMem.scala 129:16]
    node _T_34 = eq(io_fun3, UInt<1>("h1")) @[DataMem.scala 137:22]
    node _T_35 = bits(io_addr, 1, 0) @[DataMem.scala 138:17]
    node _T_36 = eq(_T_35, UInt<1>("h0")) @[DataMem.scala 138:23]
    node _io_dataOut_T_16 = bits(tempread_0, 7, 7) @[DataMem.scala 139:42]
    node _io_dataOut_T_17 = bits(_io_dataOut_T_16, 0, 0) @[Bitwise.scala 72:15]
    node io_dataOut_hi_hi = mux(_io_dataOut_T_17, UInt<16>("hffff"), UInt<16>("h0")) @[Bitwise.scala 72:12]
    node io_dataOut_lo_4 = asUInt(tempread_1) @[Cat.scala 30:58]
    node io_dataOut_hi_lo = asUInt(tempread_0) @[Cat.scala 30:58]
    node io_dataOut_hi_4 = cat(io_dataOut_hi_hi, io_dataOut_hi_lo) @[Cat.scala 30:58]
    node _io_dataOut_T_18 = cat(io_dataOut_hi_4, io_dataOut_lo_4) @[Cat.scala 30:58]
    node _io_dataOut_T_19 = asSInt(_io_dataOut_T_18) @[DataMem.scala 139:78]
    node _T_37 = bits(io_addr, 1, 0) @[DataMem.scala 140:22]
    node _T_38 = eq(_T_37, UInt<1>("h1")) @[DataMem.scala 140:27]
    node _io_dataOut_T_20 = bits(tempread_1, 7, 7) @[DataMem.scala 141:42]
    node _io_dataOut_T_21 = bits(_io_dataOut_T_20, 0, 0) @[Bitwise.scala 72:15]
    node io_dataOut_hi_hi_1 = mux(_io_dataOut_T_21, UInt<16>("hffff"), UInt<16>("h0")) @[Bitwise.scala 72:12]
    node io_dataOut_lo_5 = asUInt(tempread_2) @[Cat.scala 30:58]
    node io_dataOut_hi_lo_1 = asUInt(tempread_1) @[Cat.scala 30:58]
    node io_dataOut_hi_5 = cat(io_dataOut_hi_hi_1, io_dataOut_hi_lo_1) @[Cat.scala 30:58]
    node _io_dataOut_T_22 = cat(io_dataOut_hi_5, io_dataOut_lo_5) @[Cat.scala 30:58]
    node _io_dataOut_T_23 = asSInt(_io_dataOut_T_22) @[DataMem.scala 141:78]
    node _T_39 = bits(io_addr, 1, 0) @[DataMem.scala 142:22]
    node _T_40 = eq(_T_39, UInt<2>("h2")) @[DataMem.scala 142:27]
    node _io_dataOut_T_24 = bits(tempread_2, 7, 7) @[DataMem.scala 143:42]
    node _io_dataOut_T_25 = bits(_io_dataOut_T_24, 0, 0) @[Bitwise.scala 72:15]
    node io_dataOut_hi_hi_2 = mux(_io_dataOut_T_25, UInt<16>("hffff"), UInt<16>("h0")) @[Bitwise.scala 72:12]
    node io_dataOut_lo_6 = asUInt(tempread_3) @[Cat.scala 30:58]
    node io_dataOut_hi_lo_2 = asUInt(tempread_2) @[Cat.scala 30:58]
    node io_dataOut_hi_6 = cat(io_dataOut_hi_hi_2, io_dataOut_hi_lo_2) @[Cat.scala 30:58]
    node _io_dataOut_T_26 = cat(io_dataOut_hi_6, io_dataOut_lo_6) @[Cat.scala 30:58]
    node _io_dataOut_T_27 = asSInt(_io_dataOut_T_26) @[DataMem.scala 143:78]
    node _T_41 = bits(io_addr, 1, 0) @[DataMem.scala 144:22]
    node _T_42 = eq(_T_41, UInt<2>("h3")) @[DataMem.scala 144:27]
    node _io_dataOut_T_28 = bits(tempread_3, 7, 7) @[DataMem.scala 145:42]
    node _io_dataOut_T_29 = bits(_io_dataOut_T_28, 0, 0) @[Bitwise.scala 72:15]
    node io_dataOut_hi_7 = mux(_io_dataOut_T_29, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 72:12]
    node io_dataOut_lo_7 = asUInt(tempread_3) @[Cat.scala 30:58]
    node _io_dataOut_T_30 = cat(io_dataOut_hi_7, io_dataOut_lo_7) @[Cat.scala 30:58]
    node _io_dataOut_T_31 = asSInt(_io_dataOut_T_30) @[DataMem.scala 145:66]
    node _GEN_86 = mux(_T_42, _io_dataOut_T_31, asSInt(UInt<1>("h0"))) @[DataMem.scala 144:35 DataMem.scala 145:16 DataMem.scala 19:14]
    node _GEN_87 = mux(_T_40, _io_dataOut_T_27, _GEN_86) @[DataMem.scala 142:35 DataMem.scala 143:16]
    node _GEN_88 = mux(_T_38, _io_dataOut_T_23, _GEN_87) @[DataMem.scala 140:35 DataMem.scala 141:16]
    node _GEN_89 = mux(_T_36, _io_dataOut_T_19, _GEN_88) @[DataMem.scala 138:31 DataMem.scala 139:16]
    node _T_43 = eq(io_fun3, UInt<2>("h2")) @[DataMem.scala 147:22]
    node io_dataOut_lo_lo = asUInt(tempread_0) @[Cat.scala 30:58]
    node io_dataOut_lo_hi = asUInt(tempread_1) @[Cat.scala 30:58]
    node io_dataOut_lo_8 = cat(io_dataOut_lo_hi, io_dataOut_lo_lo) @[Cat.scala 30:58]
    node io_dataOut_hi_lo_3 = asUInt(tempread_2) @[Cat.scala 30:58]
    node io_dataOut_hi_hi_3 = asUInt(tempread_3) @[Cat.scala 30:58]
    node io_dataOut_hi_8 = cat(io_dataOut_hi_hi_3, io_dataOut_hi_lo_3) @[Cat.scala 30:58]
    node _io_dataOut_T_32 = cat(io_dataOut_hi_8, io_dataOut_lo_8) @[Cat.scala 30:58]
    node _io_dataOut_T_33 = asSInt(_io_dataOut_T_32) @[DataMem.scala 148:81]
    node _GEN_90 = mux(_T_43, _io_dataOut_T_33, asSInt(UInt<1>("h0"))) @[DataMem.scala 147:31 DataMem.scala 148:16 DataMem.scala 19:14]
    node _GEN_91 = mux(_T_34, _GEN_89, _GEN_90) @[DataMem.scala 137:31]
    node _GEN_92 = mux(_T_25, _GEN_85, _GEN_91) @[DataMem.scala 127:25]
    node _GEN_93 = validif(io_mem_read, _T_24) @[DataMem.scala 125:20 DataMem.scala 126:26]
    node _GEN_94 = validif(io_mem_read, clock) @[DataMem.scala 125:20 DataMem.scala 126:26]
    node _GEN_95 = mux(io_mem_read, UInt<1>("h1"), UInt<1>("h0")) @[DataMem.scala 125:20 DataMem.scala 126:26 DataMem.scala 14:19]
    node _GEN_100 = mux(io_mem_read, _GEN_92, asSInt(UInt<1>("h0"))) @[DataMem.scala 125:20 DataMem.scala 19:14]
    io_dataOut <= _GEN_100
    memory_0.MPORT_1.addr <= _T_22 @[DataMem.scala 124:26]
    memory_1.MPORT_1.addr <= _T_22 @[DataMem.scala 124:26]
    memory_2.MPORT_1.addr <= _T_22 @[DataMem.scala 124:26]
    memory_3.MPORT_1.addr <= _T_22 @[DataMem.scala 124:26]
    memory_0.MPORT_1.en <= UInt<1>("h1") @[DataMem.scala 124:26]
    memory_1.MPORT_1.en <= UInt<1>("h1") @[DataMem.scala 124:26]
    memory_2.MPORT_1.en <= UInt<1>("h1") @[DataMem.scala 124:26]
    memory_3.MPORT_1.en <= UInt<1>("h1") @[DataMem.scala 124:26]
    memory_0.MPORT_1.clk <= clock @[DataMem.scala 124:26]
    memory_1.MPORT_1.clk <= clock @[DataMem.scala 124:26]
    memory_2.MPORT_1.clk <= clock @[DataMem.scala 124:26]
    memory_3.MPORT_1.clk <= clock @[DataMem.scala 124:26]
    memory_0.MPORT_2.addr <= _GEN_93
    memory_1.MPORT_2.addr <= _GEN_93
    memory_2.MPORT_2.addr <= _GEN_93
    memory_3.MPORT_2.addr <= _GEN_93
    memory_0.MPORT_2.en <= _GEN_95
    memory_1.MPORT_2.en <= _GEN_95
    memory_2.MPORT_2.en <= _GEN_95
    memory_3.MPORT_2.en <= _GEN_95
    memory_0.MPORT_2.clk <= _GEN_94
    memory_1.MPORT_2.clk <= _GEN_94
    memory_2.MPORT_2.clk <= _GEN_94
    memory_3.MPORT_2.clk <= _GEN_94
    memory_0.MPORT.addr <= _GEN_72
    memory_1.MPORT.addr <= _GEN_72
    memory_2.MPORT.addr <= _GEN_72
    memory_3.MPORT.addr <= _GEN_72
    memory_0.MPORT.en <= _GEN_67
    memory_1.MPORT.en <= _GEN_67
    memory_2.MPORT.en <= _GEN_67
    memory_3.MPORT.en <= _GEN_67
    memory_0.MPORT.clk <= _GEN_73
    memory_1.MPORT.clk <= _GEN_73
    memory_2.MPORT.clk <= _GEN_73
    memory_3.MPORT.clk <= _GEN_73
    memory_0.MPORT.data <= _GEN_78
    memory_1.MPORT.data <= _GEN_79
    memory_2.MPORT.data <= _GEN_80
    memory_3.MPORT.data <= _GEN_81
    memory_0.MPORT.mask <= _GEN_74
    memory_1.MPORT.mask <= _GEN_75
    memory_2.MPORT.mask <= _GEN_76
    memory_3.MPORT.mask <= _GEN_77

  module Control :
    input clock : Clock
    input reset : UInt<1>
    input io_opcode : UInt<7>
    output io_mem_write : UInt<1>
    output io_branch : UInt<1>
    output io_mem_read : UInt<1>
    output io_reg_write : UInt<1>
    output io_men_to_reg : UInt<1>
    output io_alu_operation : UInt<3>
    output io_operand_A : UInt<2>
    output io_operand_B : UInt<1>
    output io_extend : UInt<2>
    output io_next_pc_sel : UInt<2>

    node _T = eq(UInt<6>("h33"), io_opcode) @[Conditional.scala 37:30]
    node _T_1 = eq(UInt<5>("h13"), io_opcode) @[Conditional.scala 37:30]
    node _T_2 = eq(UInt<6>("h23"), io_opcode) @[Conditional.scala 37:30]
    node _T_3 = eq(UInt<2>("h3"), io_opcode) @[Conditional.scala 37:30]
    node _T_4 = eq(UInt<7>("h63"), io_opcode) @[Conditional.scala 37:30]
    node _T_5 = eq(UInt<7>("h6f"), io_opcode) @[Conditional.scala 37:30]
    node _T_6 = eq(UInt<7>("h67"), io_opcode) @[Conditional.scala 37:30]
    node _T_7 = eq(UInt<6>("h37"), io_opcode) @[Conditional.scala 37:30]
    node _T_8 = eq(UInt<5>("h17"), io_opcode) @[Conditional.scala 37:30]
    node _GEN_0 = mux(_T_8, UInt<1>("h0"), UInt<1>("h0")) @[Conditional.scala 39:67 control.scala 146:20 control.scala 20:16]
    node _GEN_1 = mux(_T_8, UInt<1>("h1"), UInt<1>("h0")) @[Conditional.scala 39:67 control.scala 149:20 control.scala 23:16]
    node _GEN_2 = mux(_T_8, UInt<3>("h7"), UInt<1>("h0")) @[Conditional.scala 39:67 control.scala 151:24 control.scala 25:20]
    node _GEN_3 = mux(_T_8, UInt<2>("h2"), UInt<1>("h0")) @[Conditional.scala 39:67 control.scala 152:20 control.scala 26:16]
    node _GEN_4 = mux(_T_7, UInt<1>("h0"), _GEN_0) @[Conditional.scala 39:67 control.scala 132:20]
    node _GEN_5 = mux(_T_7, UInt<1>("h1"), _GEN_1) @[Conditional.scala 39:67 control.scala 135:20]
    node _GEN_6 = mux(_T_7, UInt<3>("h6"), _GEN_2) @[Conditional.scala 39:67 control.scala 137:24]
    node _GEN_7 = mux(_T_7, UInt<2>("h3"), _GEN_3) @[Conditional.scala 39:67 control.scala 138:20]
    node _GEN_8 = mux(_T_7, UInt<2>("h2"), _GEN_3) @[Conditional.scala 39:67 control.scala 140:17]
    node _GEN_9 = mux(_T_6, UInt<1>("h0"), _GEN_4) @[Conditional.scala 39:67 control.scala 118:20]
    node _GEN_10 = mux(_T_6, UInt<1>("h1"), _GEN_5) @[Conditional.scala 39:67 control.scala 121:20]
    node _GEN_11 = mux(_T_6, UInt<2>("h3"), _GEN_6) @[Conditional.scala 39:67 control.scala 123:24]
    node _GEN_12 = mux(_T_6, UInt<1>("h1"), _GEN_7) @[Conditional.scala 39:67 control.scala 124:20]
    node _GEN_13 = mux(_T_6, UInt<1>("h0"), _GEN_5) @[Conditional.scala 39:67 control.scala 125:20]
    node _GEN_14 = mux(_T_6, UInt<1>("h0"), _GEN_8) @[Conditional.scala 39:67 control.scala 126:17]
    node _GEN_15 = mux(_T_6, UInt<2>("h3"), _GEN_4) @[Conditional.scala 39:67 control.scala 127:22]
    node _GEN_16 = mux(_T_5, UInt<1>("h0"), _GEN_9) @[Conditional.scala 39:67 control.scala 104:20]
    node _GEN_17 = mux(_T_5, UInt<1>("h1"), _GEN_10) @[Conditional.scala 39:67 control.scala 107:20]
    node _GEN_18 = mux(_T_5, UInt<2>("h3"), _GEN_11) @[Conditional.scala 39:67 control.scala 109:24]
    node _GEN_19 = mux(_T_5, UInt<1>("h1"), _GEN_12) @[Conditional.scala 39:67 control.scala 110:20]
    node _GEN_20 = mux(_T_5, UInt<1>("h0"), _GEN_13) @[Conditional.scala 39:67 control.scala 111:20]
    node _GEN_21 = mux(_T_5, UInt<1>("h0"), _GEN_14) @[Conditional.scala 39:67 control.scala 112:17]
    node _GEN_22 = mux(_T_5, UInt<2>("h2"), _GEN_15) @[Conditional.scala 39:67 control.scala 113:22]
    node _GEN_23 = mux(_T_4, UInt<1>("h0"), _GEN_16) @[Conditional.scala 39:67 control.scala 90:20]
    node _GEN_24 = mux(_T_4, UInt<1>("h1"), _GEN_16) @[Conditional.scala 39:67 control.scala 91:17]
    node _GEN_25 = mux(_T_4, UInt<1>("h0"), _GEN_17) @[Conditional.scala 39:67 control.scala 93:20]
    node _GEN_26 = mux(_T_4, UInt<2>("h2"), _GEN_18) @[Conditional.scala 39:67 control.scala 95:24]
    node _GEN_27 = mux(_T_4, UInt<1>("h0"), _GEN_19) @[Conditional.scala 39:67 control.scala 96:20]
    node _GEN_28 = mux(_T_4, UInt<1>("h0"), _GEN_20) @[Conditional.scala 39:67 control.scala 97:20]
    node _GEN_29 = mux(_T_4, UInt<1>("h0"), _GEN_21) @[Conditional.scala 39:67 control.scala 98:17]
    node _GEN_30 = mux(_T_4, UInt<1>("h1"), _GEN_22) @[Conditional.scala 39:67 control.scala 99:22]
    node _GEN_31 = mux(_T_3, UInt<1>("h0"), _GEN_23) @[Conditional.scala 39:67 control.scala 76:20]
    node _GEN_32 = mux(_T_3, UInt<1>("h0"), _GEN_24) @[Conditional.scala 39:67 control.scala 77:17]
    node _GEN_33 = mux(_T_3, UInt<1>("h1"), _GEN_23) @[Conditional.scala 39:67 control.scala 78:19]
    node _GEN_34 = mux(_T_3, UInt<1>("h1"), _GEN_25) @[Conditional.scala 39:67 control.scala 79:20]
    node _GEN_35 = mux(_T_3, UInt<3>("h4"), _GEN_26) @[Conditional.scala 39:67 control.scala 81:24]
    node _GEN_36 = mux(_T_3, UInt<1>("h0"), _GEN_27) @[Conditional.scala 39:67 control.scala 82:20]
    node _GEN_37 = mux(_T_3, UInt<1>("h1"), _GEN_28) @[Conditional.scala 39:67 control.scala 83:20]
    node _GEN_38 = mux(_T_3, UInt<1>("h0"), _GEN_29) @[Conditional.scala 39:67 control.scala 84:17]
    node _GEN_39 = mux(_T_3, UInt<1>("h0"), _GEN_30) @[Conditional.scala 39:67 control.scala 85:22]
    node _GEN_40 = mux(_T_2, UInt<1>("h1"), _GEN_31) @[Conditional.scala 39:67 control.scala 62:20]
    node _GEN_41 = mux(_T_2, UInt<1>("h0"), _GEN_32) @[Conditional.scala 39:67 control.scala 63:17]
    node _GEN_42 = mux(_T_2, UInt<1>("h0"), _GEN_33) @[Conditional.scala 39:67 control.scala 64:19]
    node _GEN_43 = mux(_T_2, UInt<1>("h0"), _GEN_34) @[Conditional.scala 39:67 control.scala 65:20]
    node _GEN_44 = mux(_T_2, UInt<3>("h5"), _GEN_35) @[Conditional.scala 39:67 control.scala 67:24]
    node _GEN_45 = mux(_T_2, UInt<1>("h0"), _GEN_36) @[Conditional.scala 39:67 control.scala 68:20]
    node _GEN_46 = mux(_T_2, UInt<1>("h1"), _GEN_37) @[Conditional.scala 39:67 control.scala 69:20]
    node _GEN_47 = mux(_T_2, UInt<1>("h1"), _GEN_38) @[Conditional.scala 39:67 control.scala 70:17]
    node _GEN_48 = mux(_T_2, UInt<1>("h0"), _GEN_39) @[Conditional.scala 39:67 control.scala 71:22]
    node _GEN_49 = mux(_T_1, UInt<1>("h0"), _GEN_40) @[Conditional.scala 39:67 control.scala 48:20]
    node _GEN_50 = mux(_T_1, UInt<1>("h0"), _GEN_41) @[Conditional.scala 39:67 control.scala 49:17]
    node _GEN_51 = mux(_T_1, UInt<1>("h0"), _GEN_42) @[Conditional.scala 39:67 control.scala 50:19]
    node _GEN_52 = mux(_T_1, UInt<1>("h1"), _GEN_43) @[Conditional.scala 39:67 control.scala 51:20]
    node _GEN_53 = mux(_T_1, UInt<1>("h1"), _GEN_44) @[Conditional.scala 39:67 control.scala 53:24]
    node _GEN_54 = mux(_T_1, UInt<1>("h0"), _GEN_45) @[Conditional.scala 39:67 control.scala 54:20]
    node _GEN_55 = mux(_T_1, UInt<1>("h1"), _GEN_46) @[Conditional.scala 39:67 control.scala 55:20]
    node _GEN_56 = mux(_T_1, UInt<1>("h0"), _GEN_47) @[Conditional.scala 39:67 control.scala 56:17]
    node _GEN_57 = mux(_T_1, UInt<1>("h0"), _GEN_48) @[Conditional.scala 39:67 control.scala 57:22]
    node _GEN_58 = mux(_T, UInt<1>("h0"), _GEN_49) @[Conditional.scala 40:58 control.scala 34:20]
    node _GEN_59 = mux(_T, UInt<1>("h0"), _GEN_50) @[Conditional.scala 40:58 control.scala 35:17]
    node _GEN_60 = mux(_T, UInt<1>("h0"), _GEN_51) @[Conditional.scala 40:58 control.scala 36:19]
    node _GEN_61 = mux(_T, UInt<1>("h1"), _GEN_52) @[Conditional.scala 40:58 control.scala 37:20]
    node _GEN_62 = mux(_T, UInt<1>("h0"), _GEN_53) @[Conditional.scala 40:58 control.scala 39:24]
    node _GEN_63 = mux(_T, UInt<1>("h0"), _GEN_54) @[Conditional.scala 40:58 control.scala 40:20]
    node _GEN_64 = mux(_T, UInt<1>("h0"), _GEN_55) @[Conditional.scala 40:58 control.scala 41:20]
    node _GEN_65 = mux(_T, UInt<1>("h0"), _GEN_56) @[Conditional.scala 40:58 control.scala 42:17]
    node _GEN_66 = mux(_T, UInt<1>("h0"), _GEN_57) @[Conditional.scala 40:58 control.scala 43:22]
    io_mem_write <= _GEN_58
    io_branch <= _GEN_59
    io_mem_read <= _GEN_60
    io_reg_write <= _GEN_61
    io_men_to_reg <= _GEN_60
    io_alu_operation <= _GEN_62
    io_operand_A <= _GEN_63
    io_operand_B <= _GEN_64
    io_extend <= _GEN_65
    io_next_pc_sel <= _GEN_66

  module ImmGenerator :
    input clock : Clock
    input reset : UInt<1>
    input io_instr : UInt<32>
    input io_pc : UInt<32>
    output io_I_type : SInt<32>
    output io_S_type : SInt<32>
    output io_SB_type : SInt<32>
    output io_U_type : SInt<32>
    output io_UJ_type : SInt<32>

    node _io_I_type_T = bits(io_instr, 31, 31) @[IMM.scala 17:37]
    node _io_I_type_T_1 = bits(_io_I_type_T, 0, 0) @[Bitwise.scala 72:15]
    node io_I_type_hi = mux(_io_I_type_T_1, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node io_I_type_lo = bits(io_instr, 31, 20) @[IMM.scala 17:52]
    node _io_I_type_T_2 = cat(io_I_type_hi, io_I_type_lo) @[Cat.scala 30:58]
    node _io_I_type_T_3 = asSInt(_io_I_type_T_2) @[IMM.scala 17:62]
    node _io_S_type_T = bits(io_instr, 31, 31) @[IMM.scala 20:37]
    node _io_S_type_T_1 = bits(_io_S_type_T, 0, 0) @[Bitwise.scala 72:15]
    node io_S_type_hi_hi = mux(_io_S_type_T_1, UInt<20>("hfffff"), UInt<20>("h0")) @[Bitwise.scala 72:12]
    node io_S_type_hi_lo = bits(io_instr, 31, 25) @[IMM.scala 20:52]
    node io_S_type_lo = bits(io_instr, 11, 7) @[IMM.scala 20:70]
    node io_S_type_hi = cat(io_S_type_hi_hi, io_S_type_hi_lo) @[Cat.scala 30:58]
    node _io_S_type_T_2 = cat(io_S_type_hi, io_S_type_lo) @[Cat.scala 30:58]
    node _io_S_type_T_3 = asSInt(_io_S_type_T_2) @[IMM.scala 20:79]
    node _sbImm_T = bits(io_instr, 31, 31) @[IMM.scala 23:36]
    node _sbImm_T_1 = bits(_sbImm_T, 0, 0) @[Bitwise.scala 72:15]
    node sbImm_hi_hi_hi = mux(_sbImm_T_1, UInt<19>("h7ffff"), UInt<19>("h0")) @[Bitwise.scala 72:12]
    node sbImm_hi_hi_lo = bits(io_instr, 31, 31) @[IMM.scala 23:51]
    node sbImm_hi_lo = bits(io_instr, 7, 7) @[IMM.scala 23:65]
    node sbImm_lo_hi_hi = bits(io_instr, 30, 25) @[IMM.scala 23:78]
    node sbImm_lo_hi_lo = bits(io_instr, 11, 8) @[IMM.scala 23:96]
    node sbImm_lo_hi = cat(sbImm_lo_hi_hi, sbImm_lo_hi_lo) @[Cat.scala 30:58]
    node sbImm_lo = cat(sbImm_lo_hi, UInt<1>("h0")) @[Cat.scala 30:58]
    node sbImm_hi_hi = cat(sbImm_hi_hi_hi, sbImm_hi_hi_lo) @[Cat.scala 30:58]
    node sbImm_hi = cat(sbImm_hi_hi, sbImm_hi_lo) @[Cat.scala 30:58]
    node _sbImm_T_2 = cat(sbImm_hi, sbImm_lo) @[Cat.scala 30:58]
    node sbImm = asSInt(_sbImm_T_2) @[IMM.scala 23:115]
    node _io_SB_type_T = asSInt(io_pc) @[IMM.scala 24:31]
    node _io_SB_type_T_1 = add(sbImm, _io_SB_type_T) @[IMM.scala 24:23]
    node _io_SB_type_T_2 = tail(_io_SB_type_T_1, 1) @[IMM.scala 24:23]
    node _io_SB_type_T_3 = asSInt(_io_SB_type_T_2) @[IMM.scala 24:23]
    node io_U_type_hi = bits(io_instr, 31, 12) @[IMM.scala 27:28]
    node io_U_type_lo = mux(UInt<1>("h0"), UInt<12>("hfff"), UInt<12>("h0")) @[Bitwise.scala 72:12]
    node _io_U_type_T = cat(io_U_type_hi, io_U_type_lo) @[Cat.scala 30:58]
    node _io_U_type_T_1 = asSInt(_io_U_type_T) @[IMM.scala 27:53]
    node _ujImm_T = bits(io_instr, 31, 31) @[IMM.scala 30:36]
    node _ujImm_T_1 = bits(_ujImm_T, 0, 0) @[Bitwise.scala 72:15]
    node ujImm_hi_hi_hi = mux(_ujImm_T_1, UInt<11>("h7ff"), UInt<11>("h0")) @[Bitwise.scala 72:12]
    node ujImm_hi_hi_lo = bits(io_instr, 31, 31) @[IMM.scala 30:51]
    node ujImm_hi_lo = bits(io_instr, 19, 12) @[IMM.scala 30:65]
    node ujImm_lo_hi_hi = bits(io_instr, 20, 20) @[IMM.scala 30:83]
    node ujImm_lo_hi_lo = bits(io_instr, 30, 21) @[IMM.scala 30:97]
    node ujImm_lo_hi = cat(ujImm_lo_hi_hi, ujImm_lo_hi_lo) @[Cat.scala 30:58]
    node ujImm_lo = cat(ujImm_lo_hi, UInt<1>("h0")) @[Cat.scala 30:58]
    node ujImm_hi_hi = cat(ujImm_hi_hi_hi, ujImm_hi_hi_lo) @[Cat.scala 30:58]
    node ujImm_hi = cat(ujImm_hi_hi, ujImm_hi_lo) @[Cat.scala 30:58]
    node _ujImm_T_2 = cat(ujImm_hi, ujImm_lo) @[Cat.scala 30:58]
    node ujImm = asSInt(_ujImm_T_2) @[IMM.scala 30:117]
    node _io_UJ_type_T = asSInt(io_pc) @[IMM.scala 31:31]
    node _io_UJ_type_T_1 = add(ujImm, _io_UJ_type_T) @[IMM.scala 31:23]
    node _io_UJ_type_T_2 = tail(_io_UJ_type_T_1, 1) @[IMM.scala 31:23]
    node _io_UJ_type_T_3 = asSInt(_io_UJ_type_T_2) @[IMM.scala 31:23]
    io_I_type <= _io_I_type_T_3 @[IMM.scala 17:13]
    io_S_type <= _io_S_type_T_3 @[IMM.scala 20:13]
    io_SB_type <= _io_SB_type_T_3 @[IMM.scala 24:14]
    io_U_type <= _io_U_type_T_1 @[IMM.scala 27:13]
    io_UJ_type <= _io_UJ_type_T_3 @[IMM.scala 31:14]

  module RegisterFile :
    input clock : Clock
    input reset : UInt<1>
    input io_rs1 : UInt<5>
    input io_rs2 : UInt<5>
    input io_reg_write : UInt<1>
    input io_w_reg : UInt<5>
    input io_w_data : SInt<32>
    output io_rdata1 : SInt<32>
    output io_rdata2 : SInt<32>

    reg regfile_0 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_0) @[RegFile.scala 15:24]
    reg regfile_1 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_1) @[RegFile.scala 15:24]
    reg regfile_2 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_2) @[RegFile.scala 15:24]
    reg regfile_3 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_3) @[RegFile.scala 15:24]
    reg regfile_4 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_4) @[RegFile.scala 15:24]
    reg regfile_5 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_5) @[RegFile.scala 15:24]
    reg regfile_6 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_6) @[RegFile.scala 15:24]
    reg regfile_7 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_7) @[RegFile.scala 15:24]
    reg regfile_8 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_8) @[RegFile.scala 15:24]
    reg regfile_9 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_9) @[RegFile.scala 15:24]
    reg regfile_10 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_10) @[RegFile.scala 15:24]
    reg regfile_11 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_11) @[RegFile.scala 15:24]
    reg regfile_12 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_12) @[RegFile.scala 15:24]
    reg regfile_13 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_13) @[RegFile.scala 15:24]
    reg regfile_14 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_14) @[RegFile.scala 15:24]
    reg regfile_15 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_15) @[RegFile.scala 15:24]
    reg regfile_16 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_16) @[RegFile.scala 15:24]
    reg regfile_17 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_17) @[RegFile.scala 15:24]
    reg regfile_18 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_18) @[RegFile.scala 15:24]
    reg regfile_19 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_19) @[RegFile.scala 15:24]
    reg regfile_20 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_20) @[RegFile.scala 15:24]
    reg regfile_21 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_21) @[RegFile.scala 15:24]
    reg regfile_22 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_22) @[RegFile.scala 15:24]
    reg regfile_23 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_23) @[RegFile.scala 15:24]
    reg regfile_24 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_24) @[RegFile.scala 15:24]
    reg regfile_25 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_25) @[RegFile.scala 15:24]
    reg regfile_26 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_26) @[RegFile.scala 15:24]
    reg regfile_27 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_27) @[RegFile.scala 15:24]
    reg regfile_28 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_28) @[RegFile.scala 15:24]
    reg regfile_29 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_29) @[RegFile.scala 15:24]
    reg regfile_30 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_30) @[RegFile.scala 15:24]
    reg regfile_31 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), regfile_31) @[RegFile.scala 15:24]
    node _io_rdata1_T = eq(io_rs1, UInt<1>("h0")) @[RegFile.scala 17:27]
    node _GEN_0 = validif(eq(UInt<1>("h0"), io_rs1), regfile_0) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_1 = mux(eq(UInt<1>("h1"), io_rs1), regfile_1, _GEN_0) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_2 = mux(eq(UInt<2>("h2"), io_rs1), regfile_2, _GEN_1) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_3 = mux(eq(UInt<2>("h3"), io_rs1), regfile_3, _GEN_2) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_4 = mux(eq(UInt<3>("h4"), io_rs1), regfile_4, _GEN_3) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_5 = mux(eq(UInt<3>("h5"), io_rs1), regfile_5, _GEN_4) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_6 = mux(eq(UInt<3>("h6"), io_rs1), regfile_6, _GEN_5) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_7 = mux(eq(UInt<3>("h7"), io_rs1), regfile_7, _GEN_6) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_8 = mux(eq(UInt<4>("h8"), io_rs1), regfile_8, _GEN_7) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_9 = mux(eq(UInt<4>("h9"), io_rs1), regfile_9, _GEN_8) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_10 = mux(eq(UInt<4>("ha"), io_rs1), regfile_10, _GEN_9) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_11 = mux(eq(UInt<4>("hb"), io_rs1), regfile_11, _GEN_10) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_12 = mux(eq(UInt<4>("hc"), io_rs1), regfile_12, _GEN_11) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_13 = mux(eq(UInt<4>("hd"), io_rs1), regfile_13, _GEN_12) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_14 = mux(eq(UInt<4>("he"), io_rs1), regfile_14, _GEN_13) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_15 = mux(eq(UInt<4>("hf"), io_rs1), regfile_15, _GEN_14) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_16 = mux(eq(UInt<5>("h10"), io_rs1), regfile_16, _GEN_15) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_17 = mux(eq(UInt<5>("h11"), io_rs1), regfile_17, _GEN_16) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_18 = mux(eq(UInt<5>("h12"), io_rs1), regfile_18, _GEN_17) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_19 = mux(eq(UInt<5>("h13"), io_rs1), regfile_19, _GEN_18) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_20 = mux(eq(UInt<5>("h14"), io_rs1), regfile_20, _GEN_19) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_21 = mux(eq(UInt<5>("h15"), io_rs1), regfile_21, _GEN_20) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_22 = mux(eq(UInt<5>("h16"), io_rs1), regfile_22, _GEN_21) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_23 = mux(eq(UInt<5>("h17"), io_rs1), regfile_23, _GEN_22) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_24 = mux(eq(UInt<5>("h18"), io_rs1), regfile_24, _GEN_23) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_25 = mux(eq(UInt<5>("h19"), io_rs1), regfile_25, _GEN_24) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_26 = mux(eq(UInt<5>("h1a"), io_rs1), regfile_26, _GEN_25) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_27 = mux(eq(UInt<5>("h1b"), io_rs1), regfile_27, _GEN_26) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_28 = mux(eq(UInt<5>("h1c"), io_rs1), regfile_28, _GEN_27) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_29 = mux(eq(UInt<5>("h1d"), io_rs1), regfile_29, _GEN_28) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_30 = mux(eq(UInt<5>("h1e"), io_rs1), regfile_30, _GEN_29) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _GEN_31 = mux(eq(UInt<5>("h1f"), io_rs1), regfile_31, _GEN_30) @[RegFile.scala 17:19 RegFile.scala 17:19]
    node _regfile_io_rs1 = _GEN_31 @[RegFile.scala 17:19]
    node _io_rdata1_T_1 = mux(_io_rdata1_T, asSInt(UInt<1>("h0")), _regfile_io_rs1) @[RegFile.scala 17:19]
    node _io_rdata2_T = eq(io_rs2, UInt<1>("h0")) @[RegFile.scala 18:27]
    node _GEN_32 = validif(eq(UInt<1>("h0"), io_rs2), regfile_0) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_33 = mux(eq(UInt<1>("h1"), io_rs2), regfile_1, _GEN_32) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_34 = mux(eq(UInt<2>("h2"), io_rs2), regfile_2, _GEN_33) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_35 = mux(eq(UInt<2>("h3"), io_rs2), regfile_3, _GEN_34) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_36 = mux(eq(UInt<3>("h4"), io_rs2), regfile_4, _GEN_35) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_37 = mux(eq(UInt<3>("h5"), io_rs2), regfile_5, _GEN_36) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_38 = mux(eq(UInt<3>("h6"), io_rs2), regfile_6, _GEN_37) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_39 = mux(eq(UInt<3>("h7"), io_rs2), regfile_7, _GEN_38) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_40 = mux(eq(UInt<4>("h8"), io_rs2), regfile_8, _GEN_39) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_41 = mux(eq(UInt<4>("h9"), io_rs2), regfile_9, _GEN_40) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_42 = mux(eq(UInt<4>("ha"), io_rs2), regfile_10, _GEN_41) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_43 = mux(eq(UInt<4>("hb"), io_rs2), regfile_11, _GEN_42) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_44 = mux(eq(UInt<4>("hc"), io_rs2), regfile_12, _GEN_43) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_45 = mux(eq(UInt<4>("hd"), io_rs2), regfile_13, _GEN_44) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_46 = mux(eq(UInt<4>("he"), io_rs2), regfile_14, _GEN_45) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_47 = mux(eq(UInt<4>("hf"), io_rs2), regfile_15, _GEN_46) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_48 = mux(eq(UInt<5>("h10"), io_rs2), regfile_16, _GEN_47) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_49 = mux(eq(UInt<5>("h11"), io_rs2), regfile_17, _GEN_48) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_50 = mux(eq(UInt<5>("h12"), io_rs2), regfile_18, _GEN_49) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_51 = mux(eq(UInt<5>("h13"), io_rs2), regfile_19, _GEN_50) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_52 = mux(eq(UInt<5>("h14"), io_rs2), regfile_20, _GEN_51) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_53 = mux(eq(UInt<5>("h15"), io_rs2), regfile_21, _GEN_52) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_54 = mux(eq(UInt<5>("h16"), io_rs2), regfile_22, _GEN_53) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_55 = mux(eq(UInt<5>("h17"), io_rs2), regfile_23, _GEN_54) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_56 = mux(eq(UInt<5>("h18"), io_rs2), regfile_24, _GEN_55) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_57 = mux(eq(UInt<5>("h19"), io_rs2), regfile_25, _GEN_56) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_58 = mux(eq(UInt<5>("h1a"), io_rs2), regfile_26, _GEN_57) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_59 = mux(eq(UInt<5>("h1b"), io_rs2), regfile_27, _GEN_58) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_60 = mux(eq(UInt<5>("h1c"), io_rs2), regfile_28, _GEN_59) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_61 = mux(eq(UInt<5>("h1d"), io_rs2), regfile_29, _GEN_60) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_62 = mux(eq(UInt<5>("h1e"), io_rs2), regfile_30, _GEN_61) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _GEN_63 = mux(eq(UInt<5>("h1f"), io_rs2), regfile_31, _GEN_62) @[RegFile.scala 18:19 RegFile.scala 18:19]
    node _regfile_io_rs2 = _GEN_63 @[RegFile.scala 18:19]
    node _io_rdata2_T_1 = mux(_io_rdata2_T, asSInt(UInt<1>("h0")), _regfile_io_rs2) @[RegFile.scala 18:19]
    node _T = neq(io_w_reg, UInt<1>("h0")) @[RegFile.scala 20:33]
    node _T_1 = and(io_reg_write, _T) @[RegFile.scala 20:21]
    node _regfile_io_w_reg = io_w_data @[RegFile.scala 21:23 RegFile.scala 21:23]
    node _GEN_64 = mux(eq(UInt<1>("h0"), io_w_reg), _regfile_io_w_reg, regfile_0) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_65 = mux(eq(UInt<1>("h1"), io_w_reg), _regfile_io_w_reg, regfile_1) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_66 = mux(eq(UInt<2>("h2"), io_w_reg), _regfile_io_w_reg, regfile_2) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_67 = mux(eq(UInt<2>("h3"), io_w_reg), _regfile_io_w_reg, regfile_3) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_68 = mux(eq(UInt<3>("h4"), io_w_reg), _regfile_io_w_reg, regfile_4) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_69 = mux(eq(UInt<3>("h5"), io_w_reg), _regfile_io_w_reg, regfile_5) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_70 = mux(eq(UInt<3>("h6"), io_w_reg), _regfile_io_w_reg, regfile_6) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_71 = mux(eq(UInt<3>("h7"), io_w_reg), _regfile_io_w_reg, regfile_7) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_72 = mux(eq(UInt<4>("h8"), io_w_reg), _regfile_io_w_reg, regfile_8) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_73 = mux(eq(UInt<4>("h9"), io_w_reg), _regfile_io_w_reg, regfile_9) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_74 = mux(eq(UInt<4>("ha"), io_w_reg), _regfile_io_w_reg, regfile_10) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_75 = mux(eq(UInt<4>("hb"), io_w_reg), _regfile_io_w_reg, regfile_11) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_76 = mux(eq(UInt<4>("hc"), io_w_reg), _regfile_io_w_reg, regfile_12) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_77 = mux(eq(UInt<4>("hd"), io_w_reg), _regfile_io_w_reg, regfile_13) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_78 = mux(eq(UInt<4>("he"), io_w_reg), _regfile_io_w_reg, regfile_14) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_79 = mux(eq(UInt<4>("hf"), io_w_reg), _regfile_io_w_reg, regfile_15) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_80 = mux(eq(UInt<5>("h10"), io_w_reg), _regfile_io_w_reg, regfile_16) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_81 = mux(eq(UInt<5>("h11"), io_w_reg), _regfile_io_w_reg, regfile_17) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_82 = mux(eq(UInt<5>("h12"), io_w_reg), _regfile_io_w_reg, regfile_18) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_83 = mux(eq(UInt<5>("h13"), io_w_reg), _regfile_io_w_reg, regfile_19) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_84 = mux(eq(UInt<5>("h14"), io_w_reg), _regfile_io_w_reg, regfile_20) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_85 = mux(eq(UInt<5>("h15"), io_w_reg), _regfile_io_w_reg, regfile_21) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_86 = mux(eq(UInt<5>("h16"), io_w_reg), _regfile_io_w_reg, regfile_22) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_87 = mux(eq(UInt<5>("h17"), io_w_reg), _regfile_io_w_reg, regfile_23) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_88 = mux(eq(UInt<5>("h18"), io_w_reg), _regfile_io_w_reg, regfile_24) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_89 = mux(eq(UInt<5>("h19"), io_w_reg), _regfile_io_w_reg, regfile_25) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_90 = mux(eq(UInt<5>("h1a"), io_w_reg), _regfile_io_w_reg, regfile_26) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_91 = mux(eq(UInt<5>("h1b"), io_w_reg), _regfile_io_w_reg, regfile_27) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_92 = mux(eq(UInt<5>("h1c"), io_w_reg), _regfile_io_w_reg, regfile_28) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_93 = mux(eq(UInt<5>("h1d"), io_w_reg), _regfile_io_w_reg, regfile_29) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_94 = mux(eq(UInt<5>("h1e"), io_w_reg), _regfile_io_w_reg, regfile_30) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_95 = mux(eq(UInt<5>("h1f"), io_w_reg), _regfile_io_w_reg, regfile_31) @[RegFile.scala 21:23 RegFile.scala 21:23 RegFile.scala 15:24]
    node _GEN_96 = mux(_T_1, _GEN_64, regfile_0) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_97 = mux(_T_1, _GEN_65, regfile_1) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_98 = mux(_T_1, _GEN_66, regfile_2) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_99 = mux(_T_1, _GEN_67, regfile_3) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_100 = mux(_T_1, _GEN_68, regfile_4) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_101 = mux(_T_1, _GEN_69, regfile_5) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_102 = mux(_T_1, _GEN_70, regfile_6) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_103 = mux(_T_1, _GEN_71, regfile_7) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_104 = mux(_T_1, _GEN_72, regfile_8) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_105 = mux(_T_1, _GEN_73, regfile_9) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_106 = mux(_T_1, _GEN_74, regfile_10) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_107 = mux(_T_1, _GEN_75, regfile_11) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_108 = mux(_T_1, _GEN_76, regfile_12) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_109 = mux(_T_1, _GEN_77, regfile_13) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_110 = mux(_T_1, _GEN_78, regfile_14) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_111 = mux(_T_1, _GEN_79, regfile_15) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_112 = mux(_T_1, _GEN_80, regfile_16) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_113 = mux(_T_1, _GEN_81, regfile_17) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_114 = mux(_T_1, _GEN_82, regfile_18) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_115 = mux(_T_1, _GEN_83, regfile_19) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_116 = mux(_T_1, _GEN_84, regfile_20) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_117 = mux(_T_1, _GEN_85, regfile_21) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_118 = mux(_T_1, _GEN_86, regfile_22) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_119 = mux(_T_1, _GEN_87, regfile_23) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_120 = mux(_T_1, _GEN_88, regfile_24) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_121 = mux(_T_1, _GEN_89, regfile_25) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_122 = mux(_T_1, _GEN_90, regfile_26) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_123 = mux(_T_1, _GEN_91, regfile_27) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_124 = mux(_T_1, _GEN_92, regfile_28) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_125 = mux(_T_1, _GEN_93, regfile_29) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_126 = mux(_T_1, _GEN_94, regfile_30) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _GEN_127 = mux(_T_1, _GEN_95, regfile_31) @[RegFile.scala 20:42 RegFile.scala 15:24]
    node _regfile_WIRE_0 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_1 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_2 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_3 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_4 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_5 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_6 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_7 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_8 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_9 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_10 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_11 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_12 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_13 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_14 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_15 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_16 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_17 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_18 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_19 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_20 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_21 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_22 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_23 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_24 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_25 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_26 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_27 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_28 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_29 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_30 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    node _regfile_WIRE_31 = asSInt(UInt<32>("h0")) @[RegFile.scala 15:32 RegFile.scala 15:32]
    io_rdata1 <= _io_rdata1_T_1 @[RegFile.scala 17:13]
    io_rdata2 <= _io_rdata2_T_1 @[RegFile.scala 18:13]
    regfile_0 <= mux(reset, _regfile_WIRE_0, _GEN_96) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_1 <= mux(reset, _regfile_WIRE_1, _GEN_97) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_2 <= mux(reset, _regfile_WIRE_2, _GEN_98) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_3 <= mux(reset, _regfile_WIRE_3, _GEN_99) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_4 <= mux(reset, _regfile_WIRE_4, _GEN_100) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_5 <= mux(reset, _regfile_WIRE_5, _GEN_101) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_6 <= mux(reset, _regfile_WIRE_6, _GEN_102) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_7 <= mux(reset, _regfile_WIRE_7, _GEN_103) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_8 <= mux(reset, _regfile_WIRE_8, _GEN_104) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_9 <= mux(reset, _regfile_WIRE_9, _GEN_105) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_10 <= mux(reset, _regfile_WIRE_10, _GEN_106) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_11 <= mux(reset, _regfile_WIRE_11, _GEN_107) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_12 <= mux(reset, _regfile_WIRE_12, _GEN_108) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_13 <= mux(reset, _regfile_WIRE_13, _GEN_109) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_14 <= mux(reset, _regfile_WIRE_14, _GEN_110) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_15 <= mux(reset, _regfile_WIRE_15, _GEN_111) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_16 <= mux(reset, _regfile_WIRE_16, _GEN_112) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_17 <= mux(reset, _regfile_WIRE_17, _GEN_113) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_18 <= mux(reset, _regfile_WIRE_18, _GEN_114) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_19 <= mux(reset, _regfile_WIRE_19, _GEN_115) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_20 <= mux(reset, _regfile_WIRE_20, _GEN_116) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_21 <= mux(reset, _regfile_WIRE_21, _GEN_117) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_22 <= mux(reset, _regfile_WIRE_22, _GEN_118) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_23 <= mux(reset, _regfile_WIRE_23, _GEN_119) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_24 <= mux(reset, _regfile_WIRE_24, _GEN_120) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_25 <= mux(reset, _regfile_WIRE_25, _GEN_121) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_26 <= mux(reset, _regfile_WIRE_26, _GEN_122) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_27 <= mux(reset, _regfile_WIRE_27, _GEN_123) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_28 <= mux(reset, _regfile_WIRE_28, _GEN_124) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_29 <= mux(reset, _regfile_WIRE_29, _GEN_125) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_30 <= mux(reset, _regfile_WIRE_30, _GEN_126) @[RegFile.scala 15:24 RegFile.scala 15:24]
    regfile_31 <= mux(reset, _regfile_WIRE_31, _GEN_127) @[RegFile.scala 15:24 RegFile.scala 15:24]

  module AluControl :
    input clock : Clock
    input reset : UInt<1>
    input io_func3 : UInt<3>
    input io_func7 : UInt<1>
    input io_aluOp : UInt<3>
    output io_out : UInt<5>

    node _T = eq(io_aluOp, UInt<1>("h0")) @[Alu_Control.scala 15:17]
    node io_out_hi = cat(UInt<2>("h0"), io_func7) @[Cat.scala 30:58]
    node _io_out_T = cat(io_out_hi, io_func3) @[Cat.scala 30:58]
    node _T_1 = eq(io_aluOp, UInt<1>("h1")) @[Alu_Control.scala 18:23]
    node _io_out_T_1 = cat(UInt<2>("h0"), io_func3) @[Cat.scala 30:58]
    node _T_2 = eq(io_aluOp, UInt<2>("h2")) @[Alu_Control.scala 22:23]
    node _io_out_T_2 = cat(UInt<3>("h2"), io_func3) @[Cat.scala 30:58]
    node _T_3 = eq(io_aluOp, UInt<2>("h3")) @[Alu_Control.scala 26:23]
    node _T_4 = eq(io_aluOp, UInt<3>("h4")) @[Alu_Control.scala 30:23]
    node _T_5 = eq(io_aluOp, UInt<3>("h5")) @[Alu_Control.scala 30:43]
    node _T_6 = or(_T_4, _T_5) @[Alu_Control.scala 30:31]
    node _T_7 = eq(io_aluOp, UInt<3>("h6")) @[Alu_Control.scala 30:63]
    node _T_8 = or(_T_6, _T_7) @[Alu_Control.scala 30:51]
    node _T_9 = eq(io_aluOp, UInt<3>("h7")) @[Alu_Control.scala 30:83]
    node _T_10 = or(_T_8, _T_9) @[Alu_Control.scala 30:71]
    node _GEN_0 = mux(_T_10, UInt<1>("h0"), UInt<1>("h0")) @[Alu_Control.scala 30:92 Alu_Control.scala 31:12 Alu_Control.scala 34:12]
    node _GEN_1 = mux(_T_3, UInt<5>("h1f"), _GEN_0) @[Alu_Control.scala 26:32 Alu_Control.scala 27:12]
    node _GEN_2 = mux(_T_2, _io_out_T_2, _GEN_1) @[Alu_Control.scala 22:32 Alu_Control.scala 23:12]
    node _GEN_3 = mux(_T_1, _io_out_T_1, _GEN_2) @[Alu_Control.scala 18:32 Alu_Control.scala 19:12]
    node _GEN_4 = mux(_T, _io_out_T, _GEN_3) @[Alu_Control.scala 15:26 Alu_Control.scala 16:12]
    io_out <= bits(_GEN_4, 4, 0)

  module ALU :
    input clock : Clock
    input reset : UInt<1>
    input io_in_A : SInt<32>
    input io_in_B : SInt<32>
    input io_alu_Op : UInt<5>
    output io_out : SInt<32>

    node _T = eq(UInt<5>("h0"), io_alu_Op) @[Conditional.scala 37:30]
    node _T_1 = eq(UInt<5>("h0"), io_alu_Op) @[Conditional.scala 37:30]
    node _T_2 = eq(UInt<5>("h0"), io_alu_Op) @[Conditional.scala 37:30]
    node _T_3 = eq(UInt<5>("h0"), io_alu_Op) @[Conditional.scala 37:30]
    node _T_4 = eq(UInt<5>("h0"), io_alu_Op) @[Conditional.scala 37:30]
    node _T_5 = eq(UInt<5>("h0"), io_alu_Op) @[Conditional.scala 37:30]
    node _T_6 = or(_T, _T_1) @[Conditional.scala 37:55]
    node _T_7 = or(_T_6, _T_2) @[Conditional.scala 37:55]
    node _T_8 = or(_T_7, _T_3) @[Conditional.scala 37:55]
    node _T_9 = or(_T_8, _T_4) @[Conditional.scala 37:55]
    node _T_10 = or(_T_9, _T_5) @[Conditional.scala 37:55]
    node _result_T = add(io_in_A, io_in_B) @[ALU.scala 47:25]
    node _result_T_1 = tail(_result_T, 1) @[ALU.scala 47:25]
    node _result_T_2 = asSInt(_result_T_1) @[ALU.scala 47:25]
    node _T_11 = eq(UInt<5>("h1"), io_alu_Op) @[Conditional.scala 37:30]
    node _T_12 = eq(UInt<5>("h1"), io_alu_Op) @[Conditional.scala 37:30]
    node _T_13 = or(_T_11, _T_12) @[Conditional.scala 37:55]
    node _result_T_3 = asUInt(io_in_A) @[ALU.scala 50:26]
    node _result_T_4 = bits(io_in_B, 4, 0) @[ALU.scala 50:43]
    node _result_T_5 = dshl(_result_T_3, _result_T_4) @[ALU.scala 50:33]
    node _result_T_6 = asSInt(_result_T_5) @[ALU.scala 50:51]
    node _T_14 = eq(UInt<5>("h2"), io_alu_Op) @[Conditional.scala 37:30]
    node _T_15 = eq(UInt<5>("h2"), io_alu_Op) @[Conditional.scala 37:30]
    node _T_16 = or(_T_14, _T_15) @[Conditional.scala 37:55]
    node _result_T_7 = lt(io_in_A, io_in_B) @[ALU.scala 53:29]
    node _result_T_8 = mux(_result_T_7, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[ALU.scala 53:20]
    node _T_17 = eq(UInt<5>("h3"), io_alu_Op) @[Conditional.scala 37:30]
    node _T_18 = eq(UInt<5>("h3"), io_alu_Op) @[Conditional.scala 37:30]
    node _T_19 = or(_T_17, _T_18) @[Conditional.scala 37:55]
    node _result_T_9 = asUInt(io_in_A) @[ALU.scala 56:29]
    node _result_T_10 = asUInt(io_in_B) @[ALU.scala 56:46]
    node _result_T_11 = lt(_result_T_9, _result_T_10) @[ALU.scala 56:36]
    node _result_T_12 = mux(_result_T_11, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[ALU.scala 56:20]
    node _T_20 = eq(UInt<5>("h4"), io_alu_Op) @[Conditional.scala 37:30]
    node _T_21 = eq(UInt<5>("h4"), io_alu_Op) @[Conditional.scala 37:30]
    node _T_22 = or(_T_20, _T_21) @[Conditional.scala 37:55]
    node _result_T_13 = xor(io_in_A, io_in_B) @[ALU.scala 59:25]
    node _result_T_14 = asSInt(_result_T_13) @[ALU.scala 59:25]
    node _T_23 = eq(UInt<5>("h5"), io_alu_Op) @[Conditional.scala 37:30]
    node _T_24 = eq(UInt<5>("h5"), io_alu_Op) @[Conditional.scala 37:30]
    node _T_25 = or(_T_23, _T_24) @[Conditional.scala 37:55]
    node _result_T_15 = asUInt(io_in_A) @[ALU.scala 62:26]
    node _result_T_16 = bits(io_in_B, 4, 0) @[ALU.scala 62:43]
    node _result_T_17 = dshr(_result_T_15, _result_T_16) @[ALU.scala 62:33]
    node _result_T_18 = asSInt(_result_T_17) @[ALU.scala 62:51]
    node _T_26 = eq(UInt<5>("h6"), io_alu_Op) @[Conditional.scala 37:30]
    node _T_27 = eq(UInt<5>("h6"), io_alu_Op) @[Conditional.scala 37:30]
    node _T_28 = or(_T_26, _T_27) @[Conditional.scala 37:55]
    node _result_T_19 = or(io_in_A, io_in_B) @[ALU.scala 65:25]
    node _result_T_20 = asSInt(_result_T_19) @[ALU.scala 65:25]
    node _T_29 = eq(UInt<5>("h7"), io_alu_Op) @[Conditional.scala 37:30]
    node _T_30 = eq(UInt<5>("h7"), io_alu_Op) @[Conditional.scala 37:30]
    node _T_31 = or(_T_29, _T_30) @[Conditional.scala 37:55]
    node _result_T_21 = and(io_in_A, io_in_B) @[ALU.scala 68:25]
    node _result_T_22 = asSInt(_result_T_21) @[ALU.scala 68:25]
    node _T_32 = eq(UInt<5>("h8"), io_alu_Op) @[Conditional.scala 37:30]
    node _result_T_23 = sub(io_in_A, io_in_B) @[ALU.scala 71:25]
    node _result_T_24 = tail(_result_T_23, 1) @[ALU.scala 71:25]
    node _result_T_25 = asSInt(_result_T_24) @[ALU.scala 71:25]
    node _T_33 = eq(UInt<5>("hd"), io_alu_Op) @[Conditional.scala 37:30]
    node _T_34 = eq(UInt<5>("hd"), io_alu_Op) @[Conditional.scala 37:30]
    node _T_35 = or(_T_33, _T_34) @[Conditional.scala 37:55]
    node _result_T_26 = bits(io_in_B, 4, 0) @[ALU.scala 74:36]
    node _result_T_27 = dshr(io_in_A, _result_T_26) @[ALU.scala 74:26]
    node _T_36 = eq(UInt<5>("h1f"), io_alu_Op) @[Conditional.scala 37:30]
    node _T_37 = eq(UInt<5>("h1f"), io_alu_Op) @[Conditional.scala 37:30]
    node _T_38 = or(_T_36, _T_37) @[Conditional.scala 37:55]
    node _GEN_0 = mux(_T_38, io_in_A, asSInt(UInt<32>("h0"))) @[Conditional.scala 39:67 ALU.scala 77:14]
    node _GEN_1 = mux(_T_35, _result_T_27, _GEN_0) @[Conditional.scala 39:67 ALU.scala 74:14]
    node _GEN_2 = mux(_T_32, _result_T_25, _GEN_1) @[Conditional.scala 39:67 ALU.scala 71:14]
    node _GEN_3 = mux(_T_31, _result_T_22, _GEN_2) @[Conditional.scala 39:67 ALU.scala 68:14]
    node _GEN_4 = mux(_T_28, _result_T_20, _GEN_3) @[Conditional.scala 39:67 ALU.scala 65:14]
    node _GEN_5 = mux(_T_25, _result_T_18, _GEN_4) @[Conditional.scala 39:67 ALU.scala 62:14]
    node _GEN_6 = mux(_T_22, _result_T_14, _GEN_5) @[Conditional.scala 39:67 ALU.scala 59:14]
    node _GEN_7 = mux(_T_19, _result_T_12, _GEN_6) @[Conditional.scala 39:67 ALU.scala 56:14]
    node _GEN_8 = mux(_T_16, _result_T_8, _GEN_7) @[Conditional.scala 39:67 ALU.scala 53:14]
    node _GEN_9 = mux(_T_13, _result_T_6, _GEN_8) @[Conditional.scala 39:67 ALU.scala 50:14]
    node _GEN_10 = mux(_T_10, _result_T_2, _GEN_9) @[Conditional.scala 40:58 ALU.scala 47:14]
    node result = asSInt(bits(_GEN_10, 31, 0))
    io_out <= result @[ALU.scala 81:10]

  module Branch :
    input clock : Clock
    input reset : UInt<1>
    input io_fnct3 : UInt<3>
    input io_branch : UInt<1>
    input io_arg_x : SInt<32>
    input io_arg_y : SInt<32>
    output io_br_taken : UInt<1>

    node _T = eq(io_fnct3, UInt<1>("h0")) @[Branch.scala 18:19]
    node _io_br_taken_T = eq(io_arg_x, io_arg_y) @[Branch.scala 19:31]
    node _T_1 = eq(io_fnct3, UInt<1>("h1")) @[Branch.scala 22:24]
    node _io_br_taken_T_1 = neq(io_arg_x, io_arg_y) @[Branch.scala 23:31]
    node _T_2 = eq(io_fnct3, UInt<3>("h4")) @[Branch.scala 26:24]
    node _io_br_taken_T_2 = lt(io_arg_x, io_arg_y) @[Branch.scala 27:31]
    node _T_3 = eq(io_fnct3, UInt<3>("h5")) @[Branch.scala 30:24]
    node _io_br_taken_T_3 = geq(io_arg_x, io_arg_y) @[Branch.scala 31:31]
    node _T_4 = eq(io_fnct3, UInt<3>("h6")) @[Branch.scala 34:24]
    node _io_br_taken_T_4 = asUInt(io_arg_x) @[Branch.scala 35:31]
    node _io_br_taken_T_5 = asUInt(io_arg_y) @[Branch.scala 35:49]
    node _io_br_taken_T_6 = lt(_io_br_taken_T_4, _io_br_taken_T_5) @[Branch.scala 35:38]
    node _T_5 = eq(io_fnct3, UInt<3>("h7")) @[Branch.scala 38:24]
    node _io_br_taken_T_7 = asUInt(io_arg_x) @[Branch.scala 39:31]
    node _io_br_taken_T_8 = asUInt(io_arg_y) @[Branch.scala 39:50]
    node _io_br_taken_T_9 = geq(_io_br_taken_T_7, _io_br_taken_T_8) @[Branch.scala 39:38]
    node _GEN_0 = mux(_T_5, _io_br_taken_T_9, UInt<1>("h0")) @[Branch.scala 38:33 Branch.scala 39:19 Branch.scala 14:15]
    node _GEN_1 = mux(_T_4, _io_br_taken_T_6, _GEN_0) @[Branch.scala 34:33 Branch.scala 35:19]
    node _GEN_2 = mux(_T_3, _io_br_taken_T_3, _GEN_1) @[Branch.scala 30:33 Branch.scala 31:19]
    node _GEN_3 = mux(_T_2, _io_br_taken_T_2, _GEN_2) @[Branch.scala 26:33 Branch.scala 27:19]
    node _GEN_4 = mux(_T_1, _io_br_taken_T_1, _GEN_3) @[Branch.scala 22:33 Branch.scala 23:19]
    node _GEN_5 = mux(_T, _io_br_taken_T, _GEN_4) @[Branch.scala 18:28 Branch.scala 19:19]
    node _GEN_6 = mux(io_branch, _GEN_5, UInt<1>("h0")) @[Branch.scala 16:19 Branch.scala 14:15]
    io_br_taken <= _GEN_6

  module Jalr :
    input clock : Clock
    input reset : UInt<1>
    input io_imme : UInt<32>
    input io_rdata1 : UInt<32>
    output io_out : UInt<32>

    node _computedAddr_T = add(io_imme, io_rdata1) @[Jalr.scala 11:30]
    node computedAddr = tail(_computedAddr_T, 1) @[Jalr.scala 11:30]
    node _io_out_T = and(computedAddr, UInt<32>("hfffffffe")) @[Jalr.scala 14:26]
    io_out <= _io_out_T @[Jalr.scala 14:10]

  module Forwarding :
    input clock : Clock
    input reset : UInt<1>
    input io_IDEX_rs1 : UInt<5>
    input io_IDEX_rs2 : UInt<5>
    input io_EXMEM_rd : UInt<5>
    input io_EXMEM_regWr : UInt<1>
    input io_MEMWB_rd : UInt<5>
    input io_MEMWB_regWr : UInt<1>
    output io_forward_a : UInt<2>
    output io_forward_b : UInt<2>

    node _T = eq(io_EXMEM_regWr, UInt<1>("h1")) @[Forwarding.scala 22:25]
    node _T_1 = neq(io_EXMEM_rd, UInt<1>("h0")) @[Forwarding.scala 22:51]
    node _T_2 = and(_T, _T_1) @[Forwarding.scala 22:36]
    node _T_3 = eq(io_EXMEM_rd, io_IDEX_rs1) @[Forwarding.scala 23:26]
    node _T_4 = and(_T_2, _T_3) @[Forwarding.scala 22:66]
    node _T_5 = eq(io_EXMEM_rd, io_IDEX_rs2) @[Forwarding.scala 23:66]
    node _T_6 = and(_T_4, _T_5) @[Forwarding.scala 23:50]
    node _T_7 = eq(io_EXMEM_regWr, UInt<1>("h1")) @[Forwarding.scala 27:31]
    node _T_8 = neq(io_EXMEM_rd, UInt<1>("h0")) @[Forwarding.scala 27:57]
    node _T_9 = and(_T_7, _T_8) @[Forwarding.scala 27:42]
    node _T_10 = eq(io_EXMEM_rd, io_IDEX_rs2) @[Forwarding.scala 28:26]
    node _T_11 = and(_T_9, _T_10) @[Forwarding.scala 27:72]
    node _T_12 = eq(io_EXMEM_regWr, UInt<1>("h1")) @[Forwarding.scala 31:31]
    node _T_13 = neq(io_EXMEM_rd, UInt<1>("h0")) @[Forwarding.scala 31:57]
    node _T_14 = and(_T_12, _T_13) @[Forwarding.scala 31:42]
    node _T_15 = eq(io_EXMEM_rd, io_IDEX_rs1) @[Forwarding.scala 32:26]
    node _T_16 = and(_T_14, _T_15) @[Forwarding.scala 31:72]
    node _GEN_0 = mux(_T_16, UInt<2>("h2"), UInt<1>("h0")) @[Forwarding.scala 32:44 Forwarding.scala 33:22 Forwarding.scala 19:18]
    node _GEN_1 = mux(_T_11, UInt<2>("h2"), UInt<1>("h0")) @[Forwarding.scala 28:44 Forwarding.scala 29:22 Forwarding.scala 20:18]
    node _GEN_2 = mux(_T_11, UInt<1>("h0"), _GEN_0) @[Forwarding.scala 28:44 Forwarding.scala 19:18]
    node _GEN_3 = mux(_T_6, UInt<2>("h2"), _GEN_2) @[Forwarding.scala 23:84 Forwarding.scala 24:22]
    node _GEN_4 = mux(_T_6, UInt<2>("h2"), _GEN_1) @[Forwarding.scala 23:84 Forwarding.scala 25:22]
    node _T_17 = eq(io_MEMWB_regWr, UInt<1>("h1")) @[Forwarding.scala 37:26]
    node _T_18 = neq(io_MEMWB_rd, UInt<1>("h0")) @[Forwarding.scala 37:54]
    node _T_19 = and(_T_17, _T_18) @[Forwarding.scala 37:38]
    node _T_20 = eq(io_MEMWB_rd, io_IDEX_rs1) @[Forwarding.scala 37:86]
    node _T_21 = and(_T_19, _T_20) @[Forwarding.scala 37:70]
    node _T_22 = eq(io_MEMWB_rd, io_IDEX_rs2) @[Forwarding.scala 37:119]
    node _T_23 = and(_T_21, _T_22) @[Forwarding.scala 37:103]
    node _T_24 = eq(io_EXMEM_regWr, UInt<1>("h1")) @[Forwarding.scala 38:30]
    node _T_25 = neq(io_EXMEM_rd, UInt<1>("h0")) @[Forwarding.scala 38:56]
    node _T_26 = and(_T_24, _T_25) @[Forwarding.scala 38:41]
    node _T_27 = eq(io_EXMEM_rd, io_IDEX_rs1) @[Forwarding.scala 38:87]
    node _T_28 = and(_T_26, _T_27) @[Forwarding.scala 38:71]
    node _T_29 = eq(io_EXMEM_rd, io_IDEX_rs2) @[Forwarding.scala 38:120]
    node _T_30 = and(_T_28, _T_29) @[Forwarding.scala 38:104]
    node _T_31 = not(_T_30) @[Forwarding.scala 38:13]
    node _T_32 = and(_T_23, _T_31) @[Forwarding.scala 37:136]
    node _T_33 = eq(io_MEMWB_regWr, UInt<1>("h1")) @[Forwarding.scala 42:32]
    node _T_34 = neq(io_MEMWB_rd, UInt<1>("h0")) @[Forwarding.scala 42:60]
    node _T_35 = and(_T_33, _T_34) @[Forwarding.scala 42:44]
    node _T_36 = eq(io_MEMWB_rd, io_IDEX_rs2) @[Forwarding.scala 42:92]
    node _T_37 = and(_T_35, _T_36) @[Forwarding.scala 42:76]
    node _T_38 = eq(io_EXMEM_regWr, UInt<1>("h1")) @[Forwarding.scala 43:30]
    node _T_39 = neq(io_EXMEM_rd, UInt<1>("h0")) @[Forwarding.scala 43:56]
    node _T_40 = and(_T_38, _T_39) @[Forwarding.scala 43:41]
    node _T_41 = eq(io_EXMEM_rd, io_IDEX_rs2) @[Forwarding.scala 43:87]
    node _T_42 = and(_T_40, _T_41) @[Forwarding.scala 43:71]
    node _T_43 = not(_T_42) @[Forwarding.scala 43:13]
    node _T_44 = and(_T_37, _T_43) @[Forwarding.scala 42:109]
    node _T_45 = eq(io_MEMWB_regWr, UInt<1>("h1")) @[Forwarding.scala 46:32]
    node _T_46 = neq(io_MEMWB_rd, UInt<1>("h0")) @[Forwarding.scala 46:60]
    node _T_47 = and(_T_45, _T_46) @[Forwarding.scala 46:44]
    node _T_48 = eq(io_MEMWB_rd, io_IDEX_rs1) @[Forwarding.scala 46:92]
    node _T_49 = and(_T_47, _T_48) @[Forwarding.scala 46:76]
    node _T_50 = eq(io_EXMEM_regWr, UInt<1>("h1")) @[Forwarding.scala 47:30]
    node _T_51 = neq(io_EXMEM_rd, UInt<1>("h0")) @[Forwarding.scala 47:56]
    node _T_52 = and(_T_50, _T_51) @[Forwarding.scala 47:41]
    node _T_53 = eq(io_EXMEM_rd, io_IDEX_rs1) @[Forwarding.scala 47:87]
    node _T_54 = and(_T_52, _T_53) @[Forwarding.scala 47:71]
    node _T_55 = not(_T_54) @[Forwarding.scala 47:13]
    node _T_56 = and(_T_49, _T_55) @[Forwarding.scala 46:109]
    node _GEN_5 = mux(_T_56, UInt<1>("h1"), _GEN_3) @[Forwarding.scala 47:105 Forwarding.scala 48:22]
    node _GEN_6 = mux(_T_44, UInt<1>("h1"), _GEN_4) @[Forwarding.scala 43:105 Forwarding.scala 44:22]
    node _GEN_7 = mux(_T_44, _GEN_3, _GEN_5) @[Forwarding.scala 43:105]
    node _GEN_8 = mux(_T_32, UInt<1>("h1"), _GEN_7) @[Forwarding.scala 38:139 Forwarding.scala 39:22]
    node _GEN_9 = mux(_T_32, UInt<1>("h1"), _GEN_6) @[Forwarding.scala 38:139 Forwarding.scala 40:22]
    io_forward_a <= _GEN_8
    io_forward_b <= _GEN_9

  module HazardDetection :
    input clock : Clock
    input reset : UInt<1>
    input io_IF_ID_inst : UInt<32>
    input io_ID_EX_memRead : UInt<1>
    input io_ID_EX_rd : UInt<5>
    input io_pc_in : SInt<32>
    input io_current_pc : SInt<32>
    output io_inst_forward : UInt<1>
    output io_pc_forward : UInt<1>
    output io_ctrl_forward : UInt<1>
    output io_inst_out : UInt<32>
    output io_pc_out : SInt<32>
    output io_current_pc_out : SInt<32>

    node Rs1 = bits(io_IF_ID_inst, 19, 15) @[HazardDetectionUnit.scala 21:26]
    node Rs2 = bits(io_IF_ID_inst, 24, 20) @[HazardDetectionUnit.scala 22:26]
    node _T = eq(io_ID_EX_memRead, UInt<1>("h1")) @[HazardDetectionUnit.scala 24:25]
    node _T_1 = eq(io_ID_EX_rd, Rs1) @[HazardDetectionUnit.scala 24:50]
    node _T_2 = eq(io_ID_EX_rd, Rs2) @[HazardDetectionUnit.scala 24:75]
    node _T_3 = or(_T_1, _T_2) @[HazardDetectionUnit.scala 24:59]
    node _T_4 = and(_T, _T_3) @[HazardDetectionUnit.scala 24:33]
    node _GEN_0 = mux(_T_4, UInt<1>("h1"), UInt<1>("h0")) @[HazardDetectionUnit.scala 24:86 HazardDetectionUnit.scala 25:21 HazardDetectionUnit.scala 29:21]
    io_inst_forward <= _GEN_0
    io_pc_forward <= _GEN_0
    io_ctrl_forward <= _GEN_0
    io_inst_out <= io_IF_ID_inst @[HazardDetectionUnit.scala 33:15]
    io_pc_out <= io_pc_in @[HazardDetectionUnit.scala 34:13]
    io_current_pc_out <= io_current_pc @[HazardDetectionUnit.scala 35:21]

  module BranchForward :
    input clock : Clock
    input reset : UInt<1>
    input io_ID_EX_RD : UInt<5>
    input io_EX_MEM_RD : UInt<5>
    input io_MEM_WB_RD : UInt<5>
    input io_ID_EX_memRd : UInt<1>
    input io_EX_MEM_memRd : UInt<1>
    input io_MEM_WB_memRd : UInt<1>
    input io_rs1 : UInt<5>
    input io_rs2 : UInt<5>
    input io_ctrl_branch : UInt<1>
    output io_forward_rs1 : UInt<4>
    output io_forward_rs2 : UInt<4>

    node _T = eq(io_ctrl_branch, UInt<1>("h1")) @[BranchForward.scala 26:23]
    node _T_1 = neq(io_ID_EX_RD, UInt<1>("h0")) @[BranchForward.scala 28:22]
    node _T_2 = neq(io_ID_EX_memRd, UInt<1>("h1")) @[BranchForward.scala 28:48]
    node _T_3 = and(_T_1, _T_2) @[BranchForward.scala 28:30]
    node _T_4 = eq(io_ID_EX_RD, io_rs1) @[BranchForward.scala 29:24]
    node _T_5 = eq(io_ID_EX_RD, io_rs2) @[BranchForward.scala 29:50]
    node _T_6 = and(_T_4, _T_5) @[BranchForward.scala 29:35]
    node _T_7 = eq(io_ID_EX_RD, io_rs1) @[BranchForward.scala 32:30]
    node _T_8 = eq(io_ID_EX_RD, io_rs2) @[BranchForward.scala 34:30]
    node _GEN_0 = mux(_T_8, UInt<1>("h1"), UInt<1>("h0")) @[BranchForward.scala 34:42 BranchForward.scala 35:24 BranchForward.scala 23:18]
    node _GEN_1 = mux(_T_7, UInt<1>("h1"), UInt<1>("h0")) @[BranchForward.scala 32:42 BranchForward.scala 33:24 BranchForward.scala 22:18]
    node _GEN_2 = mux(_T_7, UInt<1>("h0"), _GEN_0) @[BranchForward.scala 32:42 BranchForward.scala 23:18]
    node _GEN_3 = mux(_T_6, UInt<1>("h1"), _GEN_1) @[BranchForward.scala 29:62 BranchForward.scala 30:24]
    node _GEN_4 = mux(_T_6, UInt<1>("h1"), _GEN_2) @[BranchForward.scala 29:62 BranchForward.scala 31:24]
    node _GEN_5 = mux(_T_3, _GEN_3, UInt<1>("h0")) @[BranchForward.scala 28:57 BranchForward.scala 22:18]
    node _GEN_6 = mux(_T_3, _GEN_4, UInt<1>("h0")) @[BranchForward.scala 28:57 BranchForward.scala 23:18]
    node _T_9 = neq(io_EX_MEM_RD, UInt<1>("h0")) @[BranchForward.scala 40:23]
    node _T_10 = neq(io_EX_MEM_memRd, UInt<1>("h1")) @[BranchForward.scala 40:50]
    node _T_11 = and(_T_9, _T_10) @[BranchForward.scala 40:31]
    node _T_12 = eq(io_EX_MEM_RD, io_rs1) @[BranchForward.scala 41:25]
    node _T_13 = eq(io_EX_MEM_RD, io_rs2) @[BranchForward.scala 41:52]
    node _T_14 = and(_T_12, _T_13) @[BranchForward.scala 41:36]
    node _T_15 = neq(io_ID_EX_RD, UInt<1>("h0")) @[BranchForward.scala 41:80]
    node _T_16 = eq(io_ID_EX_RD, io_rs1) @[BranchForward.scala 41:103]
    node _T_17 = and(_T_15, _T_16) @[BranchForward.scala 41:88]
    node _T_18 = eq(io_ID_EX_RD, io_rs2) @[BranchForward.scala 41:129]
    node _T_19 = and(_T_17, _T_18) @[BranchForward.scala 41:114]
    node _T_20 = eq(_T_19, UInt<1>("h0")) @[BranchForward.scala 41:66]
    node _T_21 = and(_T_14, _T_20) @[BranchForward.scala 41:63]
    node _T_22 = eq(io_EX_MEM_RD, io_rs1) @[BranchForward.scala 44:31]
    node _T_23 = neq(io_ID_EX_RD, UInt<1>("h0")) @[BranchForward.scala 44:59]
    node _T_24 = eq(io_ID_EX_RD, io_rs1) @[BranchForward.scala 44:82]
    node _T_25 = and(_T_23, _T_24) @[BranchForward.scala 44:67]
    node _T_26 = eq(_T_25, UInt<1>("h0")) @[BranchForward.scala 44:45]
    node _T_27 = and(_T_22, _T_26) @[BranchForward.scala 44:42]
    node _T_28 = eq(io_EX_MEM_RD, io_rs2) @[BranchForward.scala 46:31]
    node _T_29 = neq(io_ID_EX_RD, UInt<1>("h0")) @[BranchForward.scala 46:59]
    node _T_30 = eq(io_ID_EX_RD, io_rs2) @[BranchForward.scala 46:82]
    node _T_31 = and(_T_29, _T_30) @[BranchForward.scala 46:67]
    node _T_32 = eq(_T_31, UInt<1>("h0")) @[BranchForward.scala 46:45]
    node _T_33 = and(_T_28, _T_32) @[BranchForward.scala 46:42]
    node _GEN_7 = mux(_T_33, UInt<2>("h2"), _GEN_6) @[BranchForward.scala 46:95 BranchForward.scala 47:24]
    node _GEN_8 = mux(_T_27, UInt<2>("h2"), _GEN_5) @[BranchForward.scala 44:95 BranchForward.scala 45:24]
    node _GEN_9 = mux(_T_27, _GEN_6, _GEN_7) @[BranchForward.scala 44:95]
    node _GEN_10 = mux(_T_21, UInt<2>("h2"), _GEN_8) @[BranchForward.scala 41:142 BranchForward.scala 42:24]
    node _GEN_11 = mux(_T_21, UInt<2>("h2"), _GEN_9) @[BranchForward.scala 41:142 BranchForward.scala 43:24]
    node _GEN_12 = mux(_T_11, _GEN_10, _GEN_5) @[BranchForward.scala 40:59]
    node _GEN_13 = mux(_T_11, _GEN_11, _GEN_6) @[BranchForward.scala 40:59]
    node _T_34 = neq(io_MEM_WB_RD, UInt<1>("h0")) @[BranchForward.scala 52:23]
    node _T_35 = neq(io_MEM_WB_memRd, UInt<1>("h1")) @[BranchForward.scala 52:50]
    node _T_36 = and(_T_34, _T_35) @[BranchForward.scala 52:31]
    node _T_37 = eq(io_MEM_WB_RD, io_rs1) @[BranchForward.scala 53:25]
    node _T_38 = eq(io_MEM_WB_RD, io_rs2) @[BranchForward.scala 53:52]
    node _T_39 = and(_T_37, _T_38) @[BranchForward.scala 53:36]
    node _T_40 = neq(io_ID_EX_RD, UInt<1>("h0")) @[BranchForward.scala 53:80]
    node _T_41 = eq(io_ID_EX_RD, io_rs1) @[BranchForward.scala 53:103]
    node _T_42 = and(_T_40, _T_41) @[BranchForward.scala 53:88]
    node _T_43 = eq(io_ID_EX_RD, io_rs2) @[BranchForward.scala 53:129]
    node _T_44 = and(_T_42, _T_43) @[BranchForward.scala 53:114]
    node _T_45 = eq(_T_44, UInt<1>("h0")) @[BranchForward.scala 53:66]
    node _T_46 = and(_T_39, _T_45) @[BranchForward.scala 53:63]
    node _T_47 = neq(io_EX_MEM_RD, UInt<1>("h0")) @[BranchForward.scala 53:159]
    node _T_48 = eq(io_EX_MEM_RD, io_rs1) @[BranchForward.scala 53:183]
    node _T_49 = and(_T_47, _T_48) @[BranchForward.scala 53:167]
    node _T_50 = eq(io_EX_MEM_RD, io_rs2) @[BranchForward.scala 53:210]
    node _T_51 = and(_T_49, _T_50) @[BranchForward.scala 53:194]
    node _T_52 = eq(_T_51, UInt<1>("h0")) @[BranchForward.scala 53:144]
    node _T_53 = and(_T_46, _T_52) @[BranchForward.scala 53:141]
    node _T_54 = eq(io_MEM_WB_RD, io_rs1) @[BranchForward.scala 56:31]
    node _T_55 = neq(io_ID_EX_RD, UInt<1>("h0")) @[BranchForward.scala 56:59]
    node _T_56 = eq(io_ID_EX_RD, io_rs1) @[BranchForward.scala 56:82]
    node _T_57 = and(_T_55, _T_56) @[BranchForward.scala 56:67]
    node _T_58 = eq(_T_57, UInt<1>("h0")) @[BranchForward.scala 56:45]
    node _T_59 = and(_T_54, _T_58) @[BranchForward.scala 56:42]
    node _T_60 = neq(io_EX_MEM_RD, UInt<1>("h0")) @[BranchForward.scala 56:112]
    node _T_61 = eq(io_EX_MEM_RD, io_rs1) @[BranchForward.scala 56:136]
    node _T_62 = and(_T_60, _T_61) @[BranchForward.scala 56:120]
    node _T_63 = eq(_T_62, UInt<1>("h0")) @[BranchForward.scala 56:97]
    node _T_64 = and(_T_59, _T_63) @[BranchForward.scala 56:94]
    node _T_65 = eq(io_MEM_WB_RD, io_rs2) @[BranchForward.scala 58:31]
    node _T_66 = neq(io_ID_EX_RD, UInt<1>("h0")) @[BranchForward.scala 58:59]
    node _T_67 = eq(io_ID_EX_RD, io_rs2) @[BranchForward.scala 58:82]
    node _T_68 = and(_T_66, _T_67) @[BranchForward.scala 58:67]
    node _T_69 = eq(_T_68, UInt<1>("h0")) @[BranchForward.scala 58:45]
    node _T_70 = and(_T_65, _T_69) @[BranchForward.scala 58:42]
    node _T_71 = neq(io_EX_MEM_RD, UInt<1>("h0")) @[BranchForward.scala 58:112]
    node _T_72 = eq(io_EX_MEM_RD, io_rs2) @[BranchForward.scala 58:136]
    node _T_73 = and(_T_71, _T_72) @[BranchForward.scala 58:120]
    node _T_74 = eq(_T_73, UInt<1>("h0")) @[BranchForward.scala 58:97]
    node _T_75 = and(_T_70, _T_74) @[BranchForward.scala 58:94]
    node _GEN_14 = mux(_T_75, UInt<2>("h3"), _GEN_13) @[BranchForward.scala 58:149 BranchForward.scala 59:24]
    node _GEN_15 = mux(_T_64, UInt<2>("h3"), _GEN_12) @[BranchForward.scala 56:149 BranchForward.scala 57:24]
    node _GEN_16 = mux(_T_64, _GEN_13, _GEN_14) @[BranchForward.scala 56:149]
    node _GEN_17 = mux(_T_53, UInt<2>("h3"), _GEN_15) @[BranchForward.scala 53:223 BranchForward.scala 54:24]
    node _GEN_18 = mux(_T_53, UInt<2>("h3"), _GEN_16) @[BranchForward.scala 53:223 BranchForward.scala 55:24]
    node _GEN_19 = mux(_T_36, _GEN_17, _GEN_12) @[BranchForward.scala 52:59]
    node _GEN_20 = mux(_T_36, _GEN_18, _GEN_13) @[BranchForward.scala 52:59]
    node _T_76 = eq(io_ctrl_branch, UInt<1>("h0")) @[BranchForward.scala 64:29]
    node _T_77 = neq(io_ID_EX_RD, UInt<1>("h0")) @[BranchForward.scala 65:22]
    node _T_78 = neq(io_ID_EX_memRd, UInt<1>("h1")) @[BranchForward.scala 65:48]
    node _T_79 = and(_T_77, _T_78) @[BranchForward.scala 65:30]
    node _T_80 = eq(io_ID_EX_RD, io_rs1) @[BranchForward.scala 65:71]
    node _T_81 = and(_T_79, _T_80) @[BranchForward.scala 65:56]
    node _T_82 = neq(io_EX_MEM_RD, UInt<1>("h0")) @[BranchForward.scala 67:29]
    node _T_83 = neq(io_EX_MEM_memRd, UInt<1>("h1")) @[BranchForward.scala 67:56]
    node _T_84 = and(_T_82, _T_83) @[BranchForward.scala 67:37]
    node _T_85 = eq(io_EX_MEM_RD, io_rs1) @[BranchForward.scala 67:80]
    node _T_86 = and(_T_84, _T_85) @[BranchForward.scala 67:64]
    node _T_87 = neq(io_ID_EX_RD, UInt<1>("h0")) @[BranchForward.scala 67:108]
    node _T_88 = eq(io_ID_EX_RD, io_rs1) @[BranchForward.scala 67:131]
    node _T_89 = and(_T_87, _T_88) @[BranchForward.scala 67:116]
    node _T_90 = eq(_T_89, UInt<1>("h0")) @[BranchForward.scala 67:94]
    node _T_91 = and(_T_86, _T_90) @[BranchForward.scala 67:91]
    node _T_92 = neq(io_EX_MEM_RD, UInt<1>("h0")) @[BranchForward.scala 69:29]
    node _T_93 = eq(io_EX_MEM_memRd, UInt<1>("h1")) @[BranchForward.scala 69:56]
    node _T_94 = and(_T_92, _T_93) @[BranchForward.scala 69:37]
    node _T_95 = eq(io_EX_MEM_RD, io_rs1) @[BranchForward.scala 69:80]
    node _T_96 = and(_T_94, _T_95) @[BranchForward.scala 69:64]
    node _T_97 = neq(io_ID_EX_RD, UInt<1>("h0")) @[BranchForward.scala 69:108]
    node _T_98 = eq(io_ID_EX_RD, io_rs1) @[BranchForward.scala 69:131]
    node _T_99 = and(_T_97, _T_98) @[BranchForward.scala 69:116]
    node _T_100 = eq(_T_99, UInt<1>("h0")) @[BranchForward.scala 69:94]
    node _T_101 = and(_T_96, _T_100) @[BranchForward.scala 69:91]
    node _T_102 = neq(io_MEM_WB_RD, UInt<1>("h0")) @[BranchForward.scala 71:29]
    node _T_103 = neq(io_MEM_WB_memRd, UInt<1>("h1")) @[BranchForward.scala 71:56]
    node _T_104 = and(_T_102, _T_103) @[BranchForward.scala 71:37]
    node _T_105 = eq(io_MEM_WB_RD, io_rs1) @[BranchForward.scala 71:80]
    node _T_106 = and(_T_104, _T_105) @[BranchForward.scala 71:64]
    node _T_107 = neq(io_ID_EX_RD, UInt<1>("h0")) @[BranchForward.scala 71:108]
    node _T_108 = eq(io_ID_EX_RD, io_rs1) @[BranchForward.scala 71:131]
    node _T_109 = and(_T_107, _T_108) @[BranchForward.scala 71:116]
    node _T_110 = eq(_T_109, UInt<1>("h0")) @[BranchForward.scala 71:94]
    node _T_111 = and(_T_106, _T_110) @[BranchForward.scala 71:91]
    node _T_112 = neq(io_EX_MEM_RD, UInt<1>("h0")) @[BranchForward.scala 71:161]
    node _T_113 = eq(io_EX_MEM_RD, io_rs1) @[BranchForward.scala 71:185]
    node _T_114 = and(_T_112, _T_113) @[BranchForward.scala 71:169]
    node _T_115 = eq(_T_114, UInt<1>("h0")) @[BranchForward.scala 71:146]
    node _T_116 = and(_T_111, _T_115) @[BranchForward.scala 71:143]
    node _T_117 = neq(io_MEM_WB_RD, UInt<1>("h0")) @[BranchForward.scala 73:29]
    node _T_118 = eq(io_MEM_WB_memRd, UInt<1>("h1")) @[BranchForward.scala 73:56]
    node _T_119 = and(_T_117, _T_118) @[BranchForward.scala 73:37]
    node _T_120 = eq(io_MEM_WB_RD, io_rs1) @[BranchForward.scala 73:80]
    node _T_121 = and(_T_119, _T_120) @[BranchForward.scala 73:64]
    node _T_122 = neq(io_ID_EX_RD, UInt<1>("h0")) @[BranchForward.scala 73:108]
    node _T_123 = eq(io_ID_EX_RD, io_rs1) @[BranchForward.scala 73:131]
    node _T_124 = and(_T_122, _T_123) @[BranchForward.scala 73:116]
    node _T_125 = eq(_T_124, UInt<1>("h0")) @[BranchForward.scala 73:94]
    node _T_126 = and(_T_121, _T_125) @[BranchForward.scala 73:91]
    node _T_127 = neq(io_EX_MEM_RD, UInt<1>("h0")) @[BranchForward.scala 73:161]
    node _T_128 = eq(io_EX_MEM_RD, io_rs1) @[BranchForward.scala 73:185]
    node _T_129 = and(_T_127, _T_128) @[BranchForward.scala 73:169]
    node _T_130 = eq(_T_129, UInt<1>("h0")) @[BranchForward.scala 73:146]
    node _T_131 = and(_T_126, _T_130) @[BranchForward.scala 73:143]
    node _GEN_21 = mux(_T_131, UInt<4>("ha"), UInt<1>("h0")) @[BranchForward.scala 73:198 BranchForward.scala 74:22 BranchForward.scala 22:18]
    node _GEN_22 = mux(_T_116, UInt<4>("h8"), _GEN_21) @[BranchForward.scala 71:198 BranchForward.scala 72:22]
    node _GEN_23 = mux(_T_101, UInt<4>("h9"), _GEN_22) @[BranchForward.scala 69:144 BranchForward.scala 70:22]
    node _GEN_24 = mux(_T_91, UInt<3>("h7"), _GEN_23) @[BranchForward.scala 67:144 BranchForward.scala 68:22]
    node _GEN_25 = mux(_T_81, UInt<3>("h6"), _GEN_24) @[BranchForward.scala 65:83 BranchForward.scala 66:22]
    node _GEN_26 = mux(_T_76, _GEN_25, UInt<1>("h0")) @[BranchForward.scala 64:38 BranchForward.scala 22:18]
    node _GEN_27 = mux(_T, _GEN_19, _GEN_26) @[BranchForward.scala 26:32]
    node _GEN_28 = mux(_T, _GEN_20, UInt<1>("h0")) @[BranchForward.scala 26:32 BranchForward.scala 23:18]
    io_forward_rs1 <= _GEN_27
    io_forward_rs2 <= _GEN_28

  module StructuralHazard :
    input clock : Clock
    input reset : UInt<1>
    input io_rs1 : UInt<5>
    input io_rs2 : UInt<5>
    input io_MEM_WB_regWr : UInt<1>
    input io_MEM_WB_Rd : UInt<5>
    output io_fwd_rs1 : UInt<1>
    output io_fwd_rs2 : UInt<1>

    node _T = eq(io_MEM_WB_Rd, io_rs1) @[StructuralHazard.scala 17:40]
    node _T_1 = and(io_MEM_WB_regWr, _T) @[StructuralHazard.scala 17:24]
    node _GEN_0 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[StructuralHazard.scala 17:52 StructuralHazard.scala 18:16 StructuralHazard.scala 20:16]
    node _T_2 = eq(io_MEM_WB_Rd, io_rs2) @[StructuralHazard.scala 24:40]
    node _T_3 = and(io_MEM_WB_regWr, _T_2) @[StructuralHazard.scala 24:24]
    node _GEN_1 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[StructuralHazard.scala 24:52 StructuralHazard.scala 25:16 StructuralHazard.scala 27:16]
    io_fwd_rs1 <= _GEN_0
    io_fwd_rs2 <= _GEN_1

  module core :
    input clock : Clock
    input reset : UInt<1>
    output io_out : SInt<4>

    inst IF_ID_ of IF_ID @[core.scala 9:26]
    inst ID_EX_ of ID_EX @[core.scala 10:26]
    inst EX_MEM_M of EX_MEM @[core.scala 11:28]
    inst MEM_WB_M of MEM_WB @[core.scala 12:28]
    inst PC of PC @[core.scala 15:22]
    inst PC4 of PC4 @[core.scala 16:24]
    inst InstMemory of InstMem @[core.scala 19:30]
    inst DataMemory of Datamem @[core.scala 20:30]
    inst control_module of Control @[core.scala 23:33]
    inst ImmGen of ImmGenerator @[core.scala 24:27]
    inst RegFile of RegisterFile @[core.scala 25:27]
    inst ALU_Control of AluControl @[core.scala 26:32]
    inst ALU of ALU @[core.scala 28:24]
    inst Branch_M of Branch @[core.scala 30:29]
    inst JALR of Jalr @[core.scala 31:26]
    inst Forwarding of Forwarding @[core.scala 34:30]
    inst HazardDetect of HazardDetection @[core.scala 35:32]
    inst Branch_Forward of BranchForward @[core.scala 36:35]
    inst Structural of StructuralHazard @[core.scala 37:30]
    node _T = eq(HazardDetect.io_pc_forward, UInt<1>("h0")) @[core.scala 40:38]
    node _PC_F_T = asSInt(PC4.io_out) @[core.scala 41:26]
    node _T_1 = eq(HazardDetect.io_pc_forward, UInt<1>("h1")) @[core.scala 42:45]
    node _GEN_0 = mux(_T_1, HazardDetect.io_pc_out, asSInt(UInt<1>("h0"))) @[core.scala 42:54 core.scala 43:12 core.scala 45:12]
    node _GEN_1 = mux(_T, _PC_F_T, _GEN_0) @[core.scala 40:47 core.scala 41:12]
    node _PC4_io_pc_T = asUInt(PC.io_out) @[core.scala 49:28]
    node _InstMemory_io_addr_T = asUInt(PC.io_out) @[core.scala 50:37]
    node _T_2 = eq(HazardDetect.io_inst_forward, UInt<1>("h0")) @[core.scala 53:40]
    node _T_3 = eq(HazardDetect.io_inst_forward, UInt<1>("h1")) @[core.scala 55:47]
    node _GEN_2 = mux(_T_3, HazardDetect.io_current_pc_out, asSInt(UInt<1>("h0"))) @[core.scala 55:56 core.scala 56:14 core.scala 58:14]
    node _GEN_3 = mux(_T_2, PC.io_out, _GEN_2) @[core.scala 53:49 core.scala 54:14]
    node _T_4 = eq(HazardDetect.io_inst_forward, UInt<1>("h0")) @[core.scala 62:40]
    node _T_5 = eq(HazardDetect.io_inst_forward, UInt<1>("h1")) @[core.scala 64:47]
    node _GEN_4 = mux(_T_5, HazardDetect.io_inst_out, UInt<1>("h0")) @[core.scala 64:56 core.scala 65:21 core.scala 67:21]
    node _GEN_5 = mux(_T_4, InstMemory.io_data, _GEN_4) @[core.scala 62:49 core.scala 63:21]
    node _ImmGen_io_pc_T = asUInt(IF_ID_.io_SelectedPC_out) @[core.scala 78:47]
    node _control_module_io_opcode_T = bits(IF_ID_.io_SelectedInstr_out, 6, 0) @[core.scala 81:60]
    node _T_6 = eq(control_module.io_opcode, UInt<6>("h33")) @[core.scala 83:36]
    node _T_7 = eq(control_module.io_opcode, UInt<5>("h13")) @[core.scala 84:32]
    node _T_8 = or(_T_6, _T_7) @[core.scala 83:45]
    node _T_9 = eq(control_module.io_opcode, UInt<6>("h23")) @[core.scala 85:32]
    node _T_10 = or(_T_8, _T_9) @[core.scala 84:41]
    node _T_11 = eq(control_module.io_opcode, UInt<2>("h3")) @[core.scala 86:32]
    node _T_12 = or(_T_10, _T_11) @[core.scala 85:41]
    node _T_13 = eq(control_module.io_opcode, UInt<7>("h63")) @[core.scala 87:32]
    node _T_14 = or(_T_12, _T_13) @[core.scala 86:40]
    node _T_15 = eq(control_module.io_opcode, UInt<7>("h67")) @[core.scala 88:32]
    node _T_16 = or(_T_14, _T_15) @[core.scala 87:41]
    node _RegFile_io_rs1_T = bits(IF_ID_.io_SelectedInstr_out, 19, 15) @[core.scala 89:52]
    node _GEN_6 = mux(_T_16, _RegFile_io_rs1_T, UInt<1>("h0")) @[core.scala 88:43 core.scala 89:22 core.scala 91:22]
    node _T_17 = eq(control_module.io_opcode, UInt<6>("h33")) @[core.scala 95:36]
    node _T_18 = eq(control_module.io_opcode, UInt<6>("h23")) @[core.scala 96:32]
    node _T_19 = or(_T_17, _T_18) @[core.scala 95:45]
    node _T_20 = eq(control_module.io_opcode, UInt<7>("h63")) @[core.scala 97:32]
    node _T_21 = or(_T_19, _T_20) @[core.scala 96:41]
    node _RegFile_io_rs2_T = bits(IF_ID_.io_SelectedInstr_out, 24, 20) @[core.scala 98:52]
    node _GEN_7 = mux(_T_21, _RegFile_io_rs2_T, UInt<1>("h0")) @[core.scala 97:42 core.scala 98:22 core.scala 100:22]
    node _T_22 = eq(control_module.io_extend, UInt<1>("h0")) @[core.scala 108:36]
    node _T_23 = eq(control_module.io_extend, UInt<1>("h1")) @[core.scala 110:43]
    node _T_24 = eq(control_module.io_extend, UInt<2>("h2")) @[core.scala 112:43]
    node _GEN_8 = mux(_T_24, ImmGen.io_U_type, asSInt(UInt<1>("h0"))) @[core.scala 112:52 core.scala 113:16 core.scala 115:16]
    node _GEN_9 = mux(_T_23, ImmGen.io_S_type, _GEN_8) @[core.scala 110:52 core.scala 111:16]
    node _GEN_10 = mux(_T_22, ImmGen.io_I_type, _GEN_9) @[core.scala 108:45 core.scala 109:16]
    node _Structural_io_rs1_T = bits(IF_ID_.io_SelectedInstr_out, 19, 15) @[core.scala 119:54]
    node _Structural_io_rs2_T = bits(IF_ID_.io_SelectedInstr_out, 24, 20) @[core.scala 120:55]
    node _T_25 = eq(Structural.io_fwd_rs1, UInt<1>("h0")) @[core.scala 127:33]
    node _T_26 = eq(Structural.io_fwd_rs1, UInt<1>("h1")) @[core.scala 129:39]
    node _GEN_11 = mux(_T_26, RegFile.io_w_data, asSInt(UInt<1>("h0"))) @[core.scala 129:48 core.scala 130:19 core.scala 132:19]
    node _GEN_12 = mux(_T_25, RegFile.io_rdata1, _GEN_11) @[core.scala 127:42 core.scala 128:19]
    node _T_27 = eq(Structural.io_fwd_rs2, UInt<1>("h0")) @[core.scala 135:33]
    node _T_28 = eq(Structural.io_fwd_rs2, UInt<1>("h1")) @[core.scala 137:39]
    node _GEN_13 = mux(_T_28, RegFile.io_w_data, asSInt(UInt<1>("h0"))) @[core.scala 137:48 core.scala 138:19 core.scala 140:19]
    node _GEN_14 = mux(_T_27, RegFile.io_rdata2, _GEN_13) @[core.scala 135:42 core.scala 136:19]
    node _T_29 = eq(HazardDetect.io_ctrl_forward, UInt<1>("h1")) @[core.scala 147:39]
    node _GEN_15 = mux(_T_29, UInt<1>("h0"), control_module.io_mem_write) @[core.scala 147:51 core.scala 148:33 core.scala 157:33]
    node _GEN_16 = mux(_T_29, UInt<1>("h0"), control_module.io_mem_read) @[core.scala 147:51 core.scala 149:34 core.scala 158:33]
    node _GEN_17 = mux(_T_29, UInt<1>("h0"), control_module.io_men_to_reg) @[core.scala 147:51 core.scala 150:36 core.scala 159:38]
    node _GEN_18 = mux(_T_29, UInt<1>("h0"), control_module.io_reg_write) @[core.scala 147:51 core.scala 151:34 core.scala 160:34]
    node _GEN_19 = mux(_T_29, UInt<1>("h0"), control_module.io_alu_operation) @[core.scala 147:51 core.scala 152:34 core.scala 161:34]
    node _GEN_20 = mux(_T_29, UInt<1>("h0"), control_module.io_operand_B) @[core.scala 147:51 core.scala 153:33 core.scala 162:32]
    node _GEN_21 = mux(_T_29, UInt<1>("h0"), control_module.io_branch) @[core.scala 147:51 core.scala 154:36 core.scala 163:34]
    node _GEN_22 = mux(_T_29, UInt<1>("h0"), control_module.io_next_pc_sel) @[core.scala 147:51 core.scala 155:36 core.scala 164:34]
    node _HazardDetect_io_pc_in_T = asSInt(IF_ID_.io_pc4_out) @[core.scala 170:48]
    node _Branch_Forward_io_rs1_T = bits(IF_ID_.io_SelectedInstr_out, 19, 15) @[core.scala 182:57]
    node _Branch_Forward_io_rs2_T = bits(IF_ID_.io_SelectedInstr_out, 24, 20) @[core.scala 183:57]
    node _Branch_M_io_arg_x_T = eq(UInt<1>("h0"), Branch_Forward.io_forward_rs1) @[Mux.scala 80:60]
    node _Branch_M_io_arg_x_T_1 = mux(_Branch_M_io_arg_x_T, RegFile.io_rdata1, asSInt(UInt<1>("h0"))) @[Mux.scala 80:57]
    node _Branch_M_io_arg_x_T_2 = eq(UInt<1>("h1"), Branch_Forward.io_forward_rs1) @[Mux.scala 80:60]
    node _Branch_M_io_arg_x_T_3 = mux(_Branch_M_io_arg_x_T_2, ALU.io_out, _Branch_M_io_arg_x_T_1) @[Mux.scala 80:57]
    node _Branch_M_io_arg_x_T_4 = eq(UInt<2>("h2"), Branch_Forward.io_forward_rs1) @[Mux.scala 80:60]
    node _Branch_M_io_arg_x_T_5 = mux(_Branch_M_io_arg_x_T_4, EX_MEM_M.io_EXMEM_alu_out, _Branch_M_io_arg_x_T_3) @[Mux.scala 80:57]
    node _Branch_M_io_arg_x_T_6 = eq(UInt<2>("h3"), Branch_Forward.io_forward_rs1) @[Mux.scala 80:60]
    node _Branch_M_io_arg_x_T_7 = mux(_Branch_M_io_arg_x_T_6, RegFile.io_w_data, _Branch_M_io_arg_x_T_5) @[Mux.scala 80:57]
    node _Branch_M_io_arg_x_T_8 = eq(UInt<3>("h4"), Branch_Forward.io_forward_rs1) @[Mux.scala 80:60]
    node _Branch_M_io_arg_x_T_9 = mux(_Branch_M_io_arg_x_T_8, DataMemory.io_dataOut, _Branch_M_io_arg_x_T_7) @[Mux.scala 80:57]
    node _Branch_M_io_arg_x_T_10 = eq(UInt<3>("h5"), Branch_Forward.io_forward_rs1) @[Mux.scala 80:60]
    node _Branch_M_io_arg_x_T_11 = mux(_Branch_M_io_arg_x_T_10, RegFile.io_w_data, _Branch_M_io_arg_x_T_9) @[Mux.scala 80:57]
    node _Branch_M_io_arg_x_T_12 = eq(UInt<3>("h6"), Branch_Forward.io_forward_rs1) @[Mux.scala 80:60]
    node _Branch_M_io_arg_x_T_13 = mux(_Branch_M_io_arg_x_T_12, RegFile.io_rdata1, _Branch_M_io_arg_x_T_11) @[Mux.scala 80:57]
    node _Branch_M_io_arg_x_T_14 = eq(UInt<3>("h7"), Branch_Forward.io_forward_rs1) @[Mux.scala 80:60]
    node _Branch_M_io_arg_x_T_15 = mux(_Branch_M_io_arg_x_T_14, RegFile.io_rdata1, _Branch_M_io_arg_x_T_13) @[Mux.scala 80:57]
    node _Branch_M_io_arg_x_T_16 = eq(UInt<4>("h8"), Branch_Forward.io_forward_rs1) @[Mux.scala 80:60]
    node _Branch_M_io_arg_x_T_17 = mux(_Branch_M_io_arg_x_T_16, RegFile.io_rdata1, _Branch_M_io_arg_x_T_15) @[Mux.scala 80:57]
    node _Branch_M_io_arg_x_T_18 = eq(UInt<4>("h9"), Branch_Forward.io_forward_rs1) @[Mux.scala 80:60]
    node _Branch_M_io_arg_x_T_19 = mux(_Branch_M_io_arg_x_T_18, RegFile.io_rdata1, _Branch_M_io_arg_x_T_17) @[Mux.scala 80:57]
    node _Branch_M_io_arg_x_T_20 = eq(UInt<4>("ha"), Branch_Forward.io_forward_rs1) @[Mux.scala 80:60]
    node _Branch_M_io_arg_x_T_21 = mux(_Branch_M_io_arg_x_T_20, RegFile.io_rdata1, _Branch_M_io_arg_x_T_19) @[Mux.scala 80:57]
    node _JALR_io_rdata1_T = asUInt(RegFile.io_rdata1) @[core.scala 201:36]
    node _JALR_io_rdata1_T_1 = asUInt(RegFile.io_rdata1) @[core.scala 202:36]
    node _JALR_io_rdata1_T_2 = asUInt(RegFile.io_rdata1) @[core.scala 203:36]
    node _JALR_io_rdata1_T_3 = asUInt(RegFile.io_rdata1) @[core.scala 204:36]
    node _JALR_io_rdata1_T_4 = asUInt(RegFile.io_rdata1) @[core.scala 205:36]
    node _JALR_io_rdata1_T_5 = asUInt(RegFile.io_rdata1) @[core.scala 206:36]
    node _JALR_io_rdata1_T_6 = asUInt(ALU.io_out) @[core.scala 207:29]
    node _JALR_io_rdata1_T_7 = asUInt(EX_MEM_M.io_EXMEM_alu_out) @[core.scala 208:44]
    node _JALR_io_rdata1_T_8 = asUInt(RegFile.io_w_data) @[core.scala 209:36]
    node _JALR_io_rdata1_T_9 = asUInt(DataMemory.io_dataOut) @[core.scala 210:40]
    node _JALR_io_rdata1_T_10 = asUInt(RegFile.io_w_data) @[core.scala 211:37]
    node _JALR_io_rdata1_T_11 = eq(UInt<1>("h0"), Branch_Forward.io_forward_rs1) @[Mux.scala 80:60]
    node _JALR_io_rdata1_T_12 = mux(_JALR_io_rdata1_T_11, _JALR_io_rdata1_T, UInt<1>("h0")) @[Mux.scala 80:57]
    node _JALR_io_rdata1_T_13 = eq(UInt<1>("h1"), Branch_Forward.io_forward_rs1) @[Mux.scala 80:60]
    node _JALR_io_rdata1_T_14 = mux(_JALR_io_rdata1_T_13, _JALR_io_rdata1_T_1, _JALR_io_rdata1_T_12) @[Mux.scala 80:57]
    node _JALR_io_rdata1_T_15 = eq(UInt<2>("h2"), Branch_Forward.io_forward_rs1) @[Mux.scala 80:60]
    node _JALR_io_rdata1_T_16 = mux(_JALR_io_rdata1_T_15, _JALR_io_rdata1_T_2, _JALR_io_rdata1_T_14) @[Mux.scala 80:57]
    node _JALR_io_rdata1_T_17 = eq(UInt<2>("h3"), Branch_Forward.io_forward_rs1) @[Mux.scala 80:60]
    node _JALR_io_rdata1_T_18 = mux(_JALR_io_rdata1_T_17, _JALR_io_rdata1_T_3, _JALR_io_rdata1_T_16) @[Mux.scala 80:57]
    node _JALR_io_rdata1_T_19 = eq(UInt<3>("h4"), Branch_Forward.io_forward_rs1) @[Mux.scala 80:60]
    node _JALR_io_rdata1_T_20 = mux(_JALR_io_rdata1_T_19, _JALR_io_rdata1_T_4, _JALR_io_rdata1_T_18) @[Mux.scala 80:57]
    node _JALR_io_rdata1_T_21 = eq(UInt<3>("h5"), Branch_Forward.io_forward_rs1) @[Mux.scala 80:60]
    node _JALR_io_rdata1_T_22 = mux(_JALR_io_rdata1_T_21, _JALR_io_rdata1_T_5, _JALR_io_rdata1_T_20) @[Mux.scala 80:57]
    node _JALR_io_rdata1_T_23 = eq(UInt<3>("h6"), Branch_Forward.io_forward_rs1) @[Mux.scala 80:60]
    node _JALR_io_rdata1_T_24 = mux(_JALR_io_rdata1_T_23, _JALR_io_rdata1_T_6, _JALR_io_rdata1_T_22) @[Mux.scala 80:57]
    node _JALR_io_rdata1_T_25 = eq(UInt<3>("h7"), Branch_Forward.io_forward_rs1) @[Mux.scala 80:60]
    node _JALR_io_rdata1_T_26 = mux(_JALR_io_rdata1_T_25, _JALR_io_rdata1_T_7, _JALR_io_rdata1_T_24) @[Mux.scala 80:57]
    node _JALR_io_rdata1_T_27 = eq(UInt<4>("h8"), Branch_Forward.io_forward_rs1) @[Mux.scala 80:60]
    node _JALR_io_rdata1_T_28 = mux(_JALR_io_rdata1_T_27, _JALR_io_rdata1_T_8, _JALR_io_rdata1_T_26) @[Mux.scala 80:57]
    node _JALR_io_rdata1_T_29 = eq(UInt<4>("h9"), Branch_Forward.io_forward_rs1) @[Mux.scala 80:60]
    node _JALR_io_rdata1_T_30 = mux(_JALR_io_rdata1_T_29, _JALR_io_rdata1_T_9, _JALR_io_rdata1_T_28) @[Mux.scala 80:57]
    node _JALR_io_rdata1_T_31 = eq(UInt<4>("ha"), Branch_Forward.io_forward_rs1) @[Mux.scala 80:60]
    node _JALR_io_rdata1_T_32 = mux(_JALR_io_rdata1_T_31, _JALR_io_rdata1_T_10, _JALR_io_rdata1_T_30) @[Mux.scala 80:57]
    node ImmValue = _GEN_10 @[core.scala 106:24]
    node _JALR_io_imme_T = asUInt(ImmValue) @[core.scala 213:30]
    node _Branch_M_io_arg_y_T = eq(UInt<1>("h0"), Branch_Forward.io_forward_rs2) @[Mux.scala 80:60]
    node _Branch_M_io_arg_y_T_1 = mux(_Branch_M_io_arg_y_T, RegFile.io_rdata2, asSInt(UInt<1>("h0"))) @[Mux.scala 80:57]
    node _Branch_M_io_arg_y_T_2 = eq(UInt<1>("h1"), Branch_Forward.io_forward_rs2) @[Mux.scala 80:60]
    node _Branch_M_io_arg_y_T_3 = mux(_Branch_M_io_arg_y_T_2, ALU.io_out, _Branch_M_io_arg_y_T_1) @[Mux.scala 80:57]
    node _Branch_M_io_arg_y_T_4 = eq(UInt<2>("h2"), Branch_Forward.io_forward_rs2) @[Mux.scala 80:60]
    node _Branch_M_io_arg_y_T_5 = mux(_Branch_M_io_arg_y_T_4, EX_MEM_M.io_EXMEM_alu_out, _Branch_M_io_arg_y_T_3) @[Mux.scala 80:57]
    node _Branch_M_io_arg_y_T_6 = eq(UInt<2>("h3"), Branch_Forward.io_forward_rs2) @[Mux.scala 80:60]
    node _Branch_M_io_arg_y_T_7 = mux(_Branch_M_io_arg_y_T_6, RegFile.io_w_data, _Branch_M_io_arg_y_T_5) @[Mux.scala 80:57]
    node _Branch_M_io_arg_y_T_8 = eq(UInt<3>("h4"), Branch_Forward.io_forward_rs2) @[Mux.scala 80:60]
    node _Branch_M_io_arg_y_T_9 = mux(_Branch_M_io_arg_y_T_8, DataMemory.io_dataOut, _Branch_M_io_arg_y_T_7) @[Mux.scala 80:57]
    node _Branch_M_io_arg_y_T_10 = eq(UInt<3>("h5"), Branch_Forward.io_forward_rs2) @[Mux.scala 80:60]
    node _Branch_M_io_arg_y_T_11 = mux(_Branch_M_io_arg_y_T_10, RegFile.io_w_data, _Branch_M_io_arg_y_T_9) @[Mux.scala 80:57]
    node _Branch_M_io_fnct3_T = bits(IF_ID_.io_SelectedInstr_out, 14, 12) @[core.scala 223:53]
    node _T_30 = eq(HazardDetect.io_pc_forward, UInt<1>("h1")) @[core.scala 226:37]
    node _T_31 = eq(control_module.io_next_pc_sel, UInt<1>("h1")) @[core.scala 229:44]
    node _T_32 = eq(Branch_M.io_br_taken, UInt<1>("h1")) @[core.scala 230:39]
    node _T_33 = eq(control_module.io_branch, UInt<1>("h1")) @[core.scala 230:75]
    node _T_34 = and(_T_32, _T_33) @[core.scala 230:47]
    node _PC_io_in_T = asSInt(PC4.io_out) @[core.scala 237:40]
    node _GEN_23 = mux(_T_34, ImmGen.io_SB_type, _PC_io_in_T) @[core.scala 230:84 core.scala 231:26 core.scala 237:26]
    node _GEN_24 = mux(_T_34, asSInt(UInt<1>("h0")), PC.io_out) @[core.scala 230:84 core.scala 232:33 core.scala 71:21]
    node _GEN_25 = mux(_T_34, UInt<1>("h0"), PC4.io_out) @[core.scala 230:84 core.scala 233:34 core.scala 72:23]
    node PC_for = _GEN_3 @[core.scala 52:22]
    node _GEN_26 = mux(_T_34, asSInt(UInt<1>("h0")), PC_for) @[core.scala 230:84 core.scala 234:37 core.scala 73:26]
    node Instruction_F = _GEN_5 @[core.scala 61:29]
    node _GEN_27 = mux(_T_34, UInt<1>("h0"), Instruction_F) @[core.scala 230:84 core.scala 235:41 core.scala 74:29]
    node _T_35 = eq(control_module.io_next_pc_sel, UInt<2>("h2")) @[core.scala 239:50]
    node _T_36 = eq(control_module.io_next_pc_sel, UInt<2>("h3")) @[core.scala 245:50]
    node _PC_io_in_T_1 = asSInt(JALR.io_out) @[core.scala 246:37]
    node _PC_io_in_T_2 = asSInt(PC4.io_out) @[core.scala 252:36]
    node _GEN_28 = mux(_T_36, _PC_io_in_T_1, _PC_io_in_T_2) @[core.scala 245:63 core.scala 246:22 core.scala 252:22]
    node _GEN_29 = mux(_T_36, asSInt(UInt<1>("h0")), PC.io_out) @[core.scala 245:63 core.scala 247:29 core.scala 71:21]
    node _GEN_30 = mux(_T_36, UInt<1>("h0"), PC4.io_out) @[core.scala 245:63 core.scala 248:30 core.scala 72:23]
    node _GEN_31 = mux(_T_36, asSInt(UInt<1>("h0")), PC_for) @[core.scala 245:63 core.scala 249:33 core.scala 73:26]
    node _GEN_32 = mux(_T_36, UInt<1>("h0"), Instruction_F) @[core.scala 245:63 core.scala 250:37 core.scala 74:29]
    node _GEN_33 = mux(_T_35, ImmGen.io_UJ_type, _GEN_28) @[core.scala 239:63 core.scala 240:22]
    node _GEN_34 = mux(_T_35, asSInt(UInt<1>("h0")), _GEN_29) @[core.scala 239:63 core.scala 241:29]
    node _GEN_35 = mux(_T_35, UInt<1>("h0"), _GEN_30) @[core.scala 239:63 core.scala 242:30]
    node _GEN_36 = mux(_T_35, asSInt(UInt<1>("h0")), _GEN_31) @[core.scala 239:63 core.scala 243:33]
    node _GEN_37 = mux(_T_35, UInt<1>("h0"), _GEN_32) @[core.scala 239:63 core.scala 244:37]
    node _GEN_38 = mux(_T_31, _GEN_23, _GEN_33) @[core.scala 229:57]
    node _GEN_39 = mux(_T_31, _GEN_24, _GEN_34) @[core.scala 229:57]
    node _GEN_40 = mux(_T_31, _GEN_25, _GEN_35) @[core.scala 229:57]
    node _GEN_41 = mux(_T_31, _GEN_26, _GEN_36) @[core.scala 229:57]
    node _GEN_42 = mux(_T_31, _GEN_27, _GEN_37) @[core.scala 229:57]
    node _GEN_43 = mux(_T_30, HazardDetect.io_pc_out, _GEN_38) @[core.scala 226:46 core.scala 227:18]
    node _GEN_44 = mux(_T_30, PC.io_out, _GEN_39) @[core.scala 226:46 core.scala 71:21]
    node _GEN_45 = mux(_T_30, PC4.io_out, _GEN_40) @[core.scala 226:46 core.scala 72:23]
    node _GEN_46 = mux(_T_30, PC_for, _GEN_41) @[core.scala 226:46 core.scala 73:26]
    node _GEN_47 = mux(_T_30, Instruction_F, _GEN_42) @[core.scala 226:46 core.scala 74:29]
    node _ID_EX__io_func3_in_T = bits(IF_ID_.io_SelectedInstr_out, 14, 12) @[core.scala 259:63]
    node _ID_EX__io_func7_in_T = bits(IF_ID_.io_SelectedInstr_out, 30, 30) @[core.scala 260:63]
    node _ID_EX__io_rd_in_T = bits(IF_ID_.io_SelectedInstr_out, 11, 7) @[core.scala 261:63]
    node _T_37 = eq(ID_EX_.io_ctrl_OpA_out, UInt<1>("h1")) @[core.scala 282:34]
    node _ALU_io_in_A_T = asSInt(ID_EX_.io_IFID_pc4_out) @[core.scala 283:47]
    node _T_38 = eq(Forwarding.io_forward_a, UInt<1>("h0")) @[core.scala 286:38]
    node _T_39 = eq(Forwarding.io_forward_a, UInt<1>("h1")) @[core.scala 288:44]
    node _T_40 = eq(Forwarding.io_forward_a, UInt<2>("h2")) @[core.scala 290:44]
    node _GEN_48 = mux(_T_40, EX_MEM_M.io_EXMEM_alu_out, ID_EX_.io_rs1_data_out) @[core.scala 290:57 core.scala 291:25 core.scala 293:25]
    node _T_45 = eq(MEM_WB_M.io_MEMWB_memToReg_out, UInt<1>("h0")) @[core.scala 340:42]
    node _T_46 = eq(MEM_WB_M.io_MEMWB_memToReg_out, UInt<1>("h1")) @[core.scala 342:48]
    node _GEN_56 = mux(_T_46, MEM_WB_M.io_MEMWB_dataMem_out, asSInt(UInt<1>("h0"))) @[core.scala 342:57 core.scala 343:9 core.scala 345:9]
    node _GEN_57 = mux(_T_45, MEM_WB_M.io_MEMWB_alu_out, _GEN_56) @[core.scala 340:51 core.scala 341:9]
    node d = _GEN_57 @[core.scala 280:17]
    node _GEN_49 = mux(_T_39, d, _GEN_48) @[core.scala 288:57 core.scala 289:25]
    node _GEN_50 = mux(_T_38, ID_EX_.io_rs1_data_out, _GEN_49) @[core.scala 286:51 core.scala 287:25]
    node _GEN_51 = mux(_T_37, _ALU_io_in_A_T, _GEN_50) @[core.scala 282:47 core.scala 283:21]
    node _T_41 = eq(Forwarding.io_forward_b, UInt<1>("h0")) @[core.scala 298:35]
    node _T_42 = eq(Forwarding.io_forward_b, UInt<1>("h1")) @[core.scala 300:41]
    node _T_43 = eq(Forwarding.io_forward_b, UInt<2>("h2")) @[core.scala 302:41]
    node _GEN_52 = mux(_T_43, EX_MEM_M.io_EXMEM_alu_out, asSInt(UInt<1>("h0"))) @[core.scala 302:50 core.scala 303:17 core.scala 305:17]
    node _GEN_53 = mux(_T_42, d, _GEN_52) @[core.scala 300:50 core.scala 301:17]
    node _GEN_54 = mux(_T_41, ID_EX_.io_rs2_data_out, _GEN_53) @[core.scala 298:44 core.scala 299:17]
    node _T_44 = eq(ID_EX_.io_ctrl_OpB_out, UInt<1>("h0")) @[core.scala 307:34]
    node RS2_value = _GEN_54 @[core.scala 297:25]
    node _GEN_55 = mux(_T_44, RS2_value, ID_EX_.io_imm_out) @[core.scala 307:43 core.scala 308:21 core.scala 310:21]
    node _DataMemory_io_addr_T = asUInt(EX_MEM_M.io_EXMEM_alu_out) @[core.scala 326:66]
    node PC_F = _GEN_1 @[core.scala 39:20]
    node S_rs1DataIn = _GEN_12 @[core.scala 124:27]
    node S_rs2DataIn = _GEN_14 @[core.scala 125:27]
    io_out <= asSInt(UInt<1>("h0")) @[core.scala 349:12]
    IF_ID_.clock <= clock
    IF_ID_.reset <= reset
    IF_ID_.io_pc_in <= _GEN_44
    IF_ID_.io_pc4_in <= _GEN_45
    IF_ID_.io_SelectedPC <= _GEN_46
    IF_ID_.io_SelectedInstr <= _GEN_47
    ID_EX_.clock <= clock
    ID_EX_.reset <= reset
    ID_EX_.io_rs1_in <= RegFile.io_rs1 @[core.scala 256:33]
    ID_EX_.io_rs2_in <= RegFile.io_rs2 @[core.scala 257:33]
    ID_EX_.io_rs1_data_in <= S_rs1DataIn @[core.scala 143:27]
    ID_EX_.io_rs2_data_in <= S_rs2DataIn @[core.scala 144:28]
    ID_EX_.io_imm <= ImmValue @[core.scala 258:33]
    ID_EX_.io_rd_in <= _ID_EX__io_rd_in_T @[core.scala 261:33]
    ID_EX_.io_func3_in <= _ID_EX__io_func3_in_T @[core.scala 259:33]
    ID_EX_.io_func7_in <= _ID_EX__io_func7_in_T @[core.scala 260:33]
    ID_EX_.io_ctrl_MemWr_in <= _GEN_15
    ID_EX_.io_ctrl_Branch_in <= _GEN_21
    ID_EX_.io_ctrl_MemRd_in <= _GEN_16
    ID_EX_.io_ctrl_Reg_W_in <= _GEN_18
    ID_EX_.io_ctrl_MemToReg_in <= _GEN_17
    ID_EX_.io_ctrl_AluOp_in <= _GEN_19
    ID_EX_.io_ctrl_OpA_in <= control_module.io_operand_A @[core.scala 277:27]
    ID_EX_.io_ctrl_OpB_in <= _GEN_20
    ID_EX_.io_ctrl_nextpc_in <= _GEN_22
    ID_EX_.io_IFID_pc4_in <= IF_ID_.io_pc4_out @[core.scala 278:27]
    EX_MEM_M.clock <= clock
    EX_MEM_M.reset <= reset
    EX_MEM_M.io_IDEX_MEMRD <= ID_EX_.io_ctrl_MemRd_out @[core.scala 314:37]
    EX_MEM_M.io_IDEX_MEMWR <= ID_EX_.io_ctrl_MemWr_out @[core.scala 315:37]
    EX_MEM_M.io_IDEX_MEMTOREG <= ID_EX_.io_ctrl_MemToReg_out @[core.scala 316:37]
    EX_MEM_M.io_IDEX_REG_W <= ID_EX_.io_ctrl_Reg_W_out @[core.scala 317:37]
    EX_MEM_M.io_IDEX_rs2 <= RS2_value @[core.scala 318:37]
    EX_MEM_M.io_IDEX_rd <= ID_EX_.io_rd_out @[core.scala 267:37]
    EX_MEM_M.io_alu_out <= ALU.io_out @[core.scala 319:37]
    EX_MEM_M.io_fun3in <= ID_EX_.io_func3_out @[core.scala 320:23]
    MEM_WB_M.clock <= clock
    MEM_WB_M.reset <= reset
    MEM_WB_M.io_EXMEM_MEMTOREG <= EX_MEM_M.io_EXMEM_memToReg_out @[core.scala 329:37]
    MEM_WB_M.io_EXMEM_REG_W <= EX_MEM_M.io_EXMEM_reg_w_out @[core.scala 330:37]
    MEM_WB_M.io_EXMEM_MEMRD <= EX_MEM_M.io_EXMEM_memRd_out @[core.scala 173:29]
    MEM_WB_M.io_EXMEM_rd <= EX_MEM_M.io_EXMEM_rd_out @[core.scala 331:37]
    MEM_WB_M.io_in_dataMem_out <= DataMemory.io_dataOut @[core.scala 332:37]
    MEM_WB_M.io_in_alu_out <= EX_MEM_M.io_EXMEM_alu_out @[core.scala 333:37]
    PC.clock <= clock
    PC.reset <= reset
    PC.io_in <= _GEN_43
    PC4.clock <= clock
    PC4.reset <= reset
    PC4.io_pc <= _PC4_io_pc_T @[core.scala 49:15]
    InstMemory.clock <= clock
    InstMemory.reset <= reset
    InstMemory.io_addr <= _InstMemory_io_addr_T @[core.scala 50:24]
    DataMemory.clock <= clock
    DataMemory.reset <= reset
    DataMemory.io_mem_write <= EX_MEM_M.io_EXMEM_memWr_out @[core.scala 324:37]
    DataMemory.io_addr <= _DataMemory_io_addr_T @[core.scala 326:37]
    DataMemory.io_dataIn <= EX_MEM_M.io_EXMEM_rs2_out @[core.scala 325:37]
    DataMemory.io_fun3 <= EX_MEM_M.io_fun3out @[core.scala 327:24]
    DataMemory.io_mem_read <= EX_MEM_M.io_EXMEM_memRd_out @[core.scala 323:37]
    control_module.clock <= clock
    control_module.reset <= reset
    control_module.io_opcode <= _control_module_io_opcode_T @[core.scala 81:30]
    ImmGen.clock <= clock
    ImmGen.reset <= reset
    ImmGen.io_instr <= IF_ID_.io_SelectedInstr_out @[core.scala 77:21]
    ImmGen.io_pc <= _ImmGen_io_pc_T @[core.scala 78:19]
    RegFile.clock <= clock
    RegFile.reset <= reset
    RegFile.io_rs1 <= _GEN_6
    RegFile.io_rs2 <= _GEN_7
    RegFile.io_reg_write <= MEM_WB_M.io_MEMWB_reg_w_out @[core.scala 337:37]
    RegFile.io_w_reg <= MEM_WB_M.io_MEMWB_rd_out @[core.scala 336:37]
    RegFile.io_w_data <= d @[core.scala 347:23]
    ALU_Control.clock <= clock
    ALU_Control.reset <= reset
    ALU_Control.io_func3 <= ID_EX_.io_func3_out @[core.scala 265:37]
    ALU_Control.io_func7 <= ID_EX_.io_func7_out @[core.scala 266:37]
    ALU_Control.io_aluOp <= ID_EX_.io_ctrl_AluOp_out @[core.scala 263:37]
    ALU.clock <= clock
    ALU.reset <= reset
    ALU.io_in_A <= _GEN_51
    ALU.io_in_B <= _GEN_55
    ALU.io_alu_Op <= ALU_Control.io_out @[core.scala 264:37]
    Branch_M.clock <= clock
    Branch_M.reset <= reset
    Branch_M.io_fnct3 <= _Branch_M_io_fnct3_T @[core.scala 223:23]
    Branch_M.io_branch <= control_module.io_branch @[core.scala 224:24]
    Branch_M.io_arg_x <= _Branch_M_io_arg_x_T_21 @[core.scala 186:23]
    Branch_M.io_arg_y <= _Branch_M_io_arg_y_T_11 @[core.scala 215:23]
    JALR.clock <= clock
    JALR.reset <= reset
    JALR.io_imme <= _JALR_io_imme_T @[core.scala 213:18]
    JALR.io_rdata1 <= _JALR_io_rdata1_T_32 @[core.scala 200:20]
    Forwarding.clock <= clock
    Forwarding.reset <= reset
    Forwarding.io_IDEX_rs1 <= ID_EX_.io_rs1_out @[core.scala 270:35]
    Forwarding.io_IDEX_rs2 <= ID_EX_.io_rs2_out @[core.scala 271:35]
    Forwarding.io_EXMEM_rd <= EX_MEM_M.io_EXMEM_rd_out @[core.scala 272:35]
    Forwarding.io_EXMEM_regWr <= EX_MEM_M.io_EXMEM_reg_w_out @[core.scala 273:35]
    Forwarding.io_MEMWB_rd <= MEM_WB_M.io_MEMWB_rd_out @[core.scala 274:35]
    Forwarding.io_MEMWB_regWr <= MEM_WB_M.io_MEMWB_reg_w_out @[core.scala 275:35]
    HazardDetect.clock <= clock
    HazardDetect.reset <= reset
    HazardDetect.io_IF_ID_inst <= IF_ID_.io_SelectedInstr_out @[core.scala 167:32]
    HazardDetect.io_ID_EX_memRead <= ID_EX_.io_ctrl_MemRd_out @[core.scala 168:35]
    HazardDetect.io_ID_EX_rd <= ID_EX_.io_rd_out @[core.scala 169:30]
    HazardDetect.io_pc_in <= _HazardDetect_io_pc_in_T @[core.scala 170:27]
    HazardDetect.io_current_pc <= IF_ID_.io_SelectedPC_out @[core.scala 171:32]
    Branch_Forward.clock <= clock
    Branch_Forward.reset <= reset
    Branch_Forward.io_ID_EX_RD <= ID_EX_.io_rd_out @[core.scala 176:32]
    Branch_Forward.io_EX_MEM_RD <= EX_MEM_M.io_EXMEM_rd_out @[core.scala 177:33]
    Branch_Forward.io_MEM_WB_RD <= MEM_WB_M.io_MEMWB_rd_out @[core.scala 178:33]
    Branch_Forward.io_ID_EX_memRd <= ID_EX_.io_ctrl_MemRd_out @[core.scala 179:35]
    Branch_Forward.io_EX_MEM_memRd <= EX_MEM_M.io_EXMEM_memRd_out @[core.scala 180:37]
    Branch_Forward.io_MEM_WB_memRd <= MEM_WB_M.io_MEMWB_memRd_out @[core.scala 181:37]
    Branch_Forward.io_rs1 <= _Branch_Forward_io_rs1_T @[core.scala 182:27]
    Branch_Forward.io_rs2 <= _Branch_Forward_io_rs2_T @[core.scala 183:27]
    Branch_Forward.io_ctrl_branch <= control_module.io_branch @[core.scala 184:35]
    Structural.clock <= clock
    Structural.reset <= reset
    Structural.io_rs1 <= _Structural_io_rs1_T @[core.scala 119:24]
    Structural.io_rs2 <= _Structural_io_rs2_T @[core.scala 120:25]
    Structural.io_MEM_WB_regWr <= MEM_WB_M.io_EXMEM_REG_W @[core.scala 121:32]
    Structural.io_MEM_WB_Rd <= MEM_WB_M.io_MEMWB_rd_out @[core.scala 122:29]
