module serial_adder
(
    input clk, reset, start, 
    input [3:0]a, b,
    output reg [3:0]result,
    output reg done
);


  reg [3:0]acc, addend;
  reg [1:0]count;
  wire shift;
  wire sum, c_out;
  reg carry; //this is the D flip-flop
  reg x, y;


    always@(posedge clk or posedge reset)
       begin
        acc <= a;
        addend <= b;
         if(~reset)
           count <= 0;
             else if(~start)
               count <= 0;
                 else
                   begin
                    acc <= {sum, acc[3:1]};
                    addend <= {0, addend[3:1]};
                    x <= acc[0];
                    y <= addend[0];

                     
                   end


               
       end
  