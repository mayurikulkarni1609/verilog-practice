module piso #(parameter n = 4)
(
    input clk, reset, shift, load,
    input [n-1:0]parallel_in,
    output reg [n-1:0]q,
    output reg serial_out
);
always@(posedge clk or posedge reset)
   begin
     if(reset)
     q <= 0;
     else if(load)
     q  <= parallel_in;
     else
       begin
          genvar i;
          generate
            for(i=n; i>0; i=i-1)
              begin
                serial_out <= q[0];
                q >> 1;
              end
          endgenerate
       end
   end
endmodule