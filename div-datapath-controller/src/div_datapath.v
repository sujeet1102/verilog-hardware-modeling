module div_datapath (
  output PgtN, 
  input LoadN, 
  input LoadS, 
  input LoadP, 
  input Clear, 
  input IncQ, 
  input [15:0] Data_in, 
  input clk
);
  
  reg [7:0] Q = 0;
  always @ (posedge clk) begin
    if (IncQ) Q <= Q + 1;
    if (Clear) Q <= 0;
  end
  
  wire [15:0] X, Y;
  wire [15:0] mux_out, sub_wire;
  
  reg_16 N (.d_out(X), .d_in(mux_out), .ld(LoadN), .clr(Clear), .clk(clk));
  reg_16 P (.d_out(Y), .d_in(Data_in), .ld(LoadP), .clr(Clear), .clk(clk));
  
  mux_2x1_16 MUX (.A(Data_in), .B(sub_wire), .sel(LoadS), .data_out(mux_out));
  
  sub_16 SUB (.A(X), .B(Y), .out(sub_wire));
  
  cmp_16 CMP (.A(X), .B(Y), .gt(PgtN));
  
endmodule