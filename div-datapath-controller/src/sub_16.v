module sub_16(
  input [15:0] A,
  input [15:0] B,
  output [15:0] out
);
  
  assign out = A - B;
  
endmodule