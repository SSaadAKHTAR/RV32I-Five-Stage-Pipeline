module BindsTo_0_InstMem(
  input         clock,
  input  [31:0] io_addr,
  output [31:0] io_data
);

initial begin
  $readmemh("src/main/scala/gcd/SingleCycle/imem.txt", InstMem.imem);
end
                      endmodule

bind InstMem BindsTo_0_InstMem BindsTo_0_InstMem_Inst(.*);