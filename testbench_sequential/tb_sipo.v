`timescale 1ns/1ps
module sipo_tb();
  parameter n = 4;
  reg clk, reset, serial_in;
  wire [n-1:0]q;
    sipo #(.n(n)) s1(clk, reset, serial_in, q);
    initial 
       begin
         clk = 0;
         forever #5 clk = ~clk;
       end
          initial 
             begin
               $dumpfile("sipo.vcd");
               $dumpvars(0, sipo_tb);
               reset = 1; #10;
               reset = 0; #10;
               serial_in = 1; #10;
               serial_in = 0; #20;
               serial_in = 1; #30;
               serial_in = 0; #45;
               $finish;
             end
endmodule

