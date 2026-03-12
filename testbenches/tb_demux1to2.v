`timescale 1ns/1ps
 module demux1to2_tb();
 reg i,s;
 wire y0,y1;
 integer j;
 demux1to2 d1(i,s,y0,y1);
  initial begin
    $dumpfile("demux.vcd");
    $dumpvars(0,demux1to2_tb);
    for(j=0;j<4;j=j+1)
      begin
        {s,i}=j; #10;
      end
      $finish;
     end
 endmodule