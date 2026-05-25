module serial_adder
(
    input clk, reset, start, 
    input [3:0]a, b,
    output reg [3:0]result,
    output reg done
);

  reg current_state, next_state;
  reg [3:0]count;
  wire shift;
  wire x, y, 