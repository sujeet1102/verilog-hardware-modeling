`timescale 10ns/1ns

module parity_gen(
	input x,
    input clk,
    output reg z
);
  
localparam EVEN = 0, ODD = 1;
reg state = 0;
  
always @ (posedge clk) begin

  case(state)

    EVEN: begin
      z <= x ? 1 : 0;
      state <= x ? ODD : EVEN;
    end

    ODD: begin
      z <= x ? 0 : 1;
      state <= x ? EVEN : ODD;
    end

    default: state <= EVEN;

  endcase

end
  
endmodule