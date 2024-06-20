module PIPO1(
  output reg [15:0] d_out,
  input [15:0] d_in,
  input ld,
  input clk
);
  
  always @ (posedge clk) 
    if (ld) d_out <= d_in;
  
endmodule