// Sequence Detector for 0110
module seq_detector(
  input x,
  input clk,
  input rst,
  output reg z
);
  localparam S0 = 0, S1 = 1, S2 = 2, S3 = 3;
  reg [1:0] state = 0;
  reg [1:0] next_state = 0;
  
  always @ (posedge clk or posedge rst) begin
    if(rst) state <= S0;
    state <= next_state;
  end
  
  always @ (state, x) begin
    
    case(state)
      
      S0: begin
        z = (x) ? 0 : 0;
        next_state = (x) ? S0 : S1;
      end
      S1: begin
        z = (x) ? 0 : 0;
        next_state = (x) ? S2 : S1;
      end
      S2: begin
        z = (x) ? 0 : 0;
        next_state = (x) ? S3 : S1;
      end
      S3: begin
        z = (x) ? 0 : 1;
        next_state = (x) ? S0 : S1;
      end
      
    endcase
    
  end
  
endmodule