`timescale 1ps/1ps
module jk_ff_tb();
reg clk, reset, j ,k;
wire q;
jk_ff j1(clk, reset, j, k, q);
initial
   begin
     clk = 0;
     forever #5 clk = ~clk;
   end
initial
   begin
     $dumpfile("ff.vcd");
     $dumpvars(0,jk_ff_tb);
     reset = 1; #10;
     reset = 0;
     j = 0; k = 0; #10;
     j = 0; k = 1; #10;
     j = 1; k = 0; #10;
     j = 1; k = 1; #10;
     reset = 1; #25;
     j = 1; k = 1; #10;
     $finish;
   end
endmodule