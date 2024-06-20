// Code your testbench here
// or browse Examples
module test;
  
  reg [15:0] data_in;
  reg clk;
  reg start;
  
  wire done;
//   wire LdA;
//   wire LdB;
//   wire LdP;
//   wire clrP;
//   wire decB;
//   wire eqz;
  
//   MUL_datapath DP (LdA, LdB, LdP, clrP, decB, clk, data_in, eqz);
//   controller CON (LdA, LdB, LdP, clrP, decB, done, clk, eqz, start);
  
  MUL_datapath_controller M (clk, data_in, start, done);
  
  initial begin
    clk = 0; #3 start = 1;
    #500 $finish;
  end
  
  always #5 clk = ~clk;
  
  initial begin
    #3 data_in = 17;
    #20 data_in = 5;
  end
  
  initial begin
    $monitor($time, " %d %b", M.M1.Y, done);
    $dumpfile("mul.vcd"); $dumpvars(0, test);
  end
  
endmodule