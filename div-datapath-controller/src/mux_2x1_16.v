module mux_2x1_16(
  input [15:0] A,
  input [15:0] B,
  input sel,
  output [15:0] data_out
);
  
  assign data_out = sel ? B : A;
  
endmodule