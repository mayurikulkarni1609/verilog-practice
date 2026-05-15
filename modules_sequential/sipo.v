module sipo #(parameter n = 4)
(
  input clk, reset,
  input  serial_in,
  output reg [n-1:0]q
);
always@(posedge clk or posedge reset)
   begin
     if(reset)
       q <= 0;
         else
            begin
               q <= {serial_in, q[n-1:1]};
            end
   end
endmodule 