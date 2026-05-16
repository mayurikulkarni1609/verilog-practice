`timescale 1ps/1ps
module piso_tb();
  parameter n = 4;
  reg clk, reset, load;
  reg [n-1:0]parallel_in;
  wire [n-1:0]q;
  wire serial_out;
    piso #(.n(n)) p1(clk, reset, load, parallel_in, q, serial_out);
      initial 
         begin
            clk = 0;
            forever #5 clk = ~clk;
         end
            initial 
               begin
                 $dumpfile("piso.vcd");
                 $dumpvars(0, piso_tb);
                 reset = 1; #10;
                 reset = 0; load = 1; parallel_in = 4'b1011; #10;
                 reset = 0; load = 0; #70;
                 reset = 1; #10;
                 $finish;
               end
endmodule