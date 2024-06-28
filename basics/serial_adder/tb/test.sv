module test;
  
  reg A, B, clk;
  wire S, carry;
  
  serial_adder SRADD (A, B, clk, S, carry);
  
  always #5 clk = ~clk;
  
  initial begin
    clk = 0;
    $dumpfile("seradder.vcd");
    $dumpvars(0, test);
    #4 A = 0; B = 0;
    #10 A = 1; B = 0;
    #10 A = 1; B = 1;
    #10 A = 0; B = 1;
    #10 A = 0; B = 0;
    #10 A = 1; B = 1;
    #10 $finish;
  end
  
endmodule