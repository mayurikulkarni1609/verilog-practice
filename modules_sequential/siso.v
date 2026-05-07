module siso
(
  input clk, reset,
  input  [3:0]data,
  output reg [3:0]q
);
always@(posedge clk or posedge reset)
   begin
     if(reset)
       q <= 0;
        else
          begin
            for(i=0; i<4; i=i+1)
               begin
                 q[]