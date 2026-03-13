`timescale 1ns/1ps
module demux1_2powerm_tb();
parameter m=3;
reg i;
reg [m-1:0]s;
wire [(1<<m)-1:0]y;
integer j;
demux1_2powerm #(m) d1(i,s,y);
initial
  begin
    $dumpfile("demux.vcd");
    $dumpvars(0,demux1_2powerm_tb);
    for(j=0;j<(1<<(m+1)); j=j+1)
    // Loop through all combinations of {s,i}
    // s has m bits and i has 1 bit -> total (m+1) bits
    // Therefore j runs from 0 to 2^(m+1)-1 (all possible input combinations)
      begin
        {s,i} = j; #10;
      end
      $finish;
  end
endmodule
  
