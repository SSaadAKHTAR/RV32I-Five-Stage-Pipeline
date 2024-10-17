// package SingleCycle
// import chisel3._
// import chisel3.util._ 

// class fetch extends Module{
//     val io = IO(new Bundle{
//         val pcsel = Input(Bool())
//         val aluout = Input(SInt(32.W))
//         val instruction = Output(UInt(32.W))
//         val pc_out = Output (UInt(32.W))
//         val pc4_out = Output (UInt(32.W))

//     })
//     val pc =RegInit(0.U(32.W))
//     val insMem = Module(new InstMem("//home/saad/Desktop/5stagepipeline/src/main/scala/gcd/SingleCycle/imem.txt"))
//     io.pc_out:= pc                       
//     insMem.io.addr:= pc
//     pc:=Mux(io.pcsel,io.aluout.asUInt(),pc + 4.U)
//     io.pc4_out:= pc + 4.U
    
//     io.instruction:= insMem.io.inst
// } 


