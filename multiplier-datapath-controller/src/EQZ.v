module EQZ(
  output eqz,
  input [15:0] data
);
  
  assign eqz = (data == 0);
  
endmodule