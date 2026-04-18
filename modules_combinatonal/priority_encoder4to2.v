module priority_encoder4to2(input [3:0]y,output reg [1:0]a);
//priority y3>y2>y1>y0
always@(*)
 begin
   if(y[3])
    a=2'b11;
   else if(y[2])
    a=2'b10;
   else if(y[1])
    a=2'b01;
   else
    a=2'b00;
 end
endmodule

    