module cmp_16(
  input [15:0] A,
  input [15:0] B,
  output gt
);
  
  assign gt = (A < B) ? 1 : 0;

endmodule