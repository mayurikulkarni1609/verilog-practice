`timescale 1ns/1ps
module comparator_tb();
parameter m = 2;
reg [m-1:0]a,b;
wire E,G,L;
integer i;
 comparator #(m)c1(a,b,E,G,L);
initial begin
    $dumpfile("comparator.vcd");
    $dumpvars(0,comparator_tb);
    for(i=0; i<(1<<(2*m)); i = i+1)
       begin
        {a,b} = i; #10;
       end
     $finish;
    end
endmodule
