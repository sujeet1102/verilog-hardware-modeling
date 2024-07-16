module reg_16(
  output reg [15:0] d_out,
  input [15:0] d_in,
  input ld,
  input clr,
  input clk
);
  
  always @ (posedge clk) 
    if (clr) d_out <= 0;
    else if (ld) d_out <= d_in;
  
endmodule