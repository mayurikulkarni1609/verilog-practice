module encoder4to2(y,a);
input [3:0]y;
output [1:0]a;
assign a[0]=y[1]|y[3];
assign a[1]=y[2]|y[3];
endmodule