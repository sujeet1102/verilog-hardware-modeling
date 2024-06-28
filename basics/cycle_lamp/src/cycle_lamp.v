module cycle_lamp(
	input clk,
  	output reg [2:0] light
);
  localparam S0 = 0, S1 = 1, S2 = 2;
  localparam RED = 3'b001, GREEN = 3'b010, YELLOW = 3'b100; 
  reg [1:0] state = 0;
  
  always @(posedge clk) begin
    
    case(state)
      
      S0: begin
        state <= S1;
      end
      S1: begin
        state <= S2;
      end
      S2: begin
        state <= S0;
      end
      default: state <= S0;
  
    endcase
    
  end
  
  always @ (state) begin
    
    case(state)
      
      S0: light = RED;
      S1: light = GREEN;
      S2: light = YELLOW;
      default: light = RED;
      
    endcase
    
  end
      
endmodule