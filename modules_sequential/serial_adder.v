module serial_adder
(
    input clk, reset, start, 
    input [3:0]a, b,
    output reg [3:0]result,
    output reg done
);

  reg [1:0]count;
  wire shift;
  wire x, y, sum, c_out;
  reg carry; //this is the D flip-flop