module cmp_16(
  input [15:0] A,
  input [15:0] B,
  output lt,
  output gt,
  output eq
);
  
  assign lt = (A < B);
  assign gt = (A > B);
  assign eq = (A == B);
  
endmodule