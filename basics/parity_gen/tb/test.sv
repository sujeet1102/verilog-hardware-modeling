`timescale 10ns/1ns

module test;
  
  reg x, clk;
  wire z;
  
  parity_gen PAR1 (x, clk, z);
  
  initial begin
    $dumpfile("dump.vcd"); $dumpvars(0, test);
    clk <= 0;
  end
  
  always #5 clk <= ~clk;
  
  initial begin
     #2 x <= 0; #10 x <= 1; #10 x <= 1; #10 x <= 1;
    #10 x <= 0; #10 x <= 1; #10 x <= 1; #10 x <= 0;
    #10 x <= 0; #10 x <= 1; #10 x <= 1; #10 x <= 0;
    #10 $finish;
  end
  
endmodule