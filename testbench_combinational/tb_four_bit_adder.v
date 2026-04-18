`timescale 1ns/1ps
module four_bit_adder_tb();
 reg [3:0]a,b;
 reg cin;
 wire [3:0]sum;
 wire cout;
 integer i;
 four_bit_adder f1(cin,a,b,cout,sum);
  initial begin
    $dumpfile("adder.vcd");
    $dumpvars(0,four_bit_adder_tb);
    for(i=0;i<512;i=i+1)
      begin
        {cin,a,b}=i; #10;
      end
      $finish;
   end
endmodule

