module decoder2to4(a,y);
input [1:0]a;
output [3:0]y;
assign y = 1<<a;
endmodule