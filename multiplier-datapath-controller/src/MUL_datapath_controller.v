module MUL_datapath_controller(
  input clk,
  input [15:0] data_in,
  input start,
  output done
);
  
  wire LdA, LdB, LdP, clrP, decB, eqz;
  
  MUL_datapath M1 (
   LdA,
   LdB,
   LdP,
   clrP,
   decB,
   clk,
   data_in,
   eqz
);
  
  controller M2 (
  LdA,
  LdB,
  LdP,
  clrP,
  decB,
  done,
  clk,
  eqz,
  start
);

endmodule