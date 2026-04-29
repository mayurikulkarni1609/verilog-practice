`timescale 1ns/1ps
module traffic_ctrl_tb();
  reg clk, reset;
  wire [1:0]light;
  traffic_ctrl t1(clk,reset,light);
  initial 
    begin
        clk = 0;
          forever #5 clk = ~clk;
    end
  initial 
    begin
       $dumpfile("traffic.vcd");
       $dumpvars(0,traffic_ctrl_tb);
         reset = 1; #10;
         reset = 0; #400;
         reset = 1; #10;
       $finish;
    end
endmodule

