module MUL_datapath(
  input LdA,
  input LdB,
  input LdP,
  input clrP,
  input decB,
  input clk,
  input [15:0] Bus,
  output eqz
);

  wire [15:0] X; wire [15:0] Y; wire [15:0] Z; wire [15:0] Bout;
  
  PIPO1 A (X, Bus, LdA, clk);
  PIPO2 P (Y, Z, LdP, clrP, clk);
  CNTR B (Bout, Bus, LdB, decB, clk);
  ADDER ADD (Z, X, Y);
  EQZ COMP (eqz, Bout);
  
endmodule