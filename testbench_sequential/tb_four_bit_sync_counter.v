`timescale 1ns/1ps
module four_bit_sync_counter_tb();
reg clk, reset;
wire [3:0]count;
four_bit_sync_counter f1(reset, clk, count);
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end
initial begin
$dumpfile("counter.vcd");
$dumpvars(0, four_bit_sync_counter_tb);
reset = 1; #10;
reset = 0; #10;
#200 $finish;
end
endmodule


