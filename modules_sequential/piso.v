module piso #(parameter n = 4)
(
    input clk, reset, load,
    input [n-1:0]parallel_in,
    output reg [n-1:0]q,
    output reg serial_out
);
always@(posedge clk or posedge reset)
   begin
     if(reset)
       begin
         q <= 0;
         serial_out <= 0;
       end
          else if(load)
            q  <= parallel_in;
          else
            begin
               serial_out <= q[0];
               q <= q>>1;
            end
   end
endmodule