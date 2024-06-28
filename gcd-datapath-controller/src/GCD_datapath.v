
module GCD_datapath(
  input clk,
  input [15:0] data_in,
  input ldA,
  input ldB,
  input sel1,
  input sel2,
  input sel_in,
  output lt,
  output gt,
  output eq
);
  
  wire [15:0] bus;
  wire [15:0] Aout;
  wire [15:0] Bout;
  wire [15:0] X;
  wire [15:0] Y;
  wire [15:0] Subout;
  
  pipo_reg_16 A (.data_in(bus), .ld(ldA), .clk(clk), .data_out(Aout));
  pipo_reg_16 B (.data_in(bus), .ld(ldB), .clk(clk), .data_out(Bout));
  
  mux_2x1_16 MUX1 (.A(Aout), .B(Bout), .sel(sel1), .data_out(X));
  mux_2x1_16 MUX2 (.A(Aout), .B(Bout), .sel(sel2), .data_out(Y));
  mux_2x1_16 MUXIN (.A(Subout), .B(data_in), .sel(sel_in), .data_out(bus));
  
  sub_16 SUB (.A(X), .B(Y), .out(Subout));
  
  cmp_16 COMP (.A(Aout), .B(Bout), .lt(lt), .gt(gt), .eq(eq));
  
endmodule