module controller(
  input clk,
  input lt,
  input gt,
  input eq,
  input start,
  output reg ldA,
  output reg ldB,
  output reg sel1,
  output reg sel2,
  output reg sel_in,
  output reg done
);
  
  localparam  S0 = 0,
              S1 = 1,
              S2 = 2,
              S3 = 3,
              S4 = 4,
              S5 = 5;
  
  reg [2:0] state;
//   reg [2:0] next_state;
  
  always @ (posedge clk) begin
    
    case(state)
      
      S0: begin
        if (start) state <= S1;
      end
      
      S1: begin
        state <= S2;
      end
      
      S2: begin
        #2 if (eq) state <= S5;
        else if (lt) state <= S3;
        else if (gt) state <= S4;
      end
      
      S3: begin
        #2 if (eq) state <= S5;
        else if (lt) state <= S3;
        else if (gt) state <= S4;
      end
      
      S4: begin
        #2 if (eq) state <= S5;
        else if (lt) state <= S3;
        else if (gt) state <= S4;
      end
      
      S5: begin
        state <= S5;
      end
      
      default: state <= S0;
      
    endcase
    
  end
  
  always @ (state) begin
    
    case(state)
      
      S0: begin
        sel_in = 1; ldA = 1; ldB = 0; done = 0;
      end
      
      S1: begin
        sel_in = 1; ldA = 0; ldB = 1; done = 0;
      end
      
      S2: begin
        if (eq) done = 1;
        else if (lt) begin
          sel1 = 1; sel2 = 0; sel_in = 0;
          #1 ldA = 0; ldB = 1;
        end
        else if (gt) begin
          sel1 = 0; sel2 = 1; sel_in = 0;
          #1 ldA = 1; ldB = 0;
        end
      end
      
      S3: begin
        if (eq) done = 1;
        else if (lt) begin
          sel1 = 1; sel2 = 0; sel_in = 0;
          #1 ldA = 0; ldB = 1;
        end
        else if (gt) begin
          sel1 = 0; sel2 = 1; sel_in = 0;
          #1 ldA = 1; ldB = 0;
        end
      end
      
      S4: begin
        if (eq) done = 1;
        else if (lt) begin
          sel1 = 1; sel2 = 0; sel_in = 0;
          #1 ldA = 0; ldB = 1;
        end
        else if (gt) begin
          sel1 = 0; sel2 = 1; sel_in = 0;
          #1 ldA = 1; ldB = 0;
        end
      end
      
      S5: begin
        sel_in = 0; ldA = 0; ldB = 0; done = 1;
      end
      
      default: begin
        sel_in = 0; ldA = 0; ldB = 0; done = 0;
      end
      
    endcase
    
  end
  
endmodule