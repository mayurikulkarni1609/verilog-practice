`timescale 1ns/1ps
module d_ff_tb();
reg clk, reset, d;
wire q; 
integer i;
d_ff d1(clk,reset,d,q);
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end
initial begin
$dumpfile("ff.vcd");
$dumpvars(0, d_ff_tb);
reset = 1; d = 0; #10;
reset = 1; d = 1; #10;
reset = 0; #10;
for(i=0; i<(1<<2); i = i+1)
begin
  {reset,d} = i; #10;
end
$finish;
end
endmodule


