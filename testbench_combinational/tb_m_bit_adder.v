`timescale 1ns/1ps
module m_bit_adder_tb();
 parameter m = 8;
 reg [m-1:0]a,b;
 reg cin;
 wire [m-1:0]sum;
 wire cout;
 integer i;
 m_bit_adder #(m) f1(cin,a,b,cout,sum);
  initial begin
    $dumpfile("adder.vcd");
    $dumpvars(0,m_bit_adder_tb);
    for(i=0;i<(1<<(2*m+1));i=i+1)
      begin
        {cin,a,b}=i; #10;  
      end
      $finish;
   end
endmodule

