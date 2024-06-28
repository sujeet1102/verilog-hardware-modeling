module test;
  
  reg [15:0] data_in = 0;
  reg start  = 0, clk = 0;
  wire done;
  
  GCD_datapath_controller DUT (clk, data_in, start, done);
  
  initial begin
    clk = 0;
    #3 start = 1;
    #60 $finish;
  end
  
  always #5 clk = ~clk;
  
  initial begin
    #12 data_in = 65;
    #10 data_in = 39;
  end
  
  initial begin
    $monitor($time, " %d %b", DUT.M1.Bout, done);
    $dumpfile("test.vcd"); $dumpvars(0, test);
  end
  
endmodule