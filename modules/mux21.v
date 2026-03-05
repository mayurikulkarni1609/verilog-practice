module mux21(a,b,s,q);
input a,b,s;
output q;
assign q = (~s&a)|(s&b);
endmodule