module siso (#parameter n = 4)
(
  input clk, reset,
  input  serial_in,
  output reg [n-1:0]q,
  output serial_out
);
always@(posedge clk or posedge reset)
   begin
     if(reset)
       q <= 0;
         else
            begin
               q <= {serial_in, q[n-1:1]};
               //for right shift, q[0] eliminated after copying to serial_out
               serial_out <= q[0];
            end
   end
endmodule 