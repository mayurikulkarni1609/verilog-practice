`timescale 1ns/1ps
module demux1to4_dataflow_tb();
 reg i,s1,s0;
 wire [3:0]y;
 integer j;
demux1to4_dataflow d1(i,s0,s1,y);
 initial begin
    $dumpfile("demux.vcd");
    $dumpvars(0,demux1to4_dataflow_tb);
    for(j=0;j<8;j=j+1)
      begin
        {s1,s0,i}=j; #10;
      end
    $finish;
 end
endmodule
