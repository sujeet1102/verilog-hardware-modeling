module serial_adder(
  input A,
  input B,
  input clk,
  output reg S,
  output reg carry
);
  
  initial begin
    S = 0;
    carry = 0;
  end
  
  localparam C0 = 0, C1 = 1;
  
  always @ (posedge clk) begin
    
    case(carry)
      
      C0: begin
        S <= A + B;
        carry <= (A & B) ? 1 : 0;
      end
      
      C1: begin
        S <= A + B;
        carry <= !(A | B) ? 0 : 1;
      end
      
    endcase
    
  end
  
endmodule