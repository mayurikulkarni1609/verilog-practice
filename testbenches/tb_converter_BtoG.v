`timescale 1ns/1ps
module converter_BtoG_tb();
parameter n = 4;
reg [n-1:0]b;
wire [n-1:0]g;
integer j;
converter_BtoG #(n) c1(b,g);
initial 
   begin
    $dumpfile("converter.vcd");
    $dumpvars(0,converter_BtoG_tb);
for (j = 0; j< (1<<n); j = j+1 ) begin
     b = j; #10;
end
$finish;
   end
endmodule


