module test;
  
  reg clk = 0;
  wire [2:0] light;
  
  cycle_lamp C1 (clk, light);
  
  initial begin
    repeat(10)  #5 clk = ~clk;
  end
  
  always @(*) begin
    $monitor($time, " light = %b", light);
  end
  
endmodule