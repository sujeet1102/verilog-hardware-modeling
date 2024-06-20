module controller(
  output reg LdA,
  output reg LdB,
  output reg LdP,
  output reg clrP,
  output reg decB,
  output reg done,
  input clk,
  input eqz,
  input start
);
  
  reg [2:0] state = 0;
  localparam  S0 = 3'b000,
              S1 = 3'b001,
              S2 = 3'b010,
              S3 = 3'b011,
              S4 = 3'b100;
  
  initial begin
    LdA = 0; LdB = 0; LdP = 0; clrP = 0; decB = 0; done = 0;
  end
  
  always @ (posedge clk) begin
    
    case(state)
      
      S0: begin
        if (start) state <= S1;
      end
      
      S1: begin
        state <= S2;
      end
      
      S2: begin
        state <= S3;
      end
      
      S3: begin
        #2 if (eqz) state <= S4;
        else state <= S3;
      end
      
      S4: begin
        state <= S4;
      end
      
      default: state <= S0;
      
    endcase
    
  end
  
  always @ (state) begin
    
    case(state)
      
      S0: begin
        #1 LdA = 0; LdB = 0; LdP = 0; clrP = 0; decB = 0; done = 0;
      end
      
      S1: begin
        #1 LdA = 1;
      end
      
      S2: begin
        #1 LdA = 0; LdB = 1; clrP = 1;
      end
      
      S3: begin
        #1 LdB = 0; LdP = 1; clrP = 0; decB = 1;
      end
      
      S4: begin
        #1 done = 1; LdB = 0; LdP = 0; clrP = 0; decB = 0;
      end
      
      default: begin
        #1 LdA = 0; LdB = 0; LdP = 0; clrP = 0; decB = 0;
      end
      
    endcase
    
  end
  
endmodule