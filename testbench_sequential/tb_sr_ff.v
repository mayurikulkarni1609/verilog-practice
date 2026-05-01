`timescale 1ns/1ps
module sr_ff_tb();
reg clk, s, r;
wire q;
sr_ff f1(clk,s,r,q);
initial 
   begin
     clk = 0;
     forever #5 clk = ~clk;
   end
   initial 
      begin
        $dumpfile("ff2.vcd");
        $dumpvars(0, sr_ff_tb);
        s=1; r=0; #10;
        s=0; r=0; #10;
        s=0; r=1; #10;
        s=1; r=1; #10;
        s=1; r=0; #10;
        $finish;
      end
endmodule

