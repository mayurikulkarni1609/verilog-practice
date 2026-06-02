module serial_adder
(
    input clk, reset, start, 
    input [3:0]a, b,
    output reg [3:0]result,
    output reg done
);


  reg [3:0]acc, addend;
  reg [2:0]count;
  wire sum, c_out;
  reg carry; //this is the D flip-flop
  wire x, y;
  assign sum = x^y^carry;
  assign c_out = (x&y) | (y&carry) | (x&carry);
  assign x = acc[0];
  assign y = addend[0];

    always@(posedge clk or posedge reset)
       begin
         if(reset) begin
           count <= 0;
           carry <= 0;
           done <= 0;
           result <= 0;
           acc <= 0;
           addend <= 0;
         end
             else if(start && count == 0) 
               begin
                 acc <= a;
                 addend <= b;
                 count <= 0;
               end
                  else if(count < 4)
                    begin
                      acc <= {sum, acc[3:1]};
                      addend <= {1'b0, addend[3:1]};
                      count <= count + 1;
                      carry <= c_out;
                    end
                      else 
                        begin
                          done <= 1;
                          result <= acc;
                        end
       end
endmodule


               
       