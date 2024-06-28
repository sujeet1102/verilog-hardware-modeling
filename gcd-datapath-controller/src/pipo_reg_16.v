module pipo_reg_16(
  input [15:0] data_in,
  input ld,
  input clk,
  output reg [15:0] data_out
);
  
  always @ (posedge clk) begin
    if(ld) data_out <= data_in;
  end
  
endmodule