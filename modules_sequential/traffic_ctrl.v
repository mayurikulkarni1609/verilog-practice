module traffic_ctrl
(
    input clk, reset,
    output reg [1:0]light
);

// state encoding
parameter RED = 2'b00;
parameter GREEN = 2'b01;
parameter YELLOW = 2'b10;

reg [1:0] current_state, next_state;
reg [3:0] count;

// state register
always@(posedge clk or posedge reset)
  begin
    if(reset)
    current_state <= RED;
    else
    current_state <= next_state;
  end

// next state logic    
always@(*)
  begin
    case(current_state)
    // 10 counts (cycles) for red and green. 5 counts for yellow
      RED: next_state = (count==4'd9) ? GREEN : RED;        
      GREEN : next_state = (count==4'd9) ? YELLOW  : GREEN;    
      YELLOW: next_state = (count==4'd4) ? RED : YELLOW;
      default: next_state = RED;
    endcase
  end

// output logic (combinational)
always@(*)
  begin
    case(current_state)
      RED:    light = 2'b00;
      GREEN:  light = 2'b01;
      YELLOW: light = 2'b10;
      default: light = 2'b00;
    endcase
  end

// counter logic (sequential)
always@(posedge clk or posedge reset)
  begin
    if(reset)
      count <= 0;
    else if(current_state != next_state)
      count <= 0;
    else
      count <= count + 1;
  end
endmodule