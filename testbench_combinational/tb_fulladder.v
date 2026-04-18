`timescale 1ns/1ps
module fulladder_tb();
reg a,b,cin;
wire sum,co;
integer i;
fulladder f1(a,b,cin,sum,co);
 initial
 begin
    $dumpfile("fulladder.vcd");
    $dumpvars(0,fulladder_tb);
    for(i=0;i<8;i=i+1)
     begin
        {a,b,cin}=i; #10;
     end
    $finish;
 end
endmodule