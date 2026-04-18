module converter_BtoG #(parameter n = 4)
(
    input [n-1:0]b,
    output [n-1:0]g
);
assign g = b ^ (b>>1);
endmodule
