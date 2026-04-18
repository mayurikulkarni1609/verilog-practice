`timescale 1ns/1ps
module encoder4to2_tb();
reg [3:0]y;
wire [1:0]a;
encoder4to2 e1(y,a);
initial
 begin
    $dumpfile("encoder.vcd");
    $dumpvars(0,encoder4to2_tb);
    y = 4'd8; #10;
    y = 4'd4; #10;
    y = 4'd2; #10;
    y = 4'd1; #10;
    $finish;
end
endmodule