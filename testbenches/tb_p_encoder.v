module priority_encoder4to2_tb();
reg [3:0]y;
wire [1:0]a;
integer i;
priority_encoder4to2 p1(y,a);
initial
  begin
     $dumpfile("p_encoder.vcd");
     $dumpvars(0, priority_encoder4to2_tb);
     for(i=0;i<16;i=i+1)
      begin
         y=i; #10;
      end
    $finish;
 end
endmodule