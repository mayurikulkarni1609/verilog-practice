`timescale 1ns/1ps
module uart_tx_tb();
reg clk, reset, start;
reg [7:0]data;
reg[2:0]current_state;
wire tx;
uart_tx u1(clk, reset, start, data, tx);
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end
initial begin
  $dumpfile("uart.vcd");
  $dumpvars(0, uart_tx_tb);
  $monitor("time=%0t state=%b bit_count=%b tx=%b", 
          $time, u1.current_state, u1.bit_count, tx);
  reset = 1; start =0; data = 8'd255; #10;
  reset = 0; #10;
  start = 1; #10;
  start = 0; #200;

  $finish;
end
endmodule