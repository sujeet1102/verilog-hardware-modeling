module div_ctrlpath (
  output reg LoadN, 
  output reg LoadP, 
  output reg LoadS,
  output reg Clear, 
  output reg IncQ, 
  output reg Stop, 
  input clk, 
  input PgtN, 
  input Start
);
  
  localparam  S0 = 3'b000,
              S1 = 3'b001,
              S2 = 3'b010,
              S3 = 3'b011,
              S4 = 3'b100;
  
  reg [2:0] next_state = S0;
  reg [2:0] state = S0;
  
  always @ (posedge clk) begin
    state <= next_state;
  end
  
  
  always @ (*) begin
    
    case (state)
      
      S0: begin
        Clear = 1;
        LoadN = 0; LoadP = 0; LoadS = 0; IncQ = 0; Stop = 0;
        if (Start) next_state = S1;
        else next_state = S0;
      end
      
      S1: begin
        Clear = 0;
        LoadN = 1; LoadS = 0; LoadP = 0; // load N with data_in
        next_state = S2;
      end
      
      S2: begin
        Clear = 0; LoadN = 0; LoadS = 0;
        LoadP = 1;
        if (PgtN) next_state = S4;
        else next_state = S3;
      end
      
      S3: begin
        Clear = 0;
        LoadN = 1; LoadP = 0; LoadS = 1; IncQ = 1; // load N with Sub
        if (PgtN) begin
          Stop = 1; IncQ = 0;
          next_state = S4;
        end
        else next_state = S3;
      end
      
      S4: begin
        Clear = 1;	// end state
        LoadN = 0; LoadP = 0; LoadS = 0; IncQ = 0;
        next_state = S4;
      end
      
    endcase
    
  end
  
endmodule