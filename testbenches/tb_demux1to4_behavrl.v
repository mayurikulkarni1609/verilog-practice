`timescale 1ns/1ps
module demux1to4_behavrl_tb();
 reg i;
 reg [1:0]s;
 wire [3:0]y;
 integer j;
demux1to4_behavrl d1(i,s,y);
 initial begin
    $dumpfile("demux.vcd");
    $dumpvars(0,demux1to4_behavrl_tb);
    for(j=0;j<8;j=j+1)
      begin
        {s,i}=j; #10;
      end
    $finish;
 end
endmodule
