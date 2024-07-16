module div_test;
  
  reg [15:0] Data;
  reg clk, Start;
  wire Stop;
  
  div_datapath_controller DUT (.Data_in(Data),
                               .clk(clk),
                               .Start(Start),
                               .Stop(Stop)
                              );
  
  initial begin
    clk = 0;
    $dumpfile("dump.vcd");
    $dumpvars(0, div_test);
    #150 $finish;
  end
  
  always #5 clk = ~clk;
  
  initial begin
    #13 Start = 1; Data = 52;
    #10 Start = 0; 
    #10 Data = 7;
  end
  
endmodule