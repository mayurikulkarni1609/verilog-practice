//4-bit ALU supporting basic operations: addition, subtraction, AND, OR
// Operation selected using 2-bit control signal 's'
//Note: Carry-out, overflow, and other flags are not implemented in this design
module four_bit_alu 
(
    input [3:0]a,b,
    input [1:0]s,
    output reg [3:0]y
);
always@(*)
 begin
   case(s)
   2'b00: y = a + b;
   2'b01: y = a - b;
   2'b10: y = a&b;
   2'b11: y = a|b;
   default: y = 4'b0000;
   endcase
 end
endmodule


