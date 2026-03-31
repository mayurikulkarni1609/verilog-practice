module demux1_2powerm #(parameter m=3)
(
    input i,
    input [m-1:0] s,
    output reg [(1<<m)-1:0] y
);
//Parameterized 1-to-(2^m) demultiplexers
always@(*)
  begin
    y = 0;
     y[s] = i;
  end
endmodule

