`timescale 1ns/1ps
module mux41_usingmux21_tb();
 reg [3:0]i;
 reg [1:0]s;
 wire y;
 integer j;
mux41_usingmux21 m1(i,s,y);
initial 
 begin
 $dumpfile("mux.vcd");
 $dumpvars(0,mux41_usingmux21_tb);
 for(j=0;j<64;j=j+1)
    begin
    {s,i}=j;#10;
    end
    $finish;
 end
endmodule

