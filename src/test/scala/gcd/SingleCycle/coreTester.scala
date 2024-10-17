package SingleCycle
import chisel3._
import org.scalatest.FreeSpec
import chiseltest._

class TOPTest extends FreeSpec with ChiselScalatestTester{
   "5-Stage test" in{
    test(new core){
        x =>
        x.clock.step(200) 
       }
   }
}