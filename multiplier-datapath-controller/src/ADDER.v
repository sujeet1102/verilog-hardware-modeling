module ADDER(
  output reg [15:0] out,
  input [15:0] in1,
  input [15:0] in2
);
  
  always @ (*) out = in1 + in2;
  
endmodule