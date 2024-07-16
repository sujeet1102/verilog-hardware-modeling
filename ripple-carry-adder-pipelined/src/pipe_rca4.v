module pipe_rca4(
  output Cout,
  output [3:0] Sum, 
  input [3:0] A, 
  input [3:0] B, 
  input Cin, 
  input clk
);
  
  reg [8:0] L1;
  reg [7:0] L2;
  reg [6:0] L3;
  reg [5:0] L4;
  
  wire [3:0] sout;
  wire [3:0] cout;
  
  fulladder F1 (sout[0], cout[0], L1[5], L1[1], L1[0]);
  fulladder F2 (sout[1], cout[1], L2[4], L2[1], L2[0]);
  fulladder F3 (sout[2], cout[2], L3[3], L3[1], L3[0]);
  fulladder F4 (sout[3], cout[3], L4[2], L4[1], L4[0]);
  
  always @ (posedge clk) begin
    L1 <= {A[3:0], B[3:0], Cin};
    L2 <= {sout[0], L1[8:6], L1[4:2], cout[0]};
    L3 <= {sout[1], L2[7:5], L2[3:2], cout[1]};
    L4 <= {sout[2], L3[6:4], L3[2], cout[2]};
  end
  
  assign Cout = cout[3];
  assign Sum = {sout[3], L4[5:3]};
  
endmodule

module fulladder (S, C, A, B, Cin);
       input A, B, Cin;
       output S, C;
       wire [2:0] t;
       xor      G1  (t[0], A, B);
       xor      G2  (S, t[0], Cin);
       and      G3  (t[1], t[0], Cin);
       and      G4  (t[2], A, B);
       or       G5  (C, t[1], t[2]);
endmodule
