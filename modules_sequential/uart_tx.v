module uart_tx (
    input clk,
    input reset,
    input start,
    input [7:0]data,
    output reg tx
);

// State encoding
parameter IDLE  = 2'b00;
parameter START = 2'b01;
parameter DATA  = 2'b10;
parameter STOP  = 2'b11;    

reg [1:0] current_state, next_state;
reg [2:0] bit_count;

// State register
always @(posedge clk or posedge reset) begin
    if (reset)
        current_state <= IDLE;
    else
        current_state <= next_state;
end

// Next state logic
always @(*) begin
    case (current_state)
        IDLE:  next_state = (start) ? START : IDLE;
        START: next_state = DATA;
        DATA:  next_state = (bit_count == 3'd7) ? STOP : DATA;
        STOP:  next_state = IDLE;
        default: next_state = IDLE;
    endcase
end

always @(*) begin  // combinational. so that tx updates immediately
    case (current_state)
        IDLE:  tx = 1;
        START: tx = 0;
        DATA:  tx = data[bit_count];
        STOP:  tx = 1;
    endcase
end

// Output + counter
always @(posedge clk or posedge reset) begin
    if (reset) begin
        tx <= 1;
        bit_count <= 0;
    end else begin
        case (current_state)
            IDLE: begin
                tx <= 1;
                bit_count <= 0;
            end

            START: begin
                tx <= 0;
                bit_count<=0;
            end

            DATA: begin
                tx <= data[bit_count]; // data changing according to bit count
                bit_count <= bit_count + 1;
                
            end

            STOP: begin
                tx <= 1;
            end
        endcase
    end
end

endmodule
