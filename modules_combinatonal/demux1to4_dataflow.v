module demux1to4_dataflow
(
    input i,
    input s0,s1,
    output [3:0]y
);
assign y[0] = ~s1&~s0&i;
assign y[1] = ~s1&s0&i;
assign y[2] = s1&~s0&i;
assign y[3] = s1&s0&i;
endmodule