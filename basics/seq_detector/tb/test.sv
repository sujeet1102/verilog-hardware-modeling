module test;
  
  reg x_t, clk_t, rst_t;
  wire z_t;
  
  seq_detector SEQ (.x(x_t), .z(z_t), .clk(clk_t), .rst(rst_t));
  
  initial begin
    $dumpfile("sequence.vcd");
    $dumpvars(0, test);
    clk_t = 0; rst_t = 1;
    #13 rst_t = 0;
  end
  
  always #5 clk_t <= ~clk_t;
  
  initial begin
    #12 x_t = 0; #10 x_t = 0; #10 x_t = 1; #10 x_t = 1;
    #10 x_t = 0; #10 x_t = 1; #10 x_t = 1; #10 x_t = 0;
    #10 x_t = 0; #10 x_t = 1; #10 x_t = 1; #10 x_t = 0;
    #10 $finish;
  end
  
endmodule