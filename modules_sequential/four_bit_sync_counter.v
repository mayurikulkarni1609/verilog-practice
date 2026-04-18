module four_bit_sync_counter
(
    input reset, clk,
    output reg [3:0]count
);
always@(posedge clk)
  begin
    if(reset)
    count <= 0;
    else
    count <= count + 1;
  end
endmodule

