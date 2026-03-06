`timescale 1ns/1ps
module decoder2to4_tb();
reg [1:0]a;
wire [3:0]y;
decoder2to4 d1(a,y);
 initial
    begin
      $dumpfile("decoder.vcd");
      $dumpvars(0,decoder2to4_tb);
      a=2'd0; #10;
      a=2'd1; #10;
      a=2'd2; #10;
      a=2'd3; #10;
      $finish;
    end
endmodule
