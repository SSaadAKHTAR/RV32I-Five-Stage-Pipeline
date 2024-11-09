package SingleCycle
import chisel3._
import chisel3.util._

class TopTop(programFile:Option[String], dataFile:Option[String]) extends Module {
    val io = IO(new Bundle {
        val out = Output (SInt(4.W))
        val pin = Output(SInt(32.W))
    })

    val core = Module(new core())

    val dmem = Module(new SRamTop(dataFile))
    val imem = Module(new SRamTop(programFile))

    /*  Imem Interceonnections  */
    core.io.imemRsp <> imem.io.rsp
    imem.io.req <> core.io.imemReq


    /*  Dmem Interconnections  */
    core.io.dmemRsp <> dmem.io.rsp
    dmem.io.req <> core.io.dmemReq

    io.pin := core.io.pin


    


}

