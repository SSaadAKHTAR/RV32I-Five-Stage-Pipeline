package SingleCycle
import chisel3 . _
import chisel3 . util . _
class Datamem extends Module {
  val io = IO(new Bundle {
    val mem_write = Input(Bool())
    val addr = Input(UInt(32.W))
    val dataIn = Input(SInt(32.W))
    val dataOut = Output(SInt(32.W))
    val fun3 = Input(UInt(3.W))
    val mem_read = Input(Bool())
  })

  val memory = Mem(1024, Vec(4, SInt(8.W)))
  val mask = Wire(Vec(4, Bool()))
  val data = Wire(Vec(4, SInt(8.W)))
  val tempread = Wire(Vec(4, SInt(8.W))) 

  io.dataOut := 0.S

  data(0) := io.dataIn(7, 0).asSInt()
  data(1) := io.dataIn(15, 8).asSInt()
  data(2) := io.dataIn(23, 16).asSInt()
  data(3) := io.dataIn(31, 24).asSInt()

  tempread(0) := 0.S
  tempread(1) := 0.S
  tempread(2) := 0.S
  tempread(3) := 0.S

  mask(0) := 0.B
  mask(1) := 0.B
  mask(2) := 0.B
  mask(3) := 0.B

  when(io.mem_write) {
    when(io.fun3 === 0.U) { //SB
      when(io.addr(1, 0) === 0.U) {
        mask(0) := 1.B
        mask(1) := 0.B
        mask(2) := 0.B
        mask(3) := 0.B
      }.elsewhen(io.addr(1, 0) === 1.U) {
        mask(0) := 0.B
        mask(1) := 1.B
        mask(2) := 0.B
        mask(3) := 0.B

        data(1) := io.dataIn(7, 0).asSInt()


      }.elsewhen(io.addr(1, 0) === 2.U) {
        mask(0) := 0.B
        mask(1) := 0.B
        mask(2) := 1.B
        mask(3) := 0.B

        data(2) := io.dataIn(7, 0).asSInt()


      }.elsewhen(io.addr(1, 0) === 3.U) {
        mask(0) := 0.B
        mask(1) := 0.B
        mask(2) := 0.B
        mask(3) := 1.B

        data(3) := io.dataIn(7, 0).asSInt()
      }

    }
      .elsewhen(io.fun3 === 1.U) { // SH
        when(io.addr(1, 0) === 0.U) {
          mask(0) := 1.B
          mask(1) := 1.B
          mask(2) := 0.B
          mask(3) := 0.B

        }.elsewhen(io.addr(1, 0) === 1.U) {
          mask(0) := 0.B
          mask(1) := 1.B
          mask(2) := 1.B
          mask(3) := 0.B

          data(1) := io.dataIn(7, 0).asSInt()
          data(2) := io.dataIn(15, 8).asSInt()


        }.elsewhen(io.addr(1, 0) === 2.U) {
          mask(0) := 0.B
          mask(1) := 0.B
          mask(2) := 1.B
          mask(3) := 1.B

          data(2) := io.dataIn(7, 0).asSInt()
          data(3) := io.dataIn(15, 8).asSInt()


        }.elsewhen(io.addr(1, 0) === 3.U) {
          mask(0) := 0.B
          mask(1) := 0.B
          mask(2) := 0.B
          mask(3) := 1.B

          data(3) := io.dataIn(7, 0).asSInt()
        }

      }
      .elsewhen(io.fun3 === 2.U) { // SW
        mask(0) := 1.B
        mask(1) := 1.B
        mask(2) := 1.B
        mask(3) := 1.B

      }
      mask(0) := 1.B
      mask(1) := 0.B
      mask(2) := 0.B
      mask(3) := 0.B
    memory.write(io.addr(31, 2),data,mask)
    //tempread := memory.read(io.addr(31, 2), 1.B)
    //io.dataOut := Cat(tempread(3), tempread(2), tempread(1), tempread(0)).asSInt()

  }
  tempread := memory.read(io.addr(31,2))
  when(io.mem_read){
  tempread := memory.read(io.addr(31,2))
  when(io.fun3 === 0.U) {//LB
    when(io.addr(1,0) === 0.U){
    io.dataOut := Cat(Fill(24,tempread(0)(7)),tempread(0)).asSInt()}
    .elsewhen(io.addr(1,0)=== 1.U){
    io.dataOut := Cat(Fill(24,tempread(1)(7)),tempread(1)).asSInt()}
    .elsewhen(io.addr(1,0)=== 2.U){
    io.dataOut := Cat(Fill(24,tempread(2)(7)),tempread(2)).asSInt()}
    .elsewhen(io.addr(1,0)=== 3.U){
    io.dataOut := Cat(Fill(24,tempread(3)(7)),tempread(3)).asSInt()}

  }.elsewhen(io.fun3 === 1.U) {//LH
    when(io.addr(1,0) === 0.U){
    io.dataOut := Cat(Fill(16,tempread(0)(7)),tempread(0),tempread(1)).asSInt()}
    .elsewhen(io.addr(1,0)=== 1.U){
    io.dataOut := Cat(Fill(16,tempread(1)(7)),tempread(1),tempread(2)).asSInt()}
    .elsewhen(io.addr(1,0)=== 2.U){
    io.dataOut := Cat(Fill(16,tempread(2)(7)),tempread(2),tempread(3)).asSInt()}
    .elsewhen(io.addr(1,0)=== 3.U){
    io.dataOut := Cat(Fill(24,tempread(3)(7)),tempread(3)).asSInt()}

  }.elsewhen(io.fun3 === 2.U) { //lW
    io.dataOut := Cat(tempread(3), tempread(2), tempread(1), tempread(0)).asSInt()
  }
}
when(io.mem_write){
  printf("%x\n", io.dataIn)
}
}

