// package SingleCycle
// import chisel3. _
// import chisel3. util . _

// class HazardDetectionUnit extends Module{
//     val io = IO(new Bundle{
//         //input bundle
//         val IF_ID_instr = Input(UInt(32.W))
//         val ID_EX_memread = Input(UInt(1.W))
//         val ID_EX_rd = Input(UInt(5.W))
//         val pc_in = Input(UInt(32.W))
//         val current_pc_in = Input(UInt(32.W))
//         //output bundle
//         val instr_forward = Output(UInt(1.W))
//         val pc_forward = Output(UInt(1.W))
//         val ctrl_forward = Output(UInt(1.W))
//         val instr_out = Output(UInt(32.W))
//         val pc_out = Output(UInt(32.W))
//         val current_pc_out = Output(UInt(32.W))
//     })


//     val rs1_sel = io.IF_ID_instr(19, 15)
//     val rs2_sel = io.IF_ID_instr(24, 20)
//     when(io.ID_EX_memread === 1.U && ((io.ID_EX_rd === rs1_sel) || (io.ID_EX_rd === rs2_sel))) {
//         io.instr_forward := 1.U
//         io.pc_forward := 1.U
//         io.ctrl_forward := 1.U
//         io.instr_out := io.IF_ID_instr
//         io.pc_out := io.pc_in
//         io.current_pc_out := io.current_pc_in

//     }.otherwise{
//         io.instr_forward := 0.U
//         io.pc_forward := 0.U
//         io.ctrl_forward := 0.U
//         io.instr_out := io.IF_ID_instr 
//         io.pc_out := io.pc_in         
//         io.current_pc_out := io.current_pc_in
//     }




// }