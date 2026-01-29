`timescale 1ns/1ps
module mux21_tb();
reg a,b,s;
wire q;
integer i;
mux21 m1(a,b,s,q);
initial
 begin
  $dumpfile("mux.vcd");
  $dumpvars(0, mux21_tb);
  for(i=0;i<8; i=i+1)
   begin
    {s,a,b} = i; #10;
   end
   $finish;
  end
endmodule