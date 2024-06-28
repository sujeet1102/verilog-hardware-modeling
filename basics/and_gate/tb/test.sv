`timescale 10ns/1ns

module test;
  
  reg A, B;
  wire out;
  reg clr;
  and_gate DUT (A, B, out);
  
  initial begin
    $monitor($time, " A = %b, B = %b out = %b", A, B, out);
    #5 A = 0; B = 0;
    #2 clr = 0;
    #5 A = 1; B = 0;
    #5 A = 0; B = 1;
    #2 clr = 1;
    #5 A = 1; B = 1;
  end
  
endmodule
