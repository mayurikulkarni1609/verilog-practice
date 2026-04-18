`timescale 1ns/1ps
module four_bit_alu_tb();
reg [3:0]a,b;
reg [1:0]s;
wire [3:0]y;
integer i;
four_bit_alu f1(a,b,s,y);
initial
begin
    $dumpfile("alu.vcd");
    $dumpvars(0,four_bit_alu_tb);
    for(i=0; i< (1<<10); i = i+1)
     begin
        {s,a,b} = i; #10;
     end
     $finish;
end
endmodule

