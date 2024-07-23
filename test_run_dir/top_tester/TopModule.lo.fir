circuit TopModule :
  module InstMem :
    input clock : Clock
    input reset : UInt<1>
    input io_addr : UInt<32>
    output io_inst : UInt<32>

    mem ime : @[InsMem.scala 13:15]
      data-type => UInt<32>
      depth => 1024
      read-latency => 0
      write-latency => 1
      reader => io_inst_MPORT
      read-under-write => undefined
    node _io_inst_T = div(io_addr, UInt<3>("h4")) @[InsMem.scala 15:27]
    node _io_inst_T_1 = bits(_io_inst_T, 9, 0) @[InsMem.scala 15:15]
    io_inst <= ime.io_inst_MPORT.data @[InsMem.scala 15:9]
    ime.io_inst_MPORT.addr <= _io_inst_T_1 @[InsMem.scala 15:15]
    ime.io_inst_MPORT.en <= UInt<1>("h1") @[InsMem.scala 15:15]
    ime.io_inst_MPORT.clk <= clock @[InsMem.scala 15:15]

  module fetch :
    input clock : Clock
    input reset : UInt<1>
    input io_pcsel : UInt<1>
    input io_aluout : SInt<32>
    output io_instruction : UInt<32>
    output io_pc_out : UInt<32>
    output io_pc4_out : UInt<32>

    inst insMem of InstMem @[Fetch.scala 15:24]
    reg pc : UInt<32>, clock with :
      reset => (UInt<1>("h0"), pc) @[Fetch.scala 14:20]
    node _pc_T = asUInt(io_aluout) @[Fetch.scala 18:38]
    node _pc_T_1 = add(pc, UInt<3>("h4")) @[Fetch.scala 18:44]
    node _pc_T_2 = tail(_pc_T_1, 1) @[Fetch.scala 18:44]
    node _pc_T_3 = mux(io_pcsel, _pc_T, _pc_T_2) @[Fetch.scala 18:12]
    node _io_pc4_out_T = add(pc, UInt<3>("h4")) @[Fetch.scala 19:21]
    node _io_pc4_out_T_1 = tail(_io_pc4_out_T, 1) @[Fetch.scala 19:21]
    io_instruction <= insMem.io_inst @[Fetch.scala 21:19]
    io_pc_out <= pc @[Fetch.scala 16:14]
    io_pc4_out <= _io_pc4_out_T_1 @[Fetch.scala 19:15]
    pc <= mux(reset, UInt<32>("h0"), _pc_T_3) @[Fetch.scala 14:20 Fetch.scala 14:20 Fetch.scala 18:7]
    insMem.clock <= clock
    insMem.reset <= reset
    insMem.io_addr <= pc @[Fetch.scala 17:19]

  module contolUnit :
    input clock : Clock
    input reset : UInt<1>
    input io_instruction : UInt<32>
    output io_aluop : UInt<4>
    output io_iform : UInt<1>
    output io_rform : UInt<1>
    output io_sform : UInt<1>
    output io_bform : UInt<1>
    output io_luiform : UInt<1>
    output io_Jalform : UInt<1>
    output io_jalrform : UInt<1>
    output io_lform : UInt<1>
    output io_Auipc : UInt<1>
    output io_rd : UInt<5>
    output io_rs1 : UInt<5>
    output io_rs2 : UInt<5>
    output io_wr_en : UInt<1>
    output io_mem_wr_en : UInt<1>
    output io_wr_back : UInt<2>
    output io_immBits : UInt<12>
    output io_br_fun3 : UInt<3>
    output io_load_storefun : UInt<3>
    output io_pcsel : UInt<1>
    input io_btaken : UInt<1>
    output io_lui_jal_jalr_auipc_imm : SInt<32>
    output io_mem_r_en : UInt<1>

    node _op_T = bits(io_instruction, 6, 0) @[control.scala 52:36]
    node _f3_T = bits(io_instruction, 14, 12) @[control.scala 53:38]
    node _f7_T = bits(io_instruction, 31, 25) @[control.scala 54:38]
    node _Rd_T = bits(io_instruction, 11, 7) @[control.scala 55:38]
    node _Rs1_T = bits(io_instruction, 19, 15) @[control.scala 56:39]
    node _Rs2_T = bits(io_instruction, 24, 20) @[control.scala 57:39]
    node _imm_T = bits(io_instruction, 31, 20) @[control.scala 58:39]
    node op = _op_T
    node _T = eq(op, UInt<6>("h33")) @[control.scala 66:13]
    node f7 = _f7_T
    node fn3_7_lo = bits(f7, 5, 5) @[control.scala 68:28]
    node f3 = _f3_T
    node fn3_7 = cat(f3, fn3_7_lo) @[Cat.scala 30:58]
    node _T_1 = eq(op, UInt<5>("h13")) @[control.scala 80:18]
    node _T_2 = eq(f3, UInt<3>("h5")) @[control.scala 82:16]
    node _T_3 = eq(f3, UInt<1>("h1")) @[control.scala 82:26]
    node _T_4 = or(_T_2, _T_3) @[control.scala 82:22]
    node io_aluop_lo = bits(f7, 5, 5) @[control.scala 83:30]
    node _io_aluop_T = cat(f3, io_aluop_lo) @[Cat.scala 30:58]
    node _io_aluop_T_1 = cat(f3, UInt<1>("h0")) @[Cat.scala 30:58]
    node _GEN_0 = mux(_T_4, _io_aluop_T, _io_aluop_T_1) @[control.scala 82:33 control.scala 83:19 control.scala 86:17]
    node _io_immBits_T = bits(io_instruction, 31, 20) @[control.scala 95:36]
    node _T_5 = eq(op, UInt<2>("h3")) @[control.scala 100:18]
    node _io_immBits_T_1 = bits(io_instruction, 31, 20) @[control.scala 110:35]
    node _T_6 = eq(op, UInt<6>("h23")) @[control.scala 118:18]
    node io_immBits_hi = bits(io_instruction, 31, 25) @[control.scala 125:37]
    node io_immBits_lo = bits(io_instruction, 11, 7) @[control.scala 125:59]
    node _io_immBits_T_2 = cat(io_immBits_hi, io_immBits_lo) @[Cat.scala 30:58]
    node _T_7 = eq(op, UInt<7>("h63")) @[control.scala 134:18]
    node _io_lui_jal_jalr_auipc_imm_T = bits(io_instruction, 31, 31) @[control.scala 142:62]
    node _io_lui_jal_jalr_auipc_imm_T_1 = bits(_io_lui_jal_jalr_auipc_imm_T, 0, 0) @[Bitwise.scala 72:15]
    node io_lui_jal_jalr_auipc_imm_hi_hi_hi = mux(_io_lui_jal_jalr_auipc_imm_T_1, UInt<19>("h7ffff"), UInt<19>("h0")) @[Bitwise.scala 72:12]
    node io_lui_jal_jalr_auipc_imm_hi_hi_lo = bits(io_instruction, 31, 31) @[control.scala 142:82]
    node io_lui_jal_jalr_auipc_imm_hi_lo = bits(io_instruction, 7, 7) @[control.scala 142:101]
    node io_lui_jal_jalr_auipc_imm_lo_hi_hi = bits(io_instruction, 30, 25) @[control.scala 142:119]
    node io_lui_jal_jalr_auipc_imm_lo_hi_lo = bits(io_instruction, 11, 8) @[control.scala 142:141]
    node io_lui_jal_jalr_auipc_imm_lo_hi = cat(io_lui_jal_jalr_auipc_imm_lo_hi_hi, io_lui_jal_jalr_auipc_imm_lo_hi_lo) @[Cat.scala 30:58]
    node io_lui_jal_jalr_auipc_imm_lo = cat(io_lui_jal_jalr_auipc_imm_lo_hi, UInt<1>("h0")) @[Cat.scala 30:58]
    node io_lui_jal_jalr_auipc_imm_hi_hi = cat(io_lui_jal_jalr_auipc_imm_hi_hi_hi, io_lui_jal_jalr_auipc_imm_hi_hi_lo) @[Cat.scala 30:58]
    node io_lui_jal_jalr_auipc_imm_hi = cat(io_lui_jal_jalr_auipc_imm_hi_hi, io_lui_jal_jalr_auipc_imm_hi_lo) @[Cat.scala 30:58]
    node _io_lui_jal_jalr_auipc_imm_T_2 = cat(io_lui_jal_jalr_auipc_imm_hi, io_lui_jal_jalr_auipc_imm_lo) @[Cat.scala 30:58]
    node _io_lui_jal_jalr_auipc_imm_T_3 = asSInt(_io_lui_jal_jalr_auipc_imm_T_2) @[control.scala 142:161]
    node _io_br_fun3_T = bits(io_instruction, 14, 12) @[control.scala 144:33]
    node _io_pcsel_T = and(io_btaken, io_bform) @[control.scala 145:31]
    node _io_pcsel_T_1 = mux(_io_pcsel_T, UInt<1>("h1"), UInt<1>("h0")) @[control.scala 145:20]
    node _T_8 = eq(op, UInt<6>("h37")) @[control.scala 149:18]
    node io_lui_jal_jalr_auipc_imm_hi_hi_1 = bits(io_instruction, 31, 12) @[control.scala 152:52]
    node io_lui_jal_jalr_auipc_imm_hi_lo_1 = mux(UInt<1>("h0"), UInt<11>("h7ff"), UInt<11>("h0")) @[Bitwise.scala 72:12]
    node io_lui_jal_jalr_auipc_imm_hi_1 = cat(io_lui_jal_jalr_auipc_imm_hi_hi_1, io_lui_jal_jalr_auipc_imm_hi_lo_1) @[Cat.scala 30:58]
    node _io_lui_jal_jalr_auipc_imm_T_4 = cat(io_lui_jal_jalr_auipc_imm_hi_1, UInt<1>("h0")) @[Cat.scala 30:58]
    node _io_lui_jal_jalr_auipc_imm_T_5 = asSInt(_io_lui_jal_jalr_auipc_imm_T_4) @[control.scala 152:86]
    node _T_9 = eq(op, UInt<7>("h6f")) @[control.scala 164:18]
    node _io_lui_jal_jalr_auipc_imm_T_6 = bits(io_instruction, 31, 31) @[control.scala 166:60]
    node _io_lui_jal_jalr_auipc_imm_T_7 = bits(_io_lui_jal_jalr_auipc_imm_T_6, 0, 0) @[Bitwise.scala 72:15]
    node io_lui_jal_jalr_auipc_imm_hi_hi_hi_1 = mux(_io_lui_jal_jalr_auipc_imm_T_7, UInt<11>("h7ff"), UInt<11>("h0")) @[Bitwise.scala 72:12]
    node io_lui_jal_jalr_auipc_imm_hi_hi_lo_1 = bits(io_instruction, 31, 31) @[control.scala 166:80]
    node io_lui_jal_jalr_auipc_imm_hi_lo_2 = bits(io_instruction, 19, 12) @[control.scala 166:99]
    node io_lui_jal_jalr_auipc_imm_lo_hi_hi_1 = bits(io_instruction, 20, 20) @[control.scala 166:121]
    node io_lui_jal_jalr_auipc_imm_lo_hi_lo_1 = bits(io_instruction, 30, 21) @[control.scala 166:140]
    node io_lui_jal_jalr_auipc_imm_lo_hi_1 = cat(io_lui_jal_jalr_auipc_imm_lo_hi_hi_1, io_lui_jal_jalr_auipc_imm_lo_hi_lo_1) @[Cat.scala 30:58]
    node io_lui_jal_jalr_auipc_imm_lo_1 = cat(io_lui_jal_jalr_auipc_imm_lo_hi_1, UInt<1>("h0")) @[Cat.scala 30:58]
    node io_lui_jal_jalr_auipc_imm_hi_hi_2 = cat(io_lui_jal_jalr_auipc_imm_hi_hi_hi_1, io_lui_jal_jalr_auipc_imm_hi_hi_lo_1) @[Cat.scala 30:58]
    node io_lui_jal_jalr_auipc_imm_hi_2 = cat(io_lui_jal_jalr_auipc_imm_hi_hi_2, io_lui_jal_jalr_auipc_imm_hi_lo_2) @[Cat.scala 30:58]
    node _io_lui_jal_jalr_auipc_imm_T_8 = cat(io_lui_jal_jalr_auipc_imm_hi_2, io_lui_jal_jalr_auipc_imm_lo_1) @[Cat.scala 30:58]
    node _io_lui_jal_jalr_auipc_imm_T_9 = asSInt(_io_lui_jal_jalr_auipc_imm_T_8) @[control.scala 166:159]
    node _T_10 = eq(op, UInt<7>("h67")) @[control.scala 179:18]
    node _io_lui_jal_jalr_auipc_imm_T_10 = bits(io_instruction, 31, 31) @[control.scala 180:60]
    node _io_lui_jal_jalr_auipc_imm_T_11 = bits(_io_lui_jal_jalr_auipc_imm_T_10, 0, 0) @[Bitwise.scala 72:15]
    node io_lui_jal_jalr_auipc_imm_hi_3 = mux(_io_lui_jal_jalr_auipc_imm_T_11, UInt<11>("h7ff"), UInt<11>("h0")) @[Bitwise.scala 72:12]
    node io_lui_jal_jalr_auipc_imm_lo_2 = bits(io_instruction, 31, 20) @[control.scala 180:80]
    node _io_lui_jal_jalr_auipc_imm_T_12 = cat(io_lui_jal_jalr_auipc_imm_hi_3, io_lui_jal_jalr_auipc_imm_lo_2) @[Cat.scala 30:58]
    node _io_lui_jal_jalr_auipc_imm_T_13 = asSInt(_io_lui_jal_jalr_auipc_imm_T_12) @[control.scala 180:95]
    node _T_11 = eq(op, UInt<5>("h17")) @[control.scala 193:18]
    node io_lui_jal_jalr_auipc_imm_hi_hi_3 = bits(io_instruction, 31, 12) @[control.scala 203:52]
    node io_lui_jal_jalr_auipc_imm_hi_lo_3 = mux(UInt<1>("h0"), UInt<11>("h7ff"), UInt<11>("h0")) @[Bitwise.scala 72:12]
    node io_lui_jal_jalr_auipc_imm_hi_4 = cat(io_lui_jal_jalr_auipc_imm_hi_hi_3, io_lui_jal_jalr_auipc_imm_hi_lo_3) @[Cat.scala 30:58]
    node _io_lui_jal_jalr_auipc_imm_T_14 = cat(io_lui_jal_jalr_auipc_imm_hi_4, UInt<1>("h0")) @[Cat.scala 30:58]
    node _io_lui_jal_jalr_auipc_imm_T_15 = asSInt(_io_lui_jal_jalr_auipc_imm_T_14) @[control.scala 203:86]
    node _GEN_1 = mux(_T_11, UInt<1>("h0"), UInt<1>("h0")) @[control.scala 193:34 control.scala 194:13 control.scala 216:13]
    node _GEN_2 = mux(_T_11, UInt<1>("h1"), UInt<1>("h0")) @[control.scala 193:34 control.scala 201:15 control.scala 44:13]
    node _GEN_3 = mux(_T_11, _io_lui_jal_jalr_auipc_imm_T_15, asSInt(UInt<1>("h0"))) @[control.scala 193:34 control.scala 203:32 control.scala 45:30]
    node _GEN_4 = mux(_T_10, _io_lui_jal_jalr_auipc_imm_T_13, _GEN_3) @[control.scala 179:34 control.scala 180:32]
    node Rs1 = _Rs1_T
    node _GEN_5 = mux(_T_10, Rs1, _GEN_1) @[control.scala 179:34 control.scala 181:13]
    node _GEN_6 = mux(_T_10, UInt<1>("h0"), _GEN_1) @[control.scala 179:34 control.scala 182:13]
    node Rd = _Rd_T
    node _GEN_7 = mux(_T_10, Rd, _GEN_1) @[control.scala 179:34 control.scala 183:12]
    node _GEN_8 = mux(_T_10, UInt<2>("h2"), _GEN_1) @[control.scala 179:34 control.scala 185:17]
    node _GEN_9 = mux(_T_10, UInt<1>("h1"), _GEN_1) @[control.scala 179:34 control.scala 186:15]
    node _GEN_10 = mux(_T_10, UInt<1>("h1"), _GEN_2) @[control.scala 179:34 control.scala 187:15]
    node _GEN_11 = mux(_T_10, UInt<1>("h0"), UInt<1>("h0")) @[control.scala 179:34 control.scala 188:17 control.scala 63:16]
    node _GEN_12 = mux(_T_10, UInt<1>("h1"), UInt<1>("h0")) @[control.scala 179:34 control.scala 189:18 control.scala 64:17]
    node _GEN_13 = mux(_T_10, UInt<1>("h0"), _GEN_2) @[control.scala 179:34 control.scala 65:14]
    node _GEN_14 = mux(_T_9, Rd, _GEN_7) @[control.scala 164:34 control.scala 165:12]
    node _GEN_15 = mux(_T_9, _io_lui_jal_jalr_auipc_imm_T_9, _GEN_4) @[control.scala 164:34 control.scala 166:32]
    node _GEN_16 = mux(_T_9, UInt<1>("h1"), _GEN_11) @[control.scala 164:34 control.scala 167:17]
    node _GEN_17 = mux(_T_9, UInt<1>("h0"), _GEN_6) @[control.scala 164:34 control.scala 168:15]
    node _GEN_18 = mux(_T_9, UInt<1>("h0"), _GEN_5) @[control.scala 164:34 control.scala 169:13]
    node _GEN_19 = mux(_T_9, UInt<1>("h1"), _GEN_9) @[control.scala 164:34 control.scala 172:15]
    node _GEN_20 = mux(_T_9, UInt<1>("h1"), _GEN_10) @[control.scala 164:34 control.scala 173:15]
    node _GEN_21 = mux(_T_9, UInt<2>("h2"), _GEN_8) @[control.scala 164:34 control.scala 174:17]
    node _GEN_22 = mux(_T_9, UInt<1>("h0"), _GEN_12) @[control.scala 164:34 control.scala 64:17]
    node _GEN_23 = mux(_T_9, UInt<1>("h0"), _GEN_13) @[control.scala 164:34 control.scala 65:14]
    node _GEN_24 = mux(_T_8, UInt<1>("h1"), UInt<1>("h0")) @[control.scala 149:34 control.scala 150:17 control.scala 62:16]
    node _GEN_25 = mux(_T_8, Rd, _GEN_14) @[control.scala 149:34 control.scala 151:12]
    node _GEN_26 = mux(_T_8, _io_lui_jal_jalr_auipc_imm_T_5, _GEN_15) @[control.scala 149:34 control.scala 152:32]
    node _GEN_27 = mux(_T_8, UInt<1>("h0"), _GEN_17) @[control.scala 149:34 control.scala 153:17]
    node _GEN_28 = mux(_T_8, UInt<1>("h1"), _GEN_19) @[control.scala 149:34 control.scala 155:15]
    node _GEN_29 = mux(_T_8, UInt<1>("h1"), _GEN_21) @[control.scala 149:34 control.scala 156:17]
    node _GEN_30 = mux(_T_8, UInt<1>("h0"), _GEN_18) @[control.scala 149:34 control.scala 157:13]
    node _GEN_31 = mux(_T_8, UInt<1>("h0"), UInt<1>("h0")) @[control.scala 149:34 control.scala 160:17 control.scala 41:16]
    node _GEN_32 = mux(_T_8, UInt<1>("h0"), _GEN_20) @[control.scala 149:34 control.scala 161:15]
    node _GEN_33 = mux(_T_8, UInt<1>("h0"), _GEN_16) @[control.scala 149:34 control.scala 63:16]
    node _GEN_34 = mux(_T_8, UInt<1>("h0"), _GEN_22) @[control.scala 149:34 control.scala 64:17]
    node _GEN_35 = mux(_T_8, UInt<1>("h0"), _GEN_23) @[control.scala 149:34 control.scala 65:14]
    node _GEN_36 = mux(_T_7, UInt<1>("h0"), _GEN_28) @[control.scala 134:34 control.scala 135:15]
    node _GEN_37 = mux(_T_7, UInt<1>("h1"), _GEN_27) @[control.scala 134:34 control.scala 136:15]
    node _GEN_38 = mux(_T_7, Rs1, _GEN_30) @[control.scala 134:34 control.scala 137:13]
    node Rs2 = _Rs2_T
    node _GEN_39 = mux(_T_7, Rs2, _GEN_27) @[control.scala 134:34 control.scala 138:13]
    node _GEN_40 = mux(_T_7, UInt<1>("h0"), _GEN_27) @[control.scala 134:34 control.scala 139:15]
    node _GEN_41 = mux(_T_7, UInt<1>("h0"), _GEN_25) @[control.scala 134:34 control.scala 140:12]
    node _GEN_42 = mux(_T_7, _io_lui_jal_jalr_auipc_imm_T_3, _GEN_26) @[control.scala 134:34 control.scala 142:32]
    node _GEN_43 = mux(_T_7, UInt<1>("h0"), _GEN_29) @[control.scala 134:34 control.scala 143:17]
    node _GEN_44 = mux(_T_7, _io_br_fun3_T, _GEN_27) @[control.scala 134:34 control.scala 144:17]
    node _GEN_45 = mux(_T_7, _io_pcsel_T_1, _GEN_32) @[control.scala 134:34 control.scala 145:15]
    node _GEN_46 = mux(_T_7, UInt<1>("h0"), _GEN_24) @[control.scala 134:34 control.scala 62:16]
    node _GEN_47 = mux(_T_7, UInt<1>("h0"), _GEN_31) @[control.scala 134:34 control.scala 41:16]
    node _GEN_48 = mux(_T_7, UInt<1>("h0"), _GEN_33) @[control.scala 134:34 control.scala 63:16]
    node _GEN_49 = mux(_T_7, UInt<1>("h0"), _GEN_34) @[control.scala 134:34 control.scala 64:17]
    node _GEN_50 = mux(_T_7, UInt<1>("h0"), _GEN_35) @[control.scala 134:34 control.scala 65:14]
    node _GEN_51 = mux(_T_6, UInt<1>("h0"), _GEN_36) @[control.scala 118:34 control.scala 119:15]
    node _GEN_52 = mux(_T_6, UInt<1>("h1"), _GEN_40) @[control.scala 118:34 control.scala 120:15]
    node _GEN_53 = mux(_T_6, Rs1, _GEN_38) @[control.scala 118:34 control.scala 121:13]
    node _GEN_54 = mux(_T_6, Rs2, _GEN_39) @[control.scala 118:34 control.scala 122:13]
    node _GEN_55 = mux(_T_6, _io_immBits_T_2, _GEN_47) @[control.scala 118:34 control.scala 125:17]
    node _GEN_56 = mux(_T_6, UInt<1>("h0"), _GEN_40) @[control.scala 118:34 control.scala 126:15]
    node _GEN_57 = mux(_T_6, UInt<1>("h0"), _GEN_41) @[control.scala 118:34 control.scala 127:12]
    node _GEN_58 = mux(_T_6, f3, UInt<1>("h0")) @[control.scala 118:34 control.scala 129:23 control.scala 40:21]
    node _GEN_59 = mux(_T_6, UInt<1>("h0"), _GEN_45) @[control.scala 118:34 control.scala 130:15]
    node _GEN_60 = mux(_T_6, UInt<1>("h0"), _GEN_37) @[control.scala 118:34 control.scala 43:14]
    node _GEN_61 = mux(_T_6, asSInt(UInt<1>("h0")), _GEN_42) @[control.scala 118:34 control.scala 45:30]
    node _GEN_62 = mux(_T_6, UInt<1>("h0"), _GEN_43) @[control.scala 118:34 control.scala 39:15]
    node _GEN_63 = mux(_T_6, UInt<1>("h0"), _GEN_44) @[control.scala 118:34 control.scala 46:15]
    node _GEN_64 = mux(_T_6, UInt<1>("h0"), _GEN_46) @[control.scala 118:34 control.scala 62:16]
    node _GEN_65 = mux(_T_6, UInt<1>("h0"), _GEN_48) @[control.scala 118:34 control.scala 63:16]
    node _GEN_66 = mux(_T_6, UInt<1>("h0"), _GEN_49) @[control.scala 118:34 control.scala 64:17]
    node _GEN_67 = mux(_T_6, UInt<1>("h0"), _GEN_50) @[control.scala 118:34 control.scala 65:14]
    node _GEN_68 = mux(_T_5, UInt<1>("h1"), _GEN_56) @[control.scala 100:34 control.scala 101:17]
    node _GEN_69 = mux(_T_5, Rd, _GEN_57) @[control.scala 100:34 control.scala 102:14]
    node _GEN_70 = mux(_T_5, UInt<1>("h1"), UInt<1>("h0")) @[control.scala 100:34 control.scala 103:17 control.scala 47:13]
    node _GEN_71 = mux(_T_5, Rs1, _GEN_53) @[control.scala 100:34 control.scala 104:15]
    node _GEN_72 = mux(_T_5, UInt<1>("h0"), _GEN_56) @[control.scala 100:34 control.scala 105:17]
    node _GEN_73 = mux(_T_5, UInt<1>("h0"), _GEN_52) @[control.scala 100:34 control.scala 106:21]
    node _GEN_74 = mux(_T_5, UInt<1>("h0"), _GEN_62) @[control.scala 100:34 control.scala 107:19]
    node _GEN_75 = mux(_T_5, UInt<1>("h0"), _GEN_54) @[control.scala 100:34 control.scala 108:15]
    node _GEN_76 = mux(_T_5, _io_immBits_T_1, _GEN_55) @[control.scala 100:34 control.scala 110:19]
    node _GEN_77 = mux(_T_5, f3, _GEN_58) @[control.scala 100:34 control.scala 111:25]
    node _GEN_78 = mux(_T_5, UInt<1>("h0"), _GEN_59) @[control.scala 100:34 control.scala 112:17]
    node _GEN_79 = mux(_T_5, UInt<1>("h1"), _GEN_51) @[control.scala 100:34 control.scala 114:18]
    node _GEN_80 = mux(_T_5, UInt<1>("h0"), _GEN_60) @[control.scala 100:34 control.scala 43:14]
    node _GEN_81 = mux(_T_5, asSInt(UInt<1>("h0")), _GEN_61) @[control.scala 100:34 control.scala 45:30]
    node _GEN_82 = mux(_T_5, UInt<1>("h0"), _GEN_63) @[control.scala 100:34 control.scala 46:15]
    node _GEN_83 = mux(_T_5, UInt<1>("h0"), _GEN_64) @[control.scala 100:34 control.scala 62:16]
    node _GEN_84 = mux(_T_5, UInt<1>("h0"), _GEN_65) @[control.scala 100:34 control.scala 63:16]
    node _GEN_85 = mux(_T_5, UInt<1>("h0"), _GEN_66) @[control.scala 100:34 control.scala 64:17]
    node _GEN_86 = mux(_T_5, UInt<1>("h0"), _GEN_67) @[control.scala 100:34 control.scala 65:14]
    node _GEN_87 = mux(_T_1, UInt<1>("h1"), _GEN_68) @[control.scala 80:34 control.scala 81:17]
    node _GEN_88 = mux(_T_1, _GEN_0, _GEN_72) @[control.scala 80:34]
    node _GEN_89 = mux(_T_1, UInt<1>("h1"), _GEN_79) @[control.scala 80:34 control.scala 88:17]
    node _GEN_90 = mux(_T_1, Rd, _GEN_69) @[control.scala 80:34 control.scala 89:15]
    node _GEN_91 = mux(_T_1, Rs1, _GEN_71) @[control.scala 80:34 control.scala 90:16]
    node _GEN_92 = mux(_T_1, UInt<1>("h0"), _GEN_73) @[control.scala 80:34 control.scala 91:22]
    node _GEN_93 = mux(_T_1, UInt<1>("h1"), _GEN_74) @[control.scala 80:34 control.scala 92:20]
    node _GEN_94 = mux(_T_1, UInt<1>("h0"), _GEN_75) @[control.scala 80:34 control.scala 93:16]
    node _GEN_95 = mux(_T_1, _io_immBits_T, _GEN_76) @[control.scala 80:34 control.scala 95:20]
    node _GEN_96 = mux(_T_1, UInt<1>("h0"), _GEN_82) @[control.scala 80:34 control.scala 96:20]
    node _GEN_97 = mux(_T_1, UInt<1>("h0"), _GEN_78) @[control.scala 80:34 control.scala 97:18]
    node _GEN_98 = mux(_T_1, UInt<1>("h0"), _GEN_70) @[control.scala 80:34 control.scala 47:13]
    node _GEN_99 = mux(_T_1, UInt<1>("h0"), _GEN_77) @[control.scala 80:34 control.scala 40:21]
    node _GEN_100 = mux(_T_1, UInt<1>("h0"), _GEN_80) @[control.scala 80:34 control.scala 43:14]
    node _GEN_101 = mux(_T_1, asSInt(UInt<1>("h0")), _GEN_81) @[control.scala 80:34 control.scala 45:30]
    node _GEN_102 = mux(_T_1, UInt<1>("h0"), _GEN_83) @[control.scala 80:34 control.scala 62:16]
    node _GEN_103 = mux(_T_1, UInt<1>("h0"), _GEN_84) @[control.scala 80:34 control.scala 63:16]
    node _GEN_104 = mux(_T_1, UInt<1>("h0"), _GEN_85) @[control.scala 80:34 control.scala 64:17]
    node _GEN_105 = mux(_T_1, UInt<1>("h0"), _GEN_86) @[control.scala 80:34 control.scala 65:14]
    node _GEN_106 = mux(_T_1, UInt<1>("h0"), _GEN_72) @[control.scala 80:34 control.scala 59:14]
    node _GEN_107 = mux(_T, UInt<1>("h1"), _GEN_106) @[control.scala 66:29 control.scala 67:15]
    node _GEN_108 = mux(_T, fn3_7, _GEN_88) @[control.scala 66:29 control.scala 69:15]
    node _GEN_109 = mux(_T, Rs2, _GEN_94) @[control.scala 66:29 control.scala 70:13]
    node _GEN_110 = mux(_T, UInt<1>("h1"), _GEN_89) @[control.scala 66:29 control.scala 71:15]
    node _GEN_111 = mux(_T, Rd, _GEN_90) @[control.scala 66:29 control.scala 72:12]
    node _GEN_112 = mux(_T, Rs1, _GEN_91) @[control.scala 66:29 control.scala 73:12]
    node _GEN_113 = mux(_T, UInt<1>("h0"), _GEN_92) @[control.scala 66:29 control.scala 74:18]
    node _GEN_114 = mux(_T, UInt<1>("h1"), _GEN_93) @[control.scala 66:29 control.scala 75:16]
    node _GEN_115 = mux(_T, UInt<1>("h0"), _GEN_96) @[control.scala 66:29 control.scala 76:16]
    node _GEN_116 = mux(_T, UInt<1>("h0"), _GEN_97) @[control.scala 66:29 control.scala 77:14]
    node _GEN_117 = mux(_T, UInt<1>("h0"), _GEN_87) @[control.scala 66:29 control.scala 60:14]
    node _GEN_118 = mux(_T, UInt<1>("h0"), _GEN_95) @[control.scala 66:29 control.scala 41:16]
    node _GEN_119 = mux(_T, UInt<1>("h0"), _GEN_98) @[control.scala 66:29 control.scala 47:13]
    node _GEN_120 = mux(_T, UInt<1>("h0"), _GEN_99) @[control.scala 66:29 control.scala 40:21]
    node _GEN_121 = mux(_T, UInt<1>("h0"), _GEN_100) @[control.scala 66:29 control.scala 43:14]
    node _GEN_122 = mux(_T, asSInt(UInt<1>("h0")), _GEN_101) @[control.scala 66:29 control.scala 45:30]
    node _GEN_123 = mux(_T, UInt<1>("h0"), _GEN_102) @[control.scala 66:29 control.scala 62:16]
    node _GEN_124 = mux(_T, UInt<1>("h0"), _GEN_103) @[control.scala 66:29 control.scala 63:16]
    node _GEN_125 = mux(_T, UInt<1>("h0"), _GEN_104) @[control.scala 66:29 control.scala 64:17]
    node _GEN_126 = mux(_T, UInt<1>("h0"), _GEN_105) @[control.scala 66:29 control.scala 65:14]
    node imm = _imm_T
    io_aluop <= _GEN_108
    io_iform <= _GEN_117
    io_rform <= _GEN_107
    io_sform <= _GEN_113
    io_bform <= _GEN_121
    io_luiform <= _GEN_123
    io_Jalform <= _GEN_124
    io_jalrform <= _GEN_125
    io_lform <= _GEN_119
    io_Auipc <= _GEN_126
    io_rd <= _GEN_111
    io_rs1 <= _GEN_112
    io_rs2 <= _GEN_109
    io_wr_en <= _GEN_110
    io_mem_wr_en <= _GEN_113
    io_wr_back <= _GEN_114
    io_immBits <= _GEN_118
    io_br_fun3 <= _GEN_115
    io_load_storefun <= _GEN_120
    io_pcsel <= _GEN_116
    io_lui_jal_jalr_auipc_imm <= _GEN_122
    io_mem_r_en <= _GEN_119

  module Reg_File :
    input clock : Clock
    input reset : UInt<1>
    input io_rd : UInt<5>
    input io_rs1 : UInt<5>
    input io_rs2 : UInt<5>
    output io_Rs1 : SInt<32>
    output io_Rs2 : SInt<32>
    input io_wr : UInt<1>
    input io_Rd : SInt<32>

    reg Reg2_0 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_0) @[RegFile.scala 19:16]
    reg Reg2_1 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_1) @[RegFile.scala 19:16]
    reg Reg2_2 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_2) @[RegFile.scala 19:16]
    reg Reg2_3 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_3) @[RegFile.scala 19:16]
    reg Reg2_4 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_4) @[RegFile.scala 19:16]
    reg Reg2_5 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_5) @[RegFile.scala 19:16]
    reg Reg2_6 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_6) @[RegFile.scala 19:16]
    reg Reg2_7 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_7) @[RegFile.scala 19:16]
    reg Reg2_8 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_8) @[RegFile.scala 19:16]
    reg Reg2_9 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_9) @[RegFile.scala 19:16]
    reg Reg2_10 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_10) @[RegFile.scala 19:16]
    reg Reg2_11 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_11) @[RegFile.scala 19:16]
    reg Reg2_12 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_12) @[RegFile.scala 19:16]
    reg Reg2_13 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_13) @[RegFile.scala 19:16]
    reg Reg2_14 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_14) @[RegFile.scala 19:16]
    reg Reg2_15 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_15) @[RegFile.scala 19:16]
    reg Reg2_16 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_16) @[RegFile.scala 19:16]
    reg Reg2_17 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_17) @[RegFile.scala 19:16]
    reg Reg2_18 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_18) @[RegFile.scala 19:16]
    reg Reg2_19 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_19) @[RegFile.scala 19:16]
    reg Reg2_20 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_20) @[RegFile.scala 19:16]
    reg Reg2_21 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_21) @[RegFile.scala 19:16]
    reg Reg2_22 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_22) @[RegFile.scala 19:16]
    reg Reg2_23 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_23) @[RegFile.scala 19:16]
    reg Reg2_24 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_24) @[RegFile.scala 19:16]
    reg Reg2_25 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_25) @[RegFile.scala 19:16]
    reg Reg2_26 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_26) @[RegFile.scala 19:16]
    reg Reg2_27 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_27) @[RegFile.scala 19:16]
    reg Reg2_28 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_28) @[RegFile.scala 19:16]
    reg Reg2_29 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_29) @[RegFile.scala 19:16]
    reg Reg2_30 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_30) @[RegFile.scala 19:16]
    reg Reg2_31 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), Reg2_31) @[RegFile.scala 19:16]
    node _T = neq(io_rd, UInt<1>("h0")) @[RegFile.scala 26:20]
    node _T_1 = and(io_wr, _T) @[RegFile.scala 26:12]
    node _Reg2_io_rd = io_Rd @[RegFile.scala 28:12 RegFile.scala 28:12]
    node _GEN_0 = mux(eq(UInt<1>("h0"), io_rd), _Reg2_io_rd, asSInt(UInt<1>("h0"))) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 23:9]
    node _GEN_1 = mux(eq(UInt<1>("h1"), io_rd), _Reg2_io_rd, Reg2_1) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_2 = mux(eq(UInt<2>("h2"), io_rd), _Reg2_io_rd, Reg2_2) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_3 = mux(eq(UInt<2>("h3"), io_rd), _Reg2_io_rd, Reg2_3) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_4 = mux(eq(UInt<3>("h4"), io_rd), _Reg2_io_rd, Reg2_4) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_5 = mux(eq(UInt<3>("h5"), io_rd), _Reg2_io_rd, Reg2_5) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_6 = mux(eq(UInt<3>("h6"), io_rd), _Reg2_io_rd, Reg2_6) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_7 = mux(eq(UInt<3>("h7"), io_rd), _Reg2_io_rd, Reg2_7) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_8 = mux(eq(UInt<4>("h8"), io_rd), _Reg2_io_rd, Reg2_8) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_9 = mux(eq(UInt<4>("h9"), io_rd), _Reg2_io_rd, Reg2_9) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_10 = mux(eq(UInt<4>("ha"), io_rd), _Reg2_io_rd, Reg2_10) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_11 = mux(eq(UInt<4>("hb"), io_rd), _Reg2_io_rd, Reg2_11) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_12 = mux(eq(UInt<4>("hc"), io_rd), _Reg2_io_rd, Reg2_12) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_13 = mux(eq(UInt<4>("hd"), io_rd), _Reg2_io_rd, Reg2_13) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_14 = mux(eq(UInt<4>("he"), io_rd), _Reg2_io_rd, Reg2_14) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_15 = mux(eq(UInt<4>("hf"), io_rd), _Reg2_io_rd, Reg2_15) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_16 = mux(eq(UInt<5>("h10"), io_rd), _Reg2_io_rd, Reg2_16) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_17 = mux(eq(UInt<5>("h11"), io_rd), _Reg2_io_rd, Reg2_17) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_18 = mux(eq(UInt<5>("h12"), io_rd), _Reg2_io_rd, Reg2_18) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_19 = mux(eq(UInt<5>("h13"), io_rd), _Reg2_io_rd, Reg2_19) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_20 = mux(eq(UInt<5>("h14"), io_rd), _Reg2_io_rd, Reg2_20) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_21 = mux(eq(UInt<5>("h15"), io_rd), _Reg2_io_rd, Reg2_21) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_22 = mux(eq(UInt<5>("h16"), io_rd), _Reg2_io_rd, Reg2_22) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_23 = mux(eq(UInt<5>("h17"), io_rd), _Reg2_io_rd, Reg2_23) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_24 = mux(eq(UInt<5>("h18"), io_rd), _Reg2_io_rd, Reg2_24) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_25 = mux(eq(UInt<5>("h19"), io_rd), _Reg2_io_rd, Reg2_25) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_26 = mux(eq(UInt<5>("h1a"), io_rd), _Reg2_io_rd, Reg2_26) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_27 = mux(eq(UInt<5>("h1b"), io_rd), _Reg2_io_rd, Reg2_27) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_28 = mux(eq(UInt<5>("h1c"), io_rd), _Reg2_io_rd, Reg2_28) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_29 = mux(eq(UInt<5>("h1d"), io_rd), _Reg2_io_rd, Reg2_29) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_30 = mux(eq(UInt<5>("h1e"), io_rd), _Reg2_io_rd, Reg2_30) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_31 = mux(eq(UInt<5>("h1f"), io_rd), _Reg2_io_rd, Reg2_31) @[RegFile.scala 28:12 RegFile.scala 28:12 RegFile.scala 19:16]
    node _GEN_32 = validif(eq(UInt<1>("h0"), io_rs1), Reg2_0) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_33 = mux(eq(UInt<1>("h1"), io_rs1), Reg2_1, _GEN_32) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_34 = mux(eq(UInt<2>("h2"), io_rs1), Reg2_2, _GEN_33) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_35 = mux(eq(UInt<2>("h3"), io_rs1), Reg2_3, _GEN_34) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_36 = mux(eq(UInt<3>("h4"), io_rs1), Reg2_4, _GEN_35) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_37 = mux(eq(UInt<3>("h5"), io_rs1), Reg2_5, _GEN_36) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_38 = mux(eq(UInt<3>("h6"), io_rs1), Reg2_6, _GEN_37) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_39 = mux(eq(UInt<3>("h7"), io_rs1), Reg2_7, _GEN_38) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_40 = mux(eq(UInt<4>("h8"), io_rs1), Reg2_8, _GEN_39) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_41 = mux(eq(UInt<4>("h9"), io_rs1), Reg2_9, _GEN_40) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_42 = mux(eq(UInt<4>("ha"), io_rs1), Reg2_10, _GEN_41) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_43 = mux(eq(UInt<4>("hb"), io_rs1), Reg2_11, _GEN_42) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_44 = mux(eq(UInt<4>("hc"), io_rs1), Reg2_12, _GEN_43) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_45 = mux(eq(UInt<4>("hd"), io_rs1), Reg2_13, _GEN_44) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_46 = mux(eq(UInt<4>("he"), io_rs1), Reg2_14, _GEN_45) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_47 = mux(eq(UInt<4>("hf"), io_rs1), Reg2_15, _GEN_46) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_48 = mux(eq(UInt<5>("h10"), io_rs1), Reg2_16, _GEN_47) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_49 = mux(eq(UInt<5>("h11"), io_rs1), Reg2_17, _GEN_48) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_50 = mux(eq(UInt<5>("h12"), io_rs1), Reg2_18, _GEN_49) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_51 = mux(eq(UInt<5>("h13"), io_rs1), Reg2_19, _GEN_50) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_52 = mux(eq(UInt<5>("h14"), io_rs1), Reg2_20, _GEN_51) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_53 = mux(eq(UInt<5>("h15"), io_rs1), Reg2_21, _GEN_52) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_54 = mux(eq(UInt<5>("h16"), io_rs1), Reg2_22, _GEN_53) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_55 = mux(eq(UInt<5>("h17"), io_rs1), Reg2_23, _GEN_54) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_56 = mux(eq(UInt<5>("h18"), io_rs1), Reg2_24, _GEN_55) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_57 = mux(eq(UInt<5>("h19"), io_rs1), Reg2_25, _GEN_56) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_58 = mux(eq(UInt<5>("h1a"), io_rs1), Reg2_26, _GEN_57) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_59 = mux(eq(UInt<5>("h1b"), io_rs1), Reg2_27, _GEN_58) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_60 = mux(eq(UInt<5>("h1c"), io_rs1), Reg2_28, _GEN_59) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_61 = mux(eq(UInt<5>("h1d"), io_rs1), Reg2_29, _GEN_60) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_62 = mux(eq(UInt<5>("h1e"), io_rs1), Reg2_30, _GEN_61) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_63 = mux(eq(UInt<5>("h1f"), io_rs1), Reg2_31, _GEN_62) @[RegFile.scala 29:8 RegFile.scala 29:8]
    node _GEN_64 = validif(eq(UInt<1>("h0"), io_rs2), Reg2_0) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_65 = mux(eq(UInt<1>("h1"), io_rs2), Reg2_1, _GEN_64) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_66 = mux(eq(UInt<2>("h2"), io_rs2), Reg2_2, _GEN_65) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_67 = mux(eq(UInt<2>("h3"), io_rs2), Reg2_3, _GEN_66) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_68 = mux(eq(UInt<3>("h4"), io_rs2), Reg2_4, _GEN_67) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_69 = mux(eq(UInt<3>("h5"), io_rs2), Reg2_5, _GEN_68) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_70 = mux(eq(UInt<3>("h6"), io_rs2), Reg2_6, _GEN_69) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_71 = mux(eq(UInt<3>("h7"), io_rs2), Reg2_7, _GEN_70) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_72 = mux(eq(UInt<4>("h8"), io_rs2), Reg2_8, _GEN_71) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_73 = mux(eq(UInt<4>("h9"), io_rs2), Reg2_9, _GEN_72) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_74 = mux(eq(UInt<4>("ha"), io_rs2), Reg2_10, _GEN_73) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_75 = mux(eq(UInt<4>("hb"), io_rs2), Reg2_11, _GEN_74) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_76 = mux(eq(UInt<4>("hc"), io_rs2), Reg2_12, _GEN_75) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_77 = mux(eq(UInt<4>("hd"), io_rs2), Reg2_13, _GEN_76) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_78 = mux(eq(UInt<4>("he"), io_rs2), Reg2_14, _GEN_77) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_79 = mux(eq(UInt<4>("hf"), io_rs2), Reg2_15, _GEN_78) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_80 = mux(eq(UInt<5>("h10"), io_rs2), Reg2_16, _GEN_79) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_81 = mux(eq(UInt<5>("h11"), io_rs2), Reg2_17, _GEN_80) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_82 = mux(eq(UInt<5>("h12"), io_rs2), Reg2_18, _GEN_81) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_83 = mux(eq(UInt<5>("h13"), io_rs2), Reg2_19, _GEN_82) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_84 = mux(eq(UInt<5>("h14"), io_rs2), Reg2_20, _GEN_83) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_85 = mux(eq(UInt<5>("h15"), io_rs2), Reg2_21, _GEN_84) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_86 = mux(eq(UInt<5>("h16"), io_rs2), Reg2_22, _GEN_85) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_87 = mux(eq(UInt<5>("h17"), io_rs2), Reg2_23, _GEN_86) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_88 = mux(eq(UInt<5>("h18"), io_rs2), Reg2_24, _GEN_87) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_89 = mux(eq(UInt<5>("h19"), io_rs2), Reg2_25, _GEN_88) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_90 = mux(eq(UInt<5>("h1a"), io_rs2), Reg2_26, _GEN_89) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_91 = mux(eq(UInt<5>("h1b"), io_rs2), Reg2_27, _GEN_90) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_92 = mux(eq(UInt<5>("h1c"), io_rs2), Reg2_28, _GEN_91) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_93 = mux(eq(UInt<5>("h1d"), io_rs2), Reg2_29, _GEN_92) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_94 = mux(eq(UInt<5>("h1e"), io_rs2), Reg2_30, _GEN_93) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_95 = mux(eq(UInt<5>("h1f"), io_rs2), Reg2_31, _GEN_94) @[RegFile.scala 30:8 RegFile.scala 30:8]
    node _GEN_96 = mux(_T_1, _GEN_0, asSInt(UInt<1>("h0"))) @[RegFile.scala 26:27 RegFile.scala 23:9]
    node _GEN_97 = mux(_T_1, _GEN_1, Reg2_1) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_98 = mux(_T_1, _GEN_2, Reg2_2) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_99 = mux(_T_1, _GEN_3, Reg2_3) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_100 = mux(_T_1, _GEN_4, Reg2_4) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_101 = mux(_T_1, _GEN_5, Reg2_5) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_102 = mux(_T_1, _GEN_6, Reg2_6) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_103 = mux(_T_1, _GEN_7, Reg2_7) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_104 = mux(_T_1, _GEN_8, Reg2_8) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_105 = mux(_T_1, _GEN_9, Reg2_9) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_106 = mux(_T_1, _GEN_10, Reg2_10) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_107 = mux(_T_1, _GEN_11, Reg2_11) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_108 = mux(_T_1, _GEN_12, Reg2_12) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_109 = mux(_T_1, _GEN_13, Reg2_13) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_110 = mux(_T_1, _GEN_14, Reg2_14) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_111 = mux(_T_1, _GEN_15, Reg2_15) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_112 = mux(_T_1, _GEN_16, Reg2_16) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_113 = mux(_T_1, _GEN_17, Reg2_17) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_114 = mux(_T_1, _GEN_18, Reg2_18) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_115 = mux(_T_1, _GEN_19, Reg2_19) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_116 = mux(_T_1, _GEN_20, Reg2_20) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_117 = mux(_T_1, _GEN_21, Reg2_21) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_118 = mux(_T_1, _GEN_22, Reg2_22) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_119 = mux(_T_1, _GEN_23, Reg2_23) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_120 = mux(_T_1, _GEN_24, Reg2_24) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_121 = mux(_T_1, _GEN_25, Reg2_25) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_122 = mux(_T_1, _GEN_26, Reg2_26) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_123 = mux(_T_1, _GEN_27, Reg2_27) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_124 = mux(_T_1, _GEN_28, Reg2_28) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_125 = mux(_T_1, _GEN_29, Reg2_29) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_126 = mux(_T_1, _GEN_30, Reg2_30) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _GEN_127 = mux(_T_1, _GEN_31, Reg2_31) @[RegFile.scala 26:27 RegFile.scala 19:16]
    node _Reg2_io_rs1 = _GEN_63 @[RegFile.scala 29:8]
    node _Reg2_io_rs1_0 = _GEN_63 @[RegFile.scala 34:12]
    node _GEN_128 = mux(_T_1, _Reg2_io_rs1, _Reg2_io_rs1_0) @[RegFile.scala 26:27 RegFile.scala 29:8 RegFile.scala 34:12]
    node _Reg2_io_rs2 = _GEN_95 @[RegFile.scala 30:8]
    node _Reg2_io_rs2_0 = _GEN_95 @[RegFile.scala 35:12]
    node _GEN_129 = mux(_T_1, _Reg2_io_rs2, _Reg2_io_rs2_0) @[RegFile.scala 26:27 RegFile.scala 30:8 RegFile.scala 35:12]
    io_Rs1 <= _GEN_128
    io_Rs2 <= _GEN_129
    Reg2_0 <= _GEN_96
    Reg2_1 <= _GEN_97
    Reg2_2 <= _GEN_98
    Reg2_3 <= _GEN_99
    Reg2_4 <= _GEN_100
    Reg2_5 <= _GEN_101
    Reg2_6 <= _GEN_102
    Reg2_7 <= _GEN_103
    Reg2_8 <= _GEN_104
    Reg2_9 <= _GEN_105
    Reg2_10 <= _GEN_106
    Reg2_11 <= _GEN_107
    Reg2_12 <= _GEN_108
    Reg2_13 <= _GEN_109
    Reg2_14 <= _GEN_110
    Reg2_15 <= _GEN_111
    Reg2_16 <= _GEN_112
    Reg2_17 <= _GEN_113
    Reg2_18 <= _GEN_114
    Reg2_19 <= _GEN_115
    Reg2_20 <= _GEN_116
    Reg2_21 <= _GEN_117
    Reg2_22 <= _GEN_118
    Reg2_23 <= _GEN_119
    Reg2_24 <= _GEN_120
    Reg2_25 <= _GEN_121
    Reg2_26 <= _GEN_122
    Reg2_27 <= _GEN_123
    Reg2_28 <= _GEN_124
    Reg2_29 <= _GEN_125
    Reg2_30 <= _GEN_126
    Reg2_31 <= _GEN_127

  module ImmdValGen1 :
    input clock : Clock
    input reset : UInt<1>
    input io_imm : UInt<12>
    output io_immd_se : UInt<32>

    node _io_immd_se_T = bits(io_imm, 11, 11) @[IMM.scala 16:33]
    node _io_immd_se_T_1 = bits(_io_immd_se_T, 0, 0) @[Bitwise.scala 72:15]
    node io_immd_se_hi = mux(_io_immd_se_T_1, UInt<19>("h7ffff"), UInt<19>("h0")) @[Bitwise.scala 72:12]
    node _io_immd_se_T_2 = cat(io_immd_se_hi, io_imm) @[Cat.scala 30:58]
    io_immd_se <= _io_immd_se_T_2 @[IMM.scala 16:12]

  module decode :
    input clock : Clock
    input reset : UInt<1>
    input io_ins : UInt<32>
    output io_imm_out : UInt<32>
    output io_iform : UInt<1>
    output io_rform : UInt<1>
    output io_sform : UInt<1>
    output io_bform : UInt<1>
    output io_luiform : UInt<1>
    output io_Jalform : UInt<1>
    output io_jalrform : UInt<1>
    output io_lform : UInt<1>
    output io_Auipc : UInt<1>
    output io_lui_jal_jalr_auipc_imm : SInt<32>
    output io_immBits : UInt<12>
    output io_mem_wr_en : UInt<1>
    output io_wr_back : UInt<2>
    output io_br_fun3 : UInt<3>
    output io_load_storefun : UInt<3>
    output io_pcsel : UInt<1>
    input io_btaken : UInt<1>
    output io_mem_r_en : UInt<1>
    output io_rs1 : SInt<32>
    output io_rs2 : SInt<32>
    input io_din : SInt<32>
    output io_aluop : UInt<4>
    input io_pcout : UInt<32>
    input io_pc4out : UInt<32>
    output io_pc_out : UInt<32>
    output io_RS1 : UInt<5>
    output io_RS2 : UInt<5>
    output io_Rd : UInt<5>
    output io_RegWr_en : UInt<1>
    input io_Wrbrd : UInt<5>
    input io_RegWr_enWB : UInt<1>

    inst cu of contolUnit @[Decode.scala 45:21]
    inst regFile of Reg_File @[Decode.scala 46:25]
    inst imm of ImmdValGen1 @[Decode.scala 47:21]
    io_imm_out <= imm.io_immd_se @[Decode.scala 64:15]
    io_iform <= cu.io_iform @[Decode.scala 67:13]
    io_rform <= cu.io_rform @[Decode.scala 68:13]
    io_sform <= cu.io_sform @[Decode.scala 70:13]
    io_bform <= cu.io_bform @[Decode.scala 69:13]
    io_luiform <= cu.io_luiform @[Decode.scala 71:15]
    io_Jalform <= cu.io_Jalform @[Decode.scala 72:15]
    io_jalrform <= cu.io_jalrform @[Decode.scala 73:16]
    io_lform <= cu.io_lform @[Decode.scala 74:13]
    io_Auipc <= cu.io_Auipc @[Decode.scala 75:13]
    io_lui_jal_jalr_auipc_imm <= cu.io_lui_jal_jalr_auipc_imm @[Decode.scala 65:30]
    io_immBits <= cu.io_immBits @[Decode.scala 62:15]
    io_mem_wr_en <= cu.io_mem_wr_en @[Decode.scala 77:17]
    io_wr_back <= cu.io_wr_back @[Decode.scala 78:15]
    io_br_fun3 <= cu.io_br_fun3 @[Decode.scala 79:15]
    io_load_storefun <= cu.io_load_storefun @[Decode.scala 80:21]
    io_pcsel <= cu.io_pcsel @[Decode.scala 81:13]
    io_mem_r_en <= cu.io_mem_r_en @[Decode.scala 83:16]
    io_rs1 <= regFile.io_Rs1 @[Decode.scala 92:11]
    io_rs2 <= regFile.io_Rs2 @[Decode.scala 93:11]
    io_aluop <= cu.io_aluop @[Decode.scala 84:13]
    io_pc_out <= io_pcout @[Decode.scala 95:14]
    io_RS1 <= cu.io_rs1 @[Decode.scala 51:11]
    io_RS2 <= cu.io_rs2 @[Decode.scala 52:11]
    io_Rd <= cu.io_rd @[Decode.scala 53:10]
    io_RegWr_en <= cu.io_wr_en @[Decode.scala 54:16]
    cu.clock <= clock
    cu.reset <= reset
    cu.io_instruction <= io_ins @[Decode.scala 49:22]
    cu.io_btaken <= io_btaken @[Decode.scala 60:17]
    regFile.clock <= clock
    regFile.reset <= reset
    regFile.io_rd <= io_Wrbrd @[Decode.scala 86:18]
    regFile.io_rs1 <= cu.io_rs1 @[Decode.scala 87:19]
    regFile.io_rs2 <= cu.io_rs2 @[Decode.scala 88:19]
    regFile.io_wr <= io_RegWr_enWB @[Decode.scala 89:18]
    regFile.io_Rd <= io_din @[Decode.scala 90:18]
    imm.clock <= clock
    imm.reset <= reset
    imm.io_imm <= io_immBits @[Decode.scala 63:15]

  module ALUS :
    input clock : Clock
    input reset : UInt<1>
    input io_in_A : SInt<32>
    input io_in_B : SInt<32>
    input io_alu_op : UInt<4>
    output io_out : SInt<32>

    node _sum_T = bits(io_alu_op, 0, 0) @[ALU.scala 31:41]
    node _sum_T_1 = sub(asSInt(UInt<1>("h0")), io_in_B) @[ALU.scala 31:48]
    node _sum_T_2 = tail(_sum_T_1, 1) @[ALU.scala 31:48]
    node _sum_T_3 = asSInt(_sum_T_2) @[ALU.scala 31:48]
    node _sum_T_4 = mux(_sum_T, _sum_T_3, io_in_B) @[ALU.scala 31:30]
    node _sum_T_5 = add(io_in_A, _sum_T_4) @[ALU.scala 31:25]
    node _sum_T_6 = tail(_sum_T_5, 1) @[ALU.scala 31:25]
    node sum = asSInt(_sum_T_6) @[ALU.scala 31:25]
    node shamt = bits(io_in_B, 4, 0) @[ALU.scala 32:27]
    node _shin_T = bits(io_alu_op, 3, 3) @[ALU.scala 33:29]
    node _shin_T_1 = asUInt(io_in_A) @[ALU.scala 33:42]
    node _shin_T_2 = asUInt(io_in_A) @[ALU.scala 33:73]
    node _shin_T_3 = shl(UInt<16>("hffff"), 16) @[Bitwise.scala 102:47]
    node _shin_T_4 = xor(UInt<32>("hffffffff"), _shin_T_3) @[Bitwise.scala 102:21]
    node _shin_T_5 = shr(_shin_T_2, 16) @[Bitwise.scala 103:21]
    node _shin_T_6 = and(_shin_T_5, _shin_T_4) @[Bitwise.scala 103:31]
    node _shin_T_7 = bits(_shin_T_2, 15, 0) @[Bitwise.scala 103:46]
    node _shin_T_8 = shl(_shin_T_7, 16) @[Bitwise.scala 103:65]
    node _shin_T_9 = not(_shin_T_4) @[Bitwise.scala 103:77]
    node _shin_T_10 = and(_shin_T_8, _shin_T_9) @[Bitwise.scala 103:75]
    node _shin_T_11 = or(_shin_T_6, _shin_T_10) @[Bitwise.scala 103:39]
    node _shin_T_12 = bits(_shin_T_4, 23, 0) @[Bitwise.scala 102:28]
    node _shin_T_13 = shl(_shin_T_12, 8) @[Bitwise.scala 102:47]
    node _shin_T_14 = xor(_shin_T_4, _shin_T_13) @[Bitwise.scala 102:21]
    node _shin_T_15 = shr(_shin_T_11, 8) @[Bitwise.scala 103:21]
    node _shin_T_16 = and(_shin_T_15, _shin_T_14) @[Bitwise.scala 103:31]
    node _shin_T_17 = bits(_shin_T_11, 23, 0) @[Bitwise.scala 103:46]
    node _shin_T_18 = shl(_shin_T_17, 8) @[Bitwise.scala 103:65]
    node _shin_T_19 = not(_shin_T_14) @[Bitwise.scala 103:77]
    node _shin_T_20 = and(_shin_T_18, _shin_T_19) @[Bitwise.scala 103:75]
    node _shin_T_21 = or(_shin_T_16, _shin_T_20) @[Bitwise.scala 103:39]
    node _shin_T_22 = bits(_shin_T_14, 27, 0) @[Bitwise.scala 102:28]
    node _shin_T_23 = shl(_shin_T_22, 4) @[Bitwise.scala 102:47]
    node _shin_T_24 = xor(_shin_T_14, _shin_T_23) @[Bitwise.scala 102:21]
    node _shin_T_25 = shr(_shin_T_21, 4) @[Bitwise.scala 103:21]
    node _shin_T_26 = and(_shin_T_25, _shin_T_24) @[Bitwise.scala 103:31]
    node _shin_T_27 = bits(_shin_T_21, 27, 0) @[Bitwise.scala 103:46]
    node _shin_T_28 = shl(_shin_T_27, 4) @[Bitwise.scala 103:65]
    node _shin_T_29 = not(_shin_T_24) @[Bitwise.scala 103:77]
    node _shin_T_30 = and(_shin_T_28, _shin_T_29) @[Bitwise.scala 103:75]
    node _shin_T_31 = or(_shin_T_26, _shin_T_30) @[Bitwise.scala 103:39]
    node _shin_T_32 = bits(_shin_T_24, 29, 0) @[Bitwise.scala 102:28]
    node _shin_T_33 = shl(_shin_T_32, 2) @[Bitwise.scala 102:47]
    node _shin_T_34 = xor(_shin_T_24, _shin_T_33) @[Bitwise.scala 102:21]
    node _shin_T_35 = shr(_shin_T_31, 2) @[Bitwise.scala 103:21]
    node _shin_T_36 = and(_shin_T_35, _shin_T_34) @[Bitwise.scala 103:31]
    node _shin_T_37 = bits(_shin_T_31, 29, 0) @[Bitwise.scala 103:46]
    node _shin_T_38 = shl(_shin_T_37, 2) @[Bitwise.scala 103:65]
    node _shin_T_39 = not(_shin_T_34) @[Bitwise.scala 103:77]
    node _shin_T_40 = and(_shin_T_38, _shin_T_39) @[Bitwise.scala 103:75]
    node _shin_T_41 = or(_shin_T_36, _shin_T_40) @[Bitwise.scala 103:39]
    node _shin_T_42 = bits(_shin_T_34, 30, 0) @[Bitwise.scala 102:28]
    node _shin_T_43 = shl(_shin_T_42, 1) @[Bitwise.scala 102:47]
    node _shin_T_44 = xor(_shin_T_34, _shin_T_43) @[Bitwise.scala 102:21]
    node _shin_T_45 = shr(_shin_T_41, 1) @[Bitwise.scala 103:21]
    node _shin_T_46 = and(_shin_T_45, _shin_T_44) @[Bitwise.scala 103:31]
    node _shin_T_47 = bits(_shin_T_41, 30, 0) @[Bitwise.scala 103:46]
    node _shin_T_48 = shl(_shin_T_47, 1) @[Bitwise.scala 103:65]
    node _shin_T_49 = not(_shin_T_44) @[Bitwise.scala 103:77]
    node _shin_T_50 = and(_shin_T_48, _shin_T_49) @[Bitwise.scala 103:75]
    node _shin_T_51 = or(_shin_T_46, _shin_T_50) @[Bitwise.scala 103:39]
    node shin = mux(_shin_T, _shin_T_1, _shin_T_51) @[ALU.scala 33:19]
    node _shiftr_T = bits(io_alu_op, 0, 0) @[ALU.scala 34:32]
    node _shiftr_T_1 = bits(shin, 31, 31) @[ALU.scala 34:43]
    node shiftr_hi = and(_shiftr_T, _shiftr_T_1) @[ALU.scala 34:36]
    node _shiftr_T_2 = cat(shiftr_hi, shin) @[Cat.scala 30:58]
    node _shiftr_T_3 = asSInt(_shiftr_T_2) @[ALU.scala 34:57]
    node _shiftr_T_4 = dshr(_shiftr_T_3, shamt) @[ALU.scala 34:64]
    node shiftr = bits(_shiftr_T_4, 31, 0) @[ALU.scala 34:73]
    node _shiftl_T = shl(UInt<16>("hffff"), 16) @[Bitwise.scala 102:47]
    node _shiftl_T_1 = xor(UInt<32>("hffffffff"), _shiftl_T) @[Bitwise.scala 102:21]
    node _shiftl_T_2 = shr(shiftr, 16) @[Bitwise.scala 103:21]
    node _shiftl_T_3 = and(_shiftl_T_2, _shiftl_T_1) @[Bitwise.scala 103:31]
    node _shiftl_T_4 = bits(shiftr, 15, 0) @[Bitwise.scala 103:46]
    node _shiftl_T_5 = shl(_shiftl_T_4, 16) @[Bitwise.scala 103:65]
    node _shiftl_T_6 = not(_shiftl_T_1) @[Bitwise.scala 103:77]
    node _shiftl_T_7 = and(_shiftl_T_5, _shiftl_T_6) @[Bitwise.scala 103:75]
    node _shiftl_T_8 = or(_shiftl_T_3, _shiftl_T_7) @[Bitwise.scala 103:39]
    node _shiftl_T_9 = bits(_shiftl_T_1, 23, 0) @[Bitwise.scala 102:28]
    node _shiftl_T_10 = shl(_shiftl_T_9, 8) @[Bitwise.scala 102:47]
    node _shiftl_T_11 = xor(_shiftl_T_1, _shiftl_T_10) @[Bitwise.scala 102:21]
    node _shiftl_T_12 = shr(_shiftl_T_8, 8) @[Bitwise.scala 103:21]
    node _shiftl_T_13 = and(_shiftl_T_12, _shiftl_T_11) @[Bitwise.scala 103:31]
    node _shiftl_T_14 = bits(_shiftl_T_8, 23, 0) @[Bitwise.scala 103:46]
    node _shiftl_T_15 = shl(_shiftl_T_14, 8) @[Bitwise.scala 103:65]
    node _shiftl_T_16 = not(_shiftl_T_11) @[Bitwise.scala 103:77]
    node _shiftl_T_17 = and(_shiftl_T_15, _shiftl_T_16) @[Bitwise.scala 103:75]
    node _shiftl_T_18 = or(_shiftl_T_13, _shiftl_T_17) @[Bitwise.scala 103:39]
    node _shiftl_T_19 = bits(_shiftl_T_11, 27, 0) @[Bitwise.scala 102:28]
    node _shiftl_T_20 = shl(_shiftl_T_19, 4) @[Bitwise.scala 102:47]
    node _shiftl_T_21 = xor(_shiftl_T_11, _shiftl_T_20) @[Bitwise.scala 102:21]
    node _shiftl_T_22 = shr(_shiftl_T_18, 4) @[Bitwise.scala 103:21]
    node _shiftl_T_23 = and(_shiftl_T_22, _shiftl_T_21) @[Bitwise.scala 103:31]
    node _shiftl_T_24 = bits(_shiftl_T_18, 27, 0) @[Bitwise.scala 103:46]
    node _shiftl_T_25 = shl(_shiftl_T_24, 4) @[Bitwise.scala 103:65]
    node _shiftl_T_26 = not(_shiftl_T_21) @[Bitwise.scala 103:77]
    node _shiftl_T_27 = and(_shiftl_T_25, _shiftl_T_26) @[Bitwise.scala 103:75]
    node _shiftl_T_28 = or(_shiftl_T_23, _shiftl_T_27) @[Bitwise.scala 103:39]
    node _shiftl_T_29 = bits(_shiftl_T_21, 29, 0) @[Bitwise.scala 102:28]
    node _shiftl_T_30 = shl(_shiftl_T_29, 2) @[Bitwise.scala 102:47]
    node _shiftl_T_31 = xor(_shiftl_T_21, _shiftl_T_30) @[Bitwise.scala 102:21]
    node _shiftl_T_32 = shr(_shiftl_T_28, 2) @[Bitwise.scala 103:21]
    node _shiftl_T_33 = and(_shiftl_T_32, _shiftl_T_31) @[Bitwise.scala 103:31]
    node _shiftl_T_34 = bits(_shiftl_T_28, 29, 0) @[Bitwise.scala 103:46]
    node _shiftl_T_35 = shl(_shiftl_T_34, 2) @[Bitwise.scala 103:65]
    node _shiftl_T_36 = not(_shiftl_T_31) @[Bitwise.scala 103:77]
    node _shiftl_T_37 = and(_shiftl_T_35, _shiftl_T_36) @[Bitwise.scala 103:75]
    node _shiftl_T_38 = or(_shiftl_T_33, _shiftl_T_37) @[Bitwise.scala 103:39]
    node _shiftl_T_39 = bits(_shiftl_T_31, 30, 0) @[Bitwise.scala 102:28]
    node _shiftl_T_40 = shl(_shiftl_T_39, 1) @[Bitwise.scala 102:47]
    node _shiftl_T_41 = xor(_shiftl_T_31, _shiftl_T_40) @[Bitwise.scala 102:21]
    node _shiftl_T_42 = shr(_shiftl_T_38, 1) @[Bitwise.scala 103:21]
    node _shiftl_T_43 = and(_shiftl_T_42, _shiftl_T_41) @[Bitwise.scala 103:31]
    node _shiftl_T_44 = bits(_shiftl_T_38, 30, 0) @[Bitwise.scala 103:46]
    node _shiftl_T_45 = shl(_shiftl_T_44, 1) @[Bitwise.scala 103:65]
    node _shiftl_T_46 = not(_shiftl_T_41) @[Bitwise.scala 103:77]
    node _shiftl_T_47 = and(_shiftl_T_45, _shiftl_T_46) @[Bitwise.scala 103:75]
    node shiftl = or(_shiftl_T_43, _shiftl_T_47) @[Bitwise.scala 103:39]
    node _T = eq(UInt<4>("h0"), io_alu_op) @[Conditional.scala 37:30]
    node _T_1 = eq(UInt<4>("h1"), io_alu_op) @[Conditional.scala 37:30]
    node _T_2 = eq(UInt<4>("h4"), io_alu_op) @[Conditional.scala 37:30]
    node _T_3 = lt(io_in_A, io_in_B) @[ALU.scala 47:29]
    node _GEN_0 = mux(_T_3, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[ALU.scala 47:48 ALU.scala 48:20 ALU.scala 51:20]
    node _T_4 = eq(UInt<4>("h6"), io_alu_op) @[Conditional.scala 37:30]
    node _T_5 = asUInt(io_in_A) @[ALU.scala 56:28]
    node _T_6 = asUInt(io_in_B) @[ALU.scala 56:47]
    node _T_7 = lt(_T_5, _T_6) @[ALU.scala 56:31]
    node _GEN_1 = mux(_T_7, asSInt(UInt<2>("h1")), asSInt(UInt<1>("h0"))) @[ALU.scala 56:50 ALU.scala 57:20 ALU.scala 60:20]
    node _T_8 = eq(UInt<4>("hb"), io_alu_op) @[Conditional.scala 37:30]
    node _io_out_T = asSInt(shiftr) @[ALU.scala 65:30]
    node _T_9 = eq(UInt<4>("ha"), io_alu_op) @[Conditional.scala 37:30]
    node _io_out_T_1 = asSInt(shiftr) @[ALU.scala 68:24]
    node _T_10 = eq(UInt<4>("h2"), io_alu_op) @[Conditional.scala 37:30]
    node _io_out_T_2 = asSInt(shiftl) @[ALU.scala 72:31]
    node _T_11 = eq(UInt<4>("he"), io_alu_op) @[Conditional.scala 37:30]
    node _io_out_T_3 = and(io_in_A, io_in_B) @[ALU.scala 75:29]
    node _io_out_T_4 = asSInt(_io_out_T_3) @[ALU.scala 75:29]
    node _T_12 = eq(UInt<4>("hc"), io_alu_op) @[Conditional.scala 37:30]
    node _io_out_T_5 = or(io_in_A, io_in_B) @[ALU.scala 78:29]
    node _io_out_T_6 = asSInt(_io_out_T_5) @[ALU.scala 78:29]
    node _T_13 = eq(UInt<4>("h8"), io_alu_op) @[Conditional.scala 37:30]
    node _io_out_T_7 = xor(io_in_A, io_in_B) @[ALU.scala 81:29]
    node _io_out_T_8 = asSInt(_io_out_T_7) @[ALU.scala 81:29]
    node _GEN_2 = mux(_T_13, _io_out_T_8, asSInt(UInt<1>("h0"))) @[Conditional.scala 39:67 ALU.scala 81:15 ALU.scala 38:12]
    node _GEN_3 = mux(_T_12, _io_out_T_6, _GEN_2) @[Conditional.scala 39:67 ALU.scala 78:15]
    node _GEN_4 = mux(_T_11, _io_out_T_4, _GEN_3) @[Conditional.scala 39:67 ALU.scala 75:15]
    node _GEN_5 = mux(_T_10, _io_out_T_2, _GEN_4) @[Conditional.scala 39:67 ALU.scala 72:15]
    node _GEN_6 = mux(_T_9, _io_out_T_1, _GEN_5) @[Conditional.scala 39:67 ALU.scala 68:15]
    node _GEN_7 = mux(_T_8, _io_out_T, _GEN_6) @[Conditional.scala 39:67 ALU.scala 65:15]
    node _GEN_8 = mux(_T_4, _GEN_1, _GEN_7) @[Conditional.scala 39:67]
    node _GEN_9 = mux(_T_2, _GEN_0, _GEN_8) @[Conditional.scala 39:67]
    node _GEN_10 = mux(_T_1, sum, _GEN_9) @[Conditional.scala 39:67 ALU.scala 44:15]
    node _GEN_11 = mux(_T, sum, _GEN_10) @[Conditional.scala 40:58 ALU.scala 41:15]
    io_out <= _GEN_11

  module Branch_Control :
    input clock : Clock
    input reset : UInt<1>
    input io_fun3 : UInt<3>
    input io_ina : SInt<32>
    input io_inb : SInt<32>
    output io_br_taken : UInt<1>

    node _T = eq(UInt<1>("h0"), io_fun3) @[Conditional.scala 37:30]
    node _T_1 = eq(io_ina, io_inb) @[Branch.scala 16:24]
    node _GEN_0 = mux(_T_1, UInt<1>("h1"), UInt<1>("h0")) @[Branch.scala 16:34 Branch.scala 17:28 Branch.scala 20:28]
    node _T_2 = eq(UInt<1>("h1"), io_fun3) @[Conditional.scala 37:30]
    node _T_3 = neq(io_ina, io_inb) @[Branch.scala 25:25]
    node _GEN_1 = mux(_T_3, UInt<1>("h1"), UInt<1>("h0")) @[Branch.scala 25:36 Branch.scala 26:28 Branch.scala 29:28]
    node _T_4 = eq(UInt<3>("h4"), io_fun3) @[Conditional.scala 37:30]
    node _T_5 = lt(io_ina, io_inb) @[Branch.scala 33:24]
    node _GEN_2 = mux(_T_5, UInt<1>("h1"), UInt<1>("h0")) @[Branch.scala 33:32 Branch.scala 34:28 Branch.scala 37:28]
    node _T_6 = eq(UInt<3>("h5"), io_fun3) @[Conditional.scala 37:30]
    node _T_7 = geq(io_ina, io_inb) @[Branch.scala 41:24]
    node _GEN_3 = mux(_T_7, UInt<1>("h1"), UInt<1>("h0")) @[Branch.scala 41:33 Branch.scala 42:28 Branch.scala 45:28]
    node _T_8 = eq(UInt<3>("h6"), io_fun3) @[Conditional.scala 37:30]
    node _T_9 = lt(io_ina, io_inb) @[Branch.scala 49:24]
    node _GEN_4 = mux(_T_9, UInt<1>("h1"), UInt<1>("h0")) @[Branch.scala 49:32 Branch.scala 50:28 Branch.scala 53:28]
    node _T_10 = eq(UInt<3>("h7"), io_fun3) @[Conditional.scala 37:30]
    node _T_11 = geq(io_ina, io_inb) @[Branch.scala 58:24]
    node _GEN_5 = mux(_T_11, UInt<1>("h1"), UInt<1>("h0")) @[Branch.scala 58:33 Branch.scala 59:28 Branch.scala 62:28]
    node _GEN_6 = mux(_T_10, _GEN_5, UInt<1>("h0")) @[Conditional.scala 39:67 Branch.scala 13:16]
    node _GEN_7 = mux(_T_8, _GEN_4, _GEN_6) @[Conditional.scala 39:67]
    node _GEN_8 = mux(_T_6, _GEN_3, _GEN_7) @[Conditional.scala 39:67]
    node _GEN_9 = mux(_T_4, _GEN_2, _GEN_8) @[Conditional.scala 39:67]
    node _GEN_10 = mux(_T_2, _GEN_1, _GEN_9) @[Conditional.scala 39:67]
    node _GEN_11 = mux(_T, _GEN_0, _GEN_10) @[Conditional.scala 40:58]
    io_br_taken <= _GEN_11

  module execute :
    input clock : Clock
    input reset : UInt<1>
    output io_out : SInt<32>
    output io_br_taken : UInt<1>
    input io_iform : UInt<1>
    input io_rform : UInt<1>
    input io_sform : UInt<1>
    input io_bform : UInt<1>
    input io_luiform : UInt<1>
    input io_Jalform : UInt<1>
    input io_jalrform : UInt<1>
    input io_lform : UInt<1>
    input io_Auipc : UInt<1>
    input io_lui_jal_jalr_auipc_imm : SInt<32>
    input io_immBits : UInt<12>
    input io_mem_wr_en : UInt<1>
    input io_wr_back : UInt<2>
    input io_br_fun3 : UInt<3>
    input io_load_storefun : UInt<3>
    input io_pcsel : UInt<1>
    input io_mem_r_en : UInt<1>
    input io_rs1 : SInt<32>
    input io_rs2 : SInt<32>
    input io_aluop : UInt<4>
    input io_pc_out : UInt<32>
    input io_imm_out : UInt<32>
    input io_RS1 : UInt<5>
    input io_RS2 : UInt<5>
    input io_Rd : UInt<5>
    input io_RegWr_en : UInt<1>
    output io_MemWen : UInt<1>
    output io_MemFun3 : UInt<3>
    output io_MemEnable : UInt<1>
    output io_MemDin : SInt<32>
    output io_MemToReg : UInt<2>
    output io_RDout : UInt<5>
    output io_RS2out : UInt<5>
    output io_RegWr_enout : UInt<1>
    output io_pco : UInt<32>
    output io_pcselout : UInt<1>

    inst alu of ALUS @[Execute.scala 57:21]
    inst B_control of Branch_Control @[Execute.scala 58:27]
    node _T = or(io_bform, io_Jalform) @[Execute.scala 64:19]
    node _alu_io_in_A_T = asSInt(io_pc_out) @[Execute.scala 65:39]
    node _GEN_0 = mux(_T, _alu_io_in_A_T, io_rs1) @[Execute.scala 64:32 Execute.scala 65:20 Execute.scala 68:17]
    node _T_1 = or(io_luiform, io_Jalform) @[Execute.scala 75:24]
    node _T_2 = or(_T_1, io_jalrform) @[Execute.scala 75:36]
    node _T_3 = or(_T_2, io_Auipc) @[Execute.scala 75:49]
    node _T_4 = or(_T_3, io_bform) @[Execute.scala 75:59]
    node _alu_io_in_B_T = asSInt(io_imm_out) @[Execute.scala 79:39]
    node _GEN_1 = mux(_T_4, io_lui_jal_jalr_auipc_imm, _alu_io_in_B_T) @[Execute.scala 75:70 Execute.scala 76:24 Execute.scala 79:20]
    node _GEN_2 = mux(io_rform, io_rs2, _GEN_1) @[Execute.scala 71:19 Execute.scala 72:16]
    io_out <= alu.io_out @[Execute.scala 84:11]
    io_br_taken <= B_control.io_br_taken @[Execute.scala 89:16]
    io_MemWen <= io_mem_wr_en @[Execute.scala 91:14]
    io_MemFun3 <= io_load_storefun @[Execute.scala 92:15]
    io_MemEnable <= io_mem_r_en @[Execute.scala 93:17]
    io_MemDin <= io_rs2 @[Execute.scala 94:14]
    io_MemToReg <= io_wr_back @[Execute.scala 95:16]
    io_RDout <= io_Rd @[Execute.scala 62:13]
    io_RS2out <= io_RS2 @[Execute.scala 63:14]
    io_RegWr_enout <= io_RegWr_en @[Execute.scala 61:19]
    io_pco <= io_pc_out @[Execute.scala 96:11]
    io_pcselout <= io_pcsel @[Execute.scala 60:16]
    alu.clock <= clock
    alu.reset <= reset
    alu.io_in_A <= _GEN_0
    alu.io_in_B <= _GEN_2
    alu.io_alu_op <= io_aluop @[Execute.scala 83:18]
    B_control.clock <= clock
    B_control.reset <= reset
    B_control.io_fun3 <= io_br_fun3 @[Execute.scala 86:22]
    B_control.io_ina <= io_rs1 @[Execute.scala 87:21]
    B_control.io_inb <= io_rs2 @[Execute.scala 88:21]

  module Datamem :
    input clock : Clock
    input reset : UInt<1>
    input io_Wen : UInt<1>
    input io_addr : UInt<32>
    input io_Din : SInt<32>
    output io_Dout : SInt<32>
    input io_fun3 : UInt<3>
    input io_enable : UInt<1>

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
    node _data_0_T = bits(io_Din, 7, 0) @[DataMem.scala 21:20]
    node _data_0_T_1 = asSInt(_data_0_T) @[DataMem.scala 21:33]
    node _data_1_T = bits(io_Din, 15, 8) @[DataMem.scala 22:20]
    node _data_1_T_1 = asSInt(_data_1_T) @[DataMem.scala 22:34]
    node _data_2_T = bits(io_Din, 23, 16) @[DataMem.scala 23:20]
    node _data_2_T_1 = asSInt(_data_2_T) @[DataMem.scala 23:35]
    node _data_3_T = bits(io_Din, 31, 24) @[DataMem.scala 24:20]
    node _data_3_T_1 = asSInt(_data_3_T) @[DataMem.scala 24:35]
    node _T = eq(io_fun3, UInt<1>("h0")) @[DataMem.scala 37:18]
    node _T_1 = bits(io_addr, 1, 0) @[DataMem.scala 38:19]
    node _T_2 = eq(_T_1, UInt<1>("h0")) @[DataMem.scala 38:26]
    node _T_3 = bits(io_addr, 1, 0) @[DataMem.scala 43:25]
    node _T_4 = eq(_T_3, UInt<1>("h1")) @[DataMem.scala 43:32]
    node _data_1_T_2 = bits(io_Din, 7, 0) @[DataMem.scala 49:26]
    node _data_1_T_3 = asSInt(_data_1_T_2) @[DataMem.scala 49:39]
    node _T_5 = bits(io_addr, 1, 0) @[DataMem.scala 52:25]
    node _T_6 = eq(_T_5, UInt<2>("h2")) @[DataMem.scala 52:32]
    node _data_2_T_2 = bits(io_Din, 7, 0) @[DataMem.scala 58:26]
    node _data_2_T_3 = asSInt(_data_2_T_2) @[DataMem.scala 58:39]
    node _T_7 = bits(io_addr, 1, 0) @[DataMem.scala 61:25]
    node _T_8 = eq(_T_7, UInt<2>("h3")) @[DataMem.scala 61:32]
    node _data_3_T_2 = bits(io_Din, 7, 0) @[DataMem.scala 67:26]
    node _data_3_T_3 = asSInt(_data_3_T_2) @[DataMem.scala 67:39]
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
    node _data_1_T_4 = bits(io_Din, 7, 0) @[DataMem.scala 84:28]
    node _data_1_T_5 = asSInt(_data_1_T_4) @[DataMem.scala 84:41]
    node _data_2_T_4 = bits(io_Din, 15, 8) @[DataMem.scala 85:28]
    node _data_2_T_5 = asSInt(_data_2_T_4) @[DataMem.scala 85:42]
    node _T_14 = bits(io_addr, 1, 0) @[DataMem.scala 88:27]
    node _T_15 = eq(_T_14, UInt<2>("h2")) @[DataMem.scala 88:34]
    node _data_2_T_6 = bits(io_Din, 7, 0) @[DataMem.scala 94:28]
    node _data_2_T_7 = asSInt(_data_2_T_6) @[DataMem.scala 94:41]
    node _data_3_T_4 = bits(io_Din, 15, 8) @[DataMem.scala 95:28]
    node _data_3_T_5 = asSInt(_data_3_T_4) @[DataMem.scala 95:42]
    node _T_16 = bits(io_addr, 1, 0) @[DataMem.scala 98:27]
    node _T_17 = eq(_T_16, UInt<2>("h3")) @[DataMem.scala 98:34]
    node _data_3_T_6 = bits(io_Din, 7, 0) @[DataMem.scala 104:28]
    node _data_3_T_7 = asSInt(_data_3_T_6) @[DataMem.scala 104:41]
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
    node _GEN_67 = mux(io_Wen, UInt<1>("h1"), UInt<1>("h0")) @[DataMem.scala 36:16 DataMem.scala 115:15 DataMem.scala 31:11]
    node mask_0 = _GEN_67 @[DataMem.scala 15:18]
    node data_0 = _data_0_T_1 @[DataMem.scala 16:18 DataMem.scala 21:11]
    node _GEN_59 = validif(mask_0, data_0)
    node _GEN_60 = mux(mask_0, UInt<1>("h1"), UInt<1>("h0"))
    node _GEN_68 = mux(io_Wen, UInt<1>("h0"), UInt<1>("h0")) @[DataMem.scala 36:16 DataMem.scala 116:15 DataMem.scala 32:11]
    node mask_1 = _GEN_68 @[DataMem.scala 15:18]
    node _GEN_69 = mux(io_Wen, _GEN_56, _data_1_T_1) @[DataMem.scala 36:16 DataMem.scala 22:11]
    node data_1 = _GEN_69 @[DataMem.scala 16:18]
    node _GEN_61 = validif(mask_1, data_1)
    node _GEN_62 = mux(mask_1, UInt<1>("h1"), UInt<1>("h0"))
    node mask_2 = _GEN_68 @[DataMem.scala 15:18]
    node _GEN_70 = mux(io_Wen, _GEN_57, _data_2_T_1) @[DataMem.scala 36:16 DataMem.scala 23:11]
    node data_2 = _GEN_70 @[DataMem.scala 16:18]
    node _GEN_63 = validif(mask_2, data_2)
    node _GEN_64 = mux(mask_2, UInt<1>("h1"), UInt<1>("h0"))
    node mask_3 = _GEN_68 @[DataMem.scala 15:18]
    node _GEN_71 = mux(io_Wen, _GEN_58, _data_3_T_1) @[DataMem.scala 36:16 DataMem.scala 24:11]
    node data_3 = _GEN_71 @[DataMem.scala 16:18]
    node _GEN_65 = validif(mask_3, data_3)
    node _GEN_66 = mux(mask_3, UInt<1>("h1"), UInt<1>("h0"))
    node _GEN_72 = validif(io_Wen, _T_20) @[DataMem.scala 36:16]
    node _GEN_73 = validif(io_Wen, clock) @[DataMem.scala 36:16]
    node _GEN_74 = validif(io_Wen, _GEN_60) @[DataMem.scala 36:16]
    node _GEN_75 = validif(io_Wen, _GEN_62) @[DataMem.scala 36:16]
    node _GEN_76 = validif(io_Wen, _GEN_64) @[DataMem.scala 36:16]
    node _GEN_77 = validif(io_Wen, _GEN_66) @[DataMem.scala 36:16]
    node _GEN_78 = validif(io_Wen, _GEN_59) @[DataMem.scala 36:16]
    node _GEN_79 = validif(io_Wen, _GEN_61) @[DataMem.scala 36:16]
    node _GEN_80 = validif(io_Wen, _GEN_63) @[DataMem.scala 36:16]
    node _GEN_81 = validif(io_Wen, _GEN_65) @[DataMem.scala 36:16]
    node _T_21 = bits(io_addr, 31, 2) @[DataMem.scala 124:34]
    node _T_22 = bits(_T_21, 9, 0) @[DataMem.scala 124:26]
    node _T_23 = bits(io_addr, 31, 2) @[DataMem.scala 126:34]
    node _T_24 = bits(_T_23, 9, 0) @[DataMem.scala 126:26]
    node _T_25 = eq(io_fun3, UInt<1>("h0")) @[DataMem.scala 127:16]
    node _T_26 = bits(io_addr, 1, 0) @[DataMem.scala 128:17]
    node _T_27 = eq(_T_26, UInt<1>("h0")) @[DataMem.scala 128:23]
    node _GEN_96 = mux(io_enable, memory_0.MPORT_2.data, memory_0.MPORT_1.data) @[DataMem.scala 125:18 DataMem.scala 126:12 DataMem.scala 124:12]
    node tempread_0 = _GEN_96 @[DataMem.scala 17:22]
    node _io_Dout_T = bits(tempread_0, 7, 7) @[DataMem.scala 129:39]
    node _io_Dout_T_1 = bits(_io_Dout_T, 0, 0) @[Bitwise.scala 72:15]
    node io_Dout_hi = mux(_io_Dout_T_1, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 72:12]
    node io_Dout_lo = asUInt(tempread_0) @[Cat.scala 30:58]
    node _io_Dout_T_2 = cat(io_Dout_hi, io_Dout_lo) @[Cat.scala 30:58]
    node _io_Dout_T_3 = asSInt(_io_Dout_T_2) @[DataMem.scala 129:63]
    node _T_28 = bits(io_addr, 1, 0) @[DataMem.scala 130:22]
    node _T_29 = eq(_T_28, UInt<1>("h1")) @[DataMem.scala 130:27]
    node _GEN_97 = mux(io_enable, memory_1.MPORT_2.data, memory_1.MPORT_1.data) @[DataMem.scala 125:18 DataMem.scala 126:12 DataMem.scala 124:12]
    node tempread_1 = _GEN_97 @[DataMem.scala 17:22]
    node _io_Dout_T_4 = bits(tempread_1, 7, 7) @[DataMem.scala 131:39]
    node _io_Dout_T_5 = bits(_io_Dout_T_4, 0, 0) @[Bitwise.scala 72:15]
    node io_Dout_hi_1 = mux(_io_Dout_T_5, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 72:12]
    node io_Dout_lo_1 = asUInt(tempread_1) @[Cat.scala 30:58]
    node _io_Dout_T_6 = cat(io_Dout_hi_1, io_Dout_lo_1) @[Cat.scala 30:58]
    node _io_Dout_T_7 = asSInt(_io_Dout_T_6) @[DataMem.scala 131:63]
    node _T_30 = bits(io_addr, 1, 0) @[DataMem.scala 132:22]
    node _T_31 = eq(_T_30, UInt<2>("h2")) @[DataMem.scala 132:27]
    node _GEN_98 = mux(io_enable, memory_2.MPORT_2.data, memory_2.MPORT_1.data) @[DataMem.scala 125:18 DataMem.scala 126:12 DataMem.scala 124:12]
    node tempread_2 = _GEN_98 @[DataMem.scala 17:22]
    node _io_Dout_T_8 = bits(tempread_2, 7, 7) @[DataMem.scala 133:39]
    node _io_Dout_T_9 = bits(_io_Dout_T_8, 0, 0) @[Bitwise.scala 72:15]
    node io_Dout_hi_2 = mux(_io_Dout_T_9, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 72:12]
    node io_Dout_lo_2 = asUInt(tempread_2) @[Cat.scala 30:58]
    node _io_Dout_T_10 = cat(io_Dout_hi_2, io_Dout_lo_2) @[Cat.scala 30:58]
    node _io_Dout_T_11 = asSInt(_io_Dout_T_10) @[DataMem.scala 133:63]
    node _T_32 = bits(io_addr, 1, 0) @[DataMem.scala 134:22]
    node _T_33 = eq(_T_32, UInt<2>("h3")) @[DataMem.scala 134:27]
    node _GEN_99 = mux(io_enable, memory_3.MPORT_2.data, memory_3.MPORT_1.data) @[DataMem.scala 125:18 DataMem.scala 126:12 DataMem.scala 124:12]
    node tempread_3 = _GEN_99 @[DataMem.scala 17:22]
    node _io_Dout_T_12 = bits(tempread_3, 7, 7) @[DataMem.scala 135:39]
    node _io_Dout_T_13 = bits(_io_Dout_T_12, 0, 0) @[Bitwise.scala 72:15]
    node io_Dout_hi_3 = mux(_io_Dout_T_13, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 72:12]
    node io_Dout_lo_3 = asUInt(tempread_3) @[Cat.scala 30:58]
    node _io_Dout_T_14 = cat(io_Dout_hi_3, io_Dout_lo_3) @[Cat.scala 30:58]
    node _io_Dout_T_15 = asSInt(_io_Dout_T_14) @[DataMem.scala 135:63]
    node _GEN_82 = mux(_T_33, _io_Dout_T_15, asSInt(UInt<1>("h0"))) @[DataMem.scala 134:35 DataMem.scala 135:13 DataMem.scala 19:11]
    node _GEN_83 = mux(_T_31, _io_Dout_T_11, _GEN_82) @[DataMem.scala 132:35 DataMem.scala 133:13]
    node _GEN_84 = mux(_T_29, _io_Dout_T_7, _GEN_83) @[DataMem.scala 130:35 DataMem.scala 131:13]
    node _GEN_85 = mux(_T_27, _io_Dout_T_3, _GEN_84) @[DataMem.scala 128:31 DataMem.scala 129:13]
    node _T_34 = eq(io_fun3, UInt<1>("h1")) @[DataMem.scala 137:22]
    node _T_35 = bits(io_addr, 1, 0) @[DataMem.scala 138:17]
    node _T_36 = eq(_T_35, UInt<1>("h0")) @[DataMem.scala 138:23]
    node _io_Dout_T_16 = bits(tempread_0, 7, 7) @[DataMem.scala 139:39]
    node _io_Dout_T_17 = bits(_io_Dout_T_16, 0, 0) @[Bitwise.scala 72:15]
    node io_Dout_hi_hi = mux(_io_Dout_T_17, UInt<16>("hffff"), UInt<16>("h0")) @[Bitwise.scala 72:12]
    node io_Dout_lo_4 = asUInt(tempread_1) @[Cat.scala 30:58]
    node io_Dout_hi_lo = asUInt(tempread_0) @[Cat.scala 30:58]
    node io_Dout_hi_4 = cat(io_Dout_hi_hi, io_Dout_hi_lo) @[Cat.scala 30:58]
    node _io_Dout_T_18 = cat(io_Dout_hi_4, io_Dout_lo_4) @[Cat.scala 30:58]
    node _io_Dout_T_19 = asSInt(_io_Dout_T_18) @[DataMem.scala 139:75]
    node _T_37 = bits(io_addr, 1, 0) @[DataMem.scala 140:22]
    node _T_38 = eq(_T_37, UInt<1>("h1")) @[DataMem.scala 140:27]
    node _io_Dout_T_20 = bits(tempread_1, 7, 7) @[DataMem.scala 141:39]
    node _io_Dout_T_21 = bits(_io_Dout_T_20, 0, 0) @[Bitwise.scala 72:15]
    node io_Dout_hi_hi_1 = mux(_io_Dout_T_21, UInt<16>("hffff"), UInt<16>("h0")) @[Bitwise.scala 72:12]
    node io_Dout_lo_5 = asUInt(tempread_2) @[Cat.scala 30:58]
    node io_Dout_hi_lo_1 = asUInt(tempread_1) @[Cat.scala 30:58]
    node io_Dout_hi_5 = cat(io_Dout_hi_hi_1, io_Dout_hi_lo_1) @[Cat.scala 30:58]
    node _io_Dout_T_22 = cat(io_Dout_hi_5, io_Dout_lo_5) @[Cat.scala 30:58]
    node _io_Dout_T_23 = asSInt(_io_Dout_T_22) @[DataMem.scala 141:75]
    node _T_39 = bits(io_addr, 1, 0) @[DataMem.scala 142:22]
    node _T_40 = eq(_T_39, UInt<2>("h2")) @[DataMem.scala 142:27]
    node _io_Dout_T_24 = bits(tempread_2, 7, 7) @[DataMem.scala 143:39]
    node _io_Dout_T_25 = bits(_io_Dout_T_24, 0, 0) @[Bitwise.scala 72:15]
    node io_Dout_hi_hi_2 = mux(_io_Dout_T_25, UInt<16>("hffff"), UInt<16>("h0")) @[Bitwise.scala 72:12]
    node io_Dout_lo_6 = asUInt(tempread_3) @[Cat.scala 30:58]
    node io_Dout_hi_lo_2 = asUInt(tempread_2) @[Cat.scala 30:58]
    node io_Dout_hi_6 = cat(io_Dout_hi_hi_2, io_Dout_hi_lo_2) @[Cat.scala 30:58]
    node _io_Dout_T_26 = cat(io_Dout_hi_6, io_Dout_lo_6) @[Cat.scala 30:58]
    node _io_Dout_T_27 = asSInt(_io_Dout_T_26) @[DataMem.scala 143:75]
    node _T_41 = bits(io_addr, 1, 0) @[DataMem.scala 144:22]
    node _T_42 = eq(_T_41, UInt<2>("h3")) @[DataMem.scala 144:27]
    node _io_Dout_T_28 = bits(tempread_3, 7, 7) @[DataMem.scala 145:39]
    node _io_Dout_T_29 = bits(_io_Dout_T_28, 0, 0) @[Bitwise.scala 72:15]
    node io_Dout_hi_7 = mux(_io_Dout_T_29, UInt<24>("hffffff"), UInt<24>("h0")) @[Bitwise.scala 72:12]
    node io_Dout_lo_7 = asUInt(tempread_3) @[Cat.scala 30:58]
    node _io_Dout_T_30 = cat(io_Dout_hi_7, io_Dout_lo_7) @[Cat.scala 30:58]
    node _io_Dout_T_31 = asSInt(_io_Dout_T_30) @[DataMem.scala 145:63]
    node _GEN_86 = mux(_T_42, _io_Dout_T_31, asSInt(UInt<1>("h0"))) @[DataMem.scala 144:35 DataMem.scala 145:13 DataMem.scala 19:11]
    node _GEN_87 = mux(_T_40, _io_Dout_T_27, _GEN_86) @[DataMem.scala 142:35 DataMem.scala 143:13]
    node _GEN_88 = mux(_T_38, _io_Dout_T_23, _GEN_87) @[DataMem.scala 140:35 DataMem.scala 141:13]
    node _GEN_89 = mux(_T_36, _io_Dout_T_19, _GEN_88) @[DataMem.scala 138:31 DataMem.scala 139:13]
    node _T_43 = eq(io_fun3, UInt<2>("h2")) @[DataMem.scala 147:22]
    node io_Dout_lo_lo = asUInt(tempread_0) @[Cat.scala 30:58]
    node io_Dout_lo_hi = asUInt(tempread_1) @[Cat.scala 30:58]
    node io_Dout_lo_8 = cat(io_Dout_lo_hi, io_Dout_lo_lo) @[Cat.scala 30:58]
    node io_Dout_hi_lo_3 = asUInt(tempread_2) @[Cat.scala 30:58]
    node io_Dout_hi_hi_3 = asUInt(tempread_3) @[Cat.scala 30:58]
    node io_Dout_hi_8 = cat(io_Dout_hi_hi_3, io_Dout_hi_lo_3) @[Cat.scala 30:58]
    node _io_Dout_T_32 = cat(io_Dout_hi_8, io_Dout_lo_8) @[Cat.scala 30:58]
    node _io_Dout_T_33 = asSInt(_io_Dout_T_32) @[DataMem.scala 148:78]
    node _GEN_90 = mux(_T_43, _io_Dout_T_33, asSInt(UInt<1>("h0"))) @[DataMem.scala 147:31 DataMem.scala 148:13 DataMem.scala 19:11]
    node _GEN_91 = mux(_T_34, _GEN_89, _GEN_90) @[DataMem.scala 137:31]
    node _GEN_92 = mux(_T_25, _GEN_85, _GEN_91) @[DataMem.scala 127:25]
    node _GEN_93 = validif(io_enable, _T_24) @[DataMem.scala 125:18 DataMem.scala 126:26]
    node _GEN_94 = validif(io_enable, clock) @[DataMem.scala 125:18 DataMem.scala 126:26]
    node _GEN_95 = mux(io_enable, UInt<1>("h1"), UInt<1>("h0")) @[DataMem.scala 125:18 DataMem.scala 126:26 DataMem.scala 14:19]
    node _GEN_100 = mux(io_enable, _GEN_92, asSInt(UInt<1>("h0"))) @[DataMem.scala 125:18 DataMem.scala 19:11]
    io_Dout <= _GEN_100
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

  module memory :
    input clock : Clock
    input reset : UInt<1>
    input io_out : SInt<32>
    input io_br_taken : UInt<1>
    input io_Wen : UInt<1>
    input io_Fun3 : UInt<3>
    input io_Enable : UInt<1>
    input io_Din : SInt<32>
    input io_MemToReg : UInt<2>
    input io_RDout : UInt<5>
    input io_RS2out : UInt<5>
    input io_RegWr_enout : UInt<1>
    input io_pco : UInt<32>
    input io_pcselout : UInt<1>
    output io_RegWr_enOut : UInt<1>
    output io_memtoreg : UInt<2>
    output io_RDsel : UInt<5>
    output io_Memrd : UInt<1>
    output io_Dout : SInt<32>
    output io_alu_out : SInt<32>
    output io_pcout : UInt<32>
    output io_brtaken : UInt<1>
    output io_pcsel : UInt<1>

    inst D_Mem of Datamem @[Memory.scala 39:23]
    node _D_Mem_io_addr_T = asUInt(io_out) @[Memory.scala 44:33]
    io_RegWr_enOut <= io_RegWr_enout @[Memory.scala 51:19]
    io_memtoreg <= io_MemToReg @[Memory.scala 52:16]
    io_RDsel <= io_RDout @[Memory.scala 53:13]
    io_Memrd <= io_Enable @[Memory.scala 54:13]
    io_Dout <= D_Mem.io_Dout @[Memory.scala 49:12]
    io_alu_out <= io_out @[Memory.scala 55:15]
    io_pcout <= io_pco @[Memory.scala 40:13]
    io_brtaken <= io_br_taken @[Memory.scala 57:15]
    io_pcsel <= io_pcselout @[Memory.scala 41:13]
    D_Mem.clock <= clock
    D_Mem.reset <= reset
    D_Mem.io_Wen <= io_Wen @[Memory.scala 43:17]
    D_Mem.io_addr <= _D_Mem_io_addr_T @[Memory.scala 44:18]
    D_Mem.io_Din <= io_Din @[Memory.scala 45:17]
    D_Mem.io_fun3 <= io_Fun3 @[Memory.scala 46:18]
    D_Mem.io_enable <= io_Enable @[Memory.scala 47:20]

  module Write_back :
    input clock : Clock
    input reset : UInt<1>
    input io_RegWr_enOut : UInt<1>
    input io_memtoreg : UInt<2>
    input io_RDsel : UInt<5>
    input io_Memrd : UInt<1>
    input io_Dout : SInt<32>
    input io_alu_out : SInt<32>
    input io_pcout : UInt<32>
    input io_brtaken : UInt<1>
    input io_pcsel : UInt<1>
    output io_Rd : SInt<32>
    output io_br_taken : UInt<1>
    output io_RDselout : UInt<5>
    output io_aluout : SInt<32>
    output io_pcselout : UInt<1>
    output io_RegWr_enout : UInt<1>

    node _T = eq(io_memtoreg, UInt<1>("h0")) @[Write_back.scala 28:21]
    node _T_1 = eq(io_memtoreg, UInt<1>("h1")) @[Write_back.scala 32:25]
    node _T_2 = eq(io_memtoreg, UInt<2>("h2")) @[Write_back.scala 35:25]
    node _io_Rd_T = add(io_pcout, UInt<3>("h4")) @[Write_back.scala 36:22]
    node _io_Rd_T_1 = tail(_io_Rd_T, 1) @[Write_back.scala 36:22]
    node _io_Rd_T_2 = asSInt(_io_Rd_T_1) @[Write_back.scala 36:34]
    node _GEN_0 = mux(_T_2, _io_Rd_T_2, asSInt(UInt<1>("h0"))) @[Write_back.scala 35:32 Write_back.scala 36:10 Write_back.scala 39:10]
    node _GEN_1 = mux(_T_1, io_alu_out, _GEN_0) @[Write_back.scala 32:32 Write_back.scala 33:10]
    node _GEN_2 = mux(_T, io_Dout, _GEN_1) @[Write_back.scala 28:28 Write_back.scala 29:10]
    io_Rd <= _GEN_2
    io_br_taken <= UInt<1>("h0") @[Write_back.scala 24:16]
    io_RDselout <= io_RDsel @[Write_back.scala 41:15]
    io_aluout <= io_alu_out @[Write_back.scala 25:14]
    io_pcselout <= io_pcsel @[Write_back.scala 26:16]
    io_RegWr_enout <= io_RegWr_enOut @[Write_back.scala 27:19]

  module Forwarding :
    input clock : Clock
    input reset : UInt<1>
    input io_IDEXrs1 : UInt<5>
    input io_IDEXrs2 : UInt<5>
    input io_ExMemRd : UInt<5>
    input io_ExMemRegWr_en : UInt<1>
    input io_MemWbRegWr_en : UInt<1>
    output io_Fa : UInt<2>
    output io_Fb : UInt<2>
    input io_MemWbRd : UInt<5>

    node _T = eq(io_ExMemRegWr_en, UInt<1>("h1")) @[Forwarding.scala 21:27]
    node _T_1 = neq(io_ExMemRd, UInt<1>("h0")) @[Forwarding.scala 21:49]
    node _T_2 = and(_T, _T_1) @[Forwarding.scala 21:35]
    node _T_3 = eq(io_ExMemRd, io_IDEXrs1) @[Forwarding.scala 21:71]
    node _T_4 = and(_T_2, _T_3) @[Forwarding.scala 21:57]
    node _T_5 = eq(io_ExMemRd, io_IDEXrs2) @[Forwarding.scala 21:100]
    node _T_6 = and(_T_4, _T_5) @[Forwarding.scala 21:86]
    node _T_7 = eq(io_ExMemRegWr_en, UInt<1>("h1")) @[Forwarding.scala 25:32]
    node _T_8 = neq(io_ExMemRd, UInt<1>("h0")) @[Forwarding.scala 25:54]
    node _T_9 = and(_T_7, _T_8) @[Forwarding.scala 25:40]
    node _T_10 = eq(io_ExMemRd, io_IDEXrs1) @[Forwarding.scala 25:76]
    node _T_11 = and(_T_9, _T_10) @[Forwarding.scala 25:62]
    node _T_12 = eq(io_ExMemRegWr_en, UInt<1>("h1")) @[Forwarding.scala 28:32]
    node _T_13 = neq(io_ExMemRd, UInt<1>("h0")) @[Forwarding.scala 28:54]
    node _T_14 = and(_T_12, _T_13) @[Forwarding.scala 28:40]
    node _T_15 = eq(io_ExMemRd, io_IDEXrs2) @[Forwarding.scala 28:76]
    node _T_16 = and(_T_14, _T_15) @[Forwarding.scala 28:62]
    node _GEN_0 = mux(_T_16, UInt<1>("h1"), UInt<1>("h0")) @[Forwarding.scala 28:91 Forwarding.scala 29:14 Forwarding.scala 19:10]
    node _GEN_1 = mux(_T_11, UInt<1>("h1"), UInt<1>("h0")) @[Forwarding.scala 25:91 Forwarding.scala 26:14 Forwarding.scala 18:10]
    node _GEN_2 = mux(_T_11, UInt<1>("h0"), _GEN_0) @[Forwarding.scala 25:91 Forwarding.scala 19:10]
    node _GEN_3 = mux(_T_6, UInt<1>("h1"), _GEN_1) @[Forwarding.scala 21:115 Forwarding.scala 22:14]
    node _GEN_4 = mux(_T_6, UInt<1>("h1"), _GEN_2) @[Forwarding.scala 21:115 Forwarding.scala 23:14]
    node _T_17 = eq(io_MemWbRegWr_en, UInt<1>("h1")) @[Forwarding.scala 33:27]
    node _T_18 = neq(io_MemWbRd, UInt<1>("h0")) @[Forwarding.scala 33:48]
    node _T_19 = and(_T_17, _T_18) @[Forwarding.scala 33:35]
    node _T_20 = eq(io_MemWbRd, io_IDEXrs1) @[Forwarding.scala 33:69]
    node _T_21 = and(_T_19, _T_20) @[Forwarding.scala 33:55]
    node _T_22 = eq(io_MemWbRd, io_IDEXrs2) @[Forwarding.scala 33:98]
    node _T_23 = and(_T_21, _T_22) @[Forwarding.scala 33:84]
    node _T_24 = eq(io_MemWbRegWr_en, UInt<1>("h1")) @[Forwarding.scala 37:32]
    node _T_25 = neq(io_MemWbRd, UInt<1>("h0")) @[Forwarding.scala 37:53]
    node _T_26 = and(_T_24, _T_25) @[Forwarding.scala 37:40]
    node _T_27 = eq(io_MemWbRd, io_IDEXrs1) @[Forwarding.scala 37:74]
    node _T_28 = and(_T_26, _T_27) @[Forwarding.scala 37:60]
    node _T_29 = eq(io_MemWbRegWr_en, UInt<1>("h1")) @[Forwarding.scala 40:32]
    node _T_30 = neq(io_MemWbRd, UInt<1>("h0")) @[Forwarding.scala 40:53]
    node _T_31 = and(_T_29, _T_30) @[Forwarding.scala 40:40]
    node _T_32 = eq(io_MemWbRd, io_IDEXrs2) @[Forwarding.scala 40:74]
    node _T_33 = and(_T_31, _T_32) @[Forwarding.scala 40:60]
    node _GEN_5 = mux(_T_33, UInt<2>("h2"), _GEN_4) @[Forwarding.scala 40:89 Forwarding.scala 41:14]
    node _GEN_6 = mux(_T_28, UInt<2>("h2"), _GEN_3) @[Forwarding.scala 37:89 Forwarding.scala 38:14]
    node _GEN_7 = mux(_T_28, _GEN_4, _GEN_5) @[Forwarding.scala 37:89]
    node _GEN_8 = mux(_T_23, UInt<2>("h2"), _GEN_6) @[Forwarding.scala 33:113 Forwarding.scala 34:14]
    node _GEN_9 = mux(_T_23, UInt<2>("h2"), _GEN_7) @[Forwarding.scala 33:113 Forwarding.scala 35:14]
    io_Fa <= _GEN_8
    io_Fb <= _GEN_9

  module TopModule :
    input clock : Clock
    input reset : UInt<1>
    input io_datain : UInt<32>
    output io_out : SInt<32>

    inst fetch of fetch @[TopModule.scala 13:23]
    inst decode of decode @[TopModule.scala 14:24]
    inst execute of execute @[TopModule.scala 15:25]
    inst memory of memory @[TopModule.scala 16:24]
    inst WriteBack of Write_back @[TopModule.scala 17:27]
    inst forward of Forwarding @[TopModule.scala 18:25]
    reg IF_IDins : UInt<32>, clock with :
      reset => (UInt<1>("h0"), IF_IDins) @[TopModule.scala 22:24]
    reg IF_IDpc : UInt<32>, clock with :
      reset => (UInt<1>("h0"), IF_IDpc) @[TopModule.scala 25:22]
    reg IF_IDpc4 : UInt<32>, clock with :
      reset => (UInt<1>("h0"), IF_IDpc4) @[TopModule.scala 28:23]
    reg ID_Exiform : UInt<1>, clock with :
      reset => (UInt<1>("h0"), ID_Exiform) @[TopModule.scala 33:25]
    reg ID_Exrform : UInt<1>, clock with :
      reset => (UInt<1>("h0"), ID_Exrform) @[TopModule.scala 36:24]
    reg ID_Exsform : UInt<1>, clock with :
      reset => (UInt<1>("h0"), ID_Exsform) @[TopModule.scala 39:25]
    reg ID_Exbform : UInt<1>, clock with :
      reset => (UInt<1>("h0"), ID_Exbform) @[TopModule.scala 42:25]
    reg ID_Exluiform : UInt<1>, clock with :
      reset => (UInt<1>("h0"), ID_Exluiform) @[TopModule.scala 45:27]
    reg ID_Exjalform : UInt<1>, clock with :
      reset => (UInt<1>("h0"), ID_Exjalform) @[TopModule.scala 48:27]
    reg ID_Exjalrform : UInt<1>, clock with :
      reset => (UInt<1>("h0"), ID_Exjalrform) @[TopModule.scala 51:28]
    reg ID_Exlform : UInt<1>, clock with :
      reset => (UInt<1>("h0"), ID_Exlform) @[TopModule.scala 54:25]
    reg ID_ExAuipc : UInt<1>, clock with :
      reset => (UInt<1>("h0"), ID_ExAuipc) @[TopModule.scala 57:25]
    reg ID_Exlui_jal_jalr_auipc_imm : SInt<32>, clock with :
      reset => (UInt<1>("h0"), ID_Exlui_jal_jalr_auipc_imm) @[TopModule.scala 60:42]
    reg ID_EximmBits : UInt<12>, clock with :
      reset => (UInt<1>("h0"), ID_EximmBits) @[TopModule.scala 63:27]
    reg ID_Exmem_wr_en : UInt<1>, clock with :
      reset => (UInt<1>("h0"), ID_Exmem_wr_en) @[TopModule.scala 66:29]
    reg ID_Exwr_back : UInt<2>, clock with :
      reset => (UInt<1>("h0"), ID_Exwr_back) @[TopModule.scala 69:27]
    reg ID_Exbr_fun3 : UInt<3>, clock with :
      reset => (UInt<1>("h0"), ID_Exbr_fun3) @[TopModule.scala 72:27]
    reg ID_Exload_storefun : UInt<3>, clock with :
      reset => (UInt<1>("h0"), ID_Exload_storefun) @[TopModule.scala 75:33]
    reg ID_Expcsel : UInt<1>, clock with :
      reset => (UInt<1>("h0"), ID_Expcsel) @[TopModule.scala 78:25]
    reg ID_Exmem_r_en : UInt<1>, clock with :
      reset => (UInt<1>("h0"), ID_Exmem_r_en) @[TopModule.scala 81:28]
    node _T = eq(forward.io_Fa, UInt<1>("h0")) @[TopModule.scala 88:24]
    reg ID_Exrs1 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), ID_Exrs1) @[TopModule.scala 89:27]
    node _T_1 = eq(forward.io_Fa, UInt<1>("h1")) @[TopModule.scala 93:29]
    reg ID_Exrs1_1 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), ID_Exrs1_1) @[TopModule.scala 94:27]
    node _T_2 = eq(forward.io_Fa, UInt<2>("h2")) @[TopModule.scala 98:29]
    reg ID_Exrs1_2 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), ID_Exrs1_2) @[TopModule.scala 99:27]
    node _GEN_0 = mux(_T_2, ID_Exrs1_2, asSInt(UInt<1>("h0"))) @[TopModule.scala 98:37 TopModule.scala 101:23 TopModule.scala 85:19]
    node _GEN_1 = mux(_T_1, ID_Exrs1_1, _GEN_0) @[TopModule.scala 93:38 TopModule.scala 96:23]
    node _GEN_2 = mux(_T, ID_Exrs1, _GEN_1) @[TopModule.scala 88:33 TopModule.scala 91:23]
    node _T_3 = eq(forward.io_Fb, UInt<1>("h0")) @[TopModule.scala 104:24]
    reg ID_Exrs2 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), ID_Exrs2) @[TopModule.scala 105:27]
    node _T_4 = eq(forward.io_Fb, UInt<1>("h1")) @[TopModule.scala 109:29]
    reg ID_Exrs2_1 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), ID_Exrs2_1) @[TopModule.scala 110:27]
    node _T_5 = eq(forward.io_Fb, UInt<2>("h2")) @[TopModule.scala 114:29]
    reg ID_Exrs2_2 : SInt<32>, clock with :
      reset => (UInt<1>("h0"), ID_Exrs2_2) @[TopModule.scala 115:27]
    node _GEN_3 = mux(_T_5, ID_Exrs2_2, asSInt(UInt<1>("h0"))) @[TopModule.scala 114:37 TopModule.scala 117:23 TopModule.scala 86:19]
    node _GEN_4 = mux(_T_4, ID_Exrs2_1, _GEN_3) @[TopModule.scala 109:37 TopModule.scala 112:23]
    node _GEN_5 = mux(_T_3, ID_Exrs2, _GEN_4) @[TopModule.scala 104:32 TopModule.scala 107:23]
    reg ID_Exaluop : UInt<4>, clock with :
      reset => (UInt<1>("h0"), ID_Exaluop) @[TopModule.scala 119:25]
    reg ID_Expc_out : UInt<32>, clock with :
      reset => (UInt<1>("h0"), ID_Expc_out) @[TopModule.scala 122:26]
    reg ID_Eximm_out : UInt<32>, clock with :
      reset => (UInt<1>("h0"), ID_Eximm_out) @[TopModule.scala 125:27]
    reg ID_ExRS1 : UInt<5>, clock with :
      reset => (UInt<1>("h0"), ID_ExRS1) @[TopModule.scala 128:23]
    reg ID_ExRS2 : UInt<5>, clock with :
      reset => (UInt<1>("h0"), ID_ExRS2) @[TopModule.scala 132:23]
    reg ID_ExRd : UInt<5>, clock with :
      reset => (UInt<1>("h0"), ID_ExRd) @[TopModule.scala 136:22]
    reg ID_ExRegWr_en : UInt<5>, clock with :
      reset => (UInt<1>("h0"), ID_ExRegWr_en) @[TopModule.scala 139:28]
    reg ExMemMemWen : UInt<1>, clock with :
      reset => (UInt<1>("h0"), ExMemMemWen) @[TopModule.scala 144:25]
    reg ExMemFun3 : UInt<3>, clock with :
      reset => (UInt<1>("h0"), ExMemFun3) @[TopModule.scala 147:24]
    reg ExMemEnable : UInt<1>, clock with :
      reset => (UInt<1>("h0"), ExMemEnable) @[TopModule.scala 150:26]
    reg ExMemDin : SInt<32>, clock with :
      reset => (UInt<1>("h0"), ExMemDin) @[TopModule.scala 153:24]
    reg ExMemToReg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), ExMemToReg) @[TopModule.scala 156:25]
    reg ExMemRDout : UInt<5>, clock with :
      reset => (UInt<1>("h0"), ExMemRDout) @[TopModule.scala 159:25]
    reg ExMemRS2out : UInt<5>, clock with :
      reset => (UInt<1>("h0"), ExMemRS2out) @[TopModule.scala 163:25]
    reg ExMemRegWr_enout : UInt<1>, clock with :
      reset => (UInt<1>("h0"), ExMemRegWr_enout) @[TopModule.scala 166:31]
    reg ExMempco : UInt<32>, clock with :
      reset => (UInt<1>("h0"), ExMempco) @[TopModule.scala 170:23]
    reg ExMemout : SInt<32>, clock with :
      reset => (UInt<1>("h0"), ExMemout) @[TopModule.scala 173:23]
    reg ExMembr_taken : UInt<1>, clock with :
      reset => (UInt<1>("h0"), ExMembr_taken) @[TopModule.scala 176:28]
    reg ExMempcsel : UInt<1>, clock with :
      reset => (UInt<1>("h0"), ExMempcsel) @[TopModule.scala 179:25]
    reg MemWrbRegWr_enOut : UInt<1>, clock with :
      reset => (UInt<1>("h0"), MemWrbRegWr_enOut) @[TopModule.scala 184:32]
    reg MemWrbmemtoreg : UInt<2>, clock with :
      reset => (UInt<1>("h0"), MemWrbmemtoreg) @[TopModule.scala 188:29]
    reg MemWrbRDsel : UInt<5>, clock with :
      reset => (UInt<1>("h0"), MemWrbRDsel) @[TopModule.scala 191:26]
    reg MemWrbMemrd : UInt<1>, clock with :
      reset => (UInt<1>("h0"), MemWrbMemrd) @[TopModule.scala 195:26]
    reg MemWrbDout : SInt<32>, clock with :
      reset => (UInt<1>("h0"), MemWrbDout) @[TopModule.scala 198:25]
    reg MemWrbalu_out : SInt<32>, clock with :
      reset => (UInt<1>("h0"), MemWrbalu_out) @[TopModule.scala 201:28]
    reg MemWrbpcout : UInt<32>, clock with :
      reset => (UInt<1>("h0"), MemWrbpcout) @[TopModule.scala 204:26]
    reg MemWrbbrtaken : UInt<1>, clock with :
      reset => (UInt<1>("h0"), MemWrbbrtaken) @[TopModule.scala 207:26]
    reg MemWrbpcsel : UInt<1>, clock with :
      reset => (UInt<1>("h0"), MemWrbpcsel) @[TopModule.scala 210:26]
    io_out <= decode.io_din @[TopModule.scala 223:12]
    fetch.clock <= clock
    fetch.reset <= reset
    fetch.io_pcsel <= WriteBack.io_pcselout @[TopModule.scala 218:19]
    fetch.io_aluout <= WriteBack.io_aluout @[TopModule.scala 217:20]
    decode.clock <= clock
    decode.reset <= reset
    decode.io_ins <= IF_IDins @[TopModule.scala 24:18]
    decode.io_btaken <= WriteBack.io_br_taken @[TopModule.scala 214:21]
    decode.io_din <= WriteBack.io_Rd @[TopModule.scala 216:18]
    decode.io_pcout <= IF_IDpc @[TopModule.scala 27:20]
    decode.io_pc4out <= IF_IDpc4 @[TopModule.scala 30:21]
    decode.io_Wrbrd <= WriteBack.io_RDselout @[TopModule.scala 215:20]
    decode.io_RegWr_enWB <= WriteBack.io_RegWr_enout @[TopModule.scala 219:25]
    execute.clock <= clock
    execute.reset <= reset
    execute.io_iform <= ID_Exiform @[TopModule.scala 35:21]
    execute.io_rform <= ID_Exrform @[TopModule.scala 38:21]
    execute.io_sform <= ID_Exsform @[TopModule.scala 41:21]
    execute.io_bform <= ID_Exbform @[TopModule.scala 44:21]
    execute.io_luiform <= ID_Exluiform @[TopModule.scala 47:23]
    execute.io_Jalform <= ID_Exjalform @[TopModule.scala 50:23]
    execute.io_jalrform <= ID_Exjalrform @[TopModule.scala 53:24]
    execute.io_lform <= ID_Exlform @[TopModule.scala 56:21]
    execute.io_Auipc <= ID_ExAuipc @[TopModule.scala 59:21]
    execute.io_lui_jal_jalr_auipc_imm <= ID_Exlui_jal_jalr_auipc_imm @[TopModule.scala 62:38]
    execute.io_immBits <= ID_EximmBits @[TopModule.scala 65:23]
    execute.io_mem_wr_en <= ID_Exmem_wr_en @[TopModule.scala 68:25]
    execute.io_wr_back <= ID_Exwr_back @[TopModule.scala 71:23]
    execute.io_br_fun3 <= ID_Exbr_fun3 @[TopModule.scala 74:23]
    execute.io_load_storefun <= ID_Exload_storefun @[TopModule.scala 77:29]
    execute.io_pcsel <= ID_Expcsel @[TopModule.scala 80:21]
    execute.io_mem_r_en <= ID_Exmem_r_en @[TopModule.scala 83:24]
    execute.io_rs1 <= _GEN_2
    execute.io_rs2 <= _GEN_5
    execute.io_aluop <= ID_Exaluop @[TopModule.scala 121:21]
    execute.io_pc_out <= ID_Expc_out @[TopModule.scala 124:22]
    execute.io_imm_out <= ID_Eximm_out @[TopModule.scala 127:23]
    execute.io_RS1 <= ID_ExRS1 @[TopModule.scala 130:19]
    execute.io_RS2 <= ID_ExRS2 @[TopModule.scala 134:19]
    execute.io_Rd <= ID_ExRd @[TopModule.scala 138:19]
    execute.io_RegWr_en <= bits(ID_ExRegWr_en, 0, 0) @[TopModule.scala 141:24]
    memory.clock <= clock
    memory.reset <= reset
    memory.io_out <= ExMemout @[TopModule.scala 175:18]
    memory.io_br_taken <= ExMembr_taken @[TopModule.scala 178:23]
    memory.io_Wen <= ExMemMemWen @[TopModule.scala 146:18]
    memory.io_Fun3 <= ExMemFun3 @[TopModule.scala 149:19]
    memory.io_Enable <= ExMemEnable @[TopModule.scala 152:21]
    memory.io_Din <= ExMemDin @[TopModule.scala 155:18]
    memory.io_MemToReg <= ExMemToReg @[TopModule.scala 158:23]
    memory.io_RDout <= ExMemRDout @[TopModule.scala 161:20]
    memory.io_RS2out <= ExMemRS2out @[TopModule.scala 165:21]
    memory.io_RegWr_enout <= ExMemRegWr_enout @[TopModule.scala 168:26]
    memory.io_pco <= ExMempco @[TopModule.scala 172:18]
    memory.io_pcselout <= ExMempcsel @[TopModule.scala 181:23]
    WriteBack.clock <= clock
    WriteBack.reset <= reset
    WriteBack.io_RegWr_enOut <= MemWrbRegWr_enOut @[TopModule.scala 186:29]
    WriteBack.io_memtoreg <= MemWrbmemtoreg @[TopModule.scala 190:26]
    WriteBack.io_RDsel <= MemWrbRDsel @[TopModule.scala 193:23]
    WriteBack.io_Memrd <= MemWrbMemrd @[TopModule.scala 197:23]
    WriteBack.io_Dout <= MemWrbDout @[TopModule.scala 200:22]
    WriteBack.io_alu_out <= MemWrbalu_out @[TopModule.scala 203:25]
    WriteBack.io_pcout <= MemWrbpcout @[TopModule.scala 206:23]
    WriteBack.io_brtaken <= MemWrbbrtaken @[TopModule.scala 209:25]
    WriteBack.io_pcsel <= MemWrbpcsel @[TopModule.scala 212:23]
    forward.clock <= clock
    forward.reset <= reset
    forward.io_IDEXrs1 <= ID_ExRS1 @[TopModule.scala 131:23]
    forward.io_IDEXrs2 <= ID_ExRS2 @[TopModule.scala 135:23]
    forward.io_ExMemRd <= ExMemRDout @[TopModule.scala 162:23]
    forward.io_ExMemRegWr_en <= ExMemRegWr_enout @[TopModule.scala 169:29]
    forward.io_MemWbRegWr_en <= MemWrbRegWr_enOut @[TopModule.scala 187:29]
    forward.io_MemWbRd <= MemWrbRDsel @[TopModule.scala 194:23]
    IF_IDins <= fetch.io_instruction @[TopModule.scala 23:13]
    IF_IDpc <= fetch.io_pc_out @[TopModule.scala 26:12]
    IF_IDpc4 <= fetch.io_pc4_out @[TopModule.scala 29:13]
    ID_Exiform <= decode.io_iform @[TopModule.scala 34:15]
    ID_Exrform <= decode.io_rform @[TopModule.scala 37:15]
    ID_Exsform <= decode.io_sform @[TopModule.scala 40:15]
    ID_Exbform <= decode.io_bform @[TopModule.scala 43:15]
    ID_Exluiform <= decode.io_luiform @[TopModule.scala 46:17]
    ID_Exjalform <= decode.io_Jalform @[TopModule.scala 49:17]
    ID_Exjalrform <= decode.io_jalrform @[TopModule.scala 52:18]
    ID_Exlform <= decode.io_lform @[TopModule.scala 55:15]
    ID_ExAuipc <= decode.io_Auipc @[TopModule.scala 58:15]
    ID_Exlui_jal_jalr_auipc_imm <= decode.io_lui_jal_jalr_auipc_imm @[TopModule.scala 61:32]
    ID_EximmBits <= decode.io_immBits @[TopModule.scala 64:17]
    ID_Exmem_wr_en <= decode.io_mem_wr_en @[TopModule.scala 67:19]
    ID_Exwr_back <= decode.io_wr_back @[TopModule.scala 70:17]
    ID_Exbr_fun3 <= decode.io_br_fun3 @[TopModule.scala 73:17]
    ID_Exload_storefun <= decode.io_load_storefun @[TopModule.scala 76:23]
    ID_Expcsel <= decode.io_pcsel @[TopModule.scala 79:15]
    ID_Exmem_r_en <= decode.io_mem_r_en @[TopModule.scala 82:18]
    ID_Exrs1 <= decode.io_rs1 @[TopModule.scala 90:17]
    ID_Exrs1_1 <= execute.io_out @[TopModule.scala 95:17]
    ID_Exrs1_2 <= memory.io_alu_out @[TopModule.scala 100:18]
    ID_Exrs2 <= decode.io_rs2 @[TopModule.scala 106:17]
    ID_Exrs2_1 <= execute.io_out @[TopModule.scala 111:17]
    ID_Exrs2_2 <= memory.io_alu_out @[TopModule.scala 116:17]
    ID_Exaluop <= decode.io_aluop @[TopModule.scala 120:15]
    ID_Expc_out <= decode.io_pc_out @[TopModule.scala 123:16]
    ID_Eximm_out <= decode.io_imm_out @[TopModule.scala 126:17]
    ID_ExRS1 <= decode.io_RS1 @[TopModule.scala 129:13]
    ID_ExRS2 <= decode.io_RS2 @[TopModule.scala 133:13]
    ID_ExRd <= decode.io_Rd @[TopModule.scala 137:13]
    ID_ExRegWr_en <= decode.io_RegWr_en @[TopModule.scala 140:18]
    ExMemMemWen <= execute.io_MemWen @[TopModule.scala 145:16]
    ExMemFun3 <= execute.io_MemFun3 @[TopModule.scala 148:14]
    ExMemEnable <= execute.io_MemEnable @[TopModule.scala 151:16]
    ExMemDin <= execute.io_MemDin @[TopModule.scala 154:13]
    ExMemToReg <= execute.io_MemToReg @[TopModule.scala 157:15]
    ExMemRDout <= execute.io_RDout @[TopModule.scala 160:15]
    ExMemRS2out <= execute.io_RS2out @[TopModule.scala 164:16]
    ExMemRegWr_enout <= execute.io_RegWr_enout @[TopModule.scala 167:21]
    ExMempco <= execute.io_pco @[TopModule.scala 171:13]
    ExMemout <= execute.io_out @[TopModule.scala 174:13]
    ExMembr_taken <= execute.io_br_taken @[TopModule.scala 177:18]
    ExMempcsel <= execute.io_pcselout @[TopModule.scala 180:15]
    MemWrbRegWr_enOut <= memory.io_RegWr_enOut @[TopModule.scala 185:22]
    MemWrbmemtoreg <= memory.io_memtoreg @[TopModule.scala 189:19]
    MemWrbRDsel <= memory.io_RDsel @[TopModule.scala 192:16]
    MemWrbMemrd <= memory.io_Memrd @[TopModule.scala 196:16]
    MemWrbDout <= memory.io_Dout @[TopModule.scala 199:15]
    MemWrbalu_out <= memory.io_alu_out @[TopModule.scala 202:18]
    MemWrbpcout <= memory.io_pcout @[TopModule.scala 205:16]
    MemWrbbrtaken <= memory.io_brtaken @[TopModule.scala 208:18]
    MemWrbpcsel <= memory.io_pcsel @[TopModule.scala 211:16]
