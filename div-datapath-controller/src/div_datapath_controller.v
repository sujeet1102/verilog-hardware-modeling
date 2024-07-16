module div_datapath_controller(
  input [15:0] Data_in,
  input clk,
  input Start,
  output Stop
);
  
  wire PgtN, LoadN, LoadS, LoadP, Clear, IncQ;
  
  div_datapath DP (.PgtN(PgtN), 
                   .LoadN(LoadN),
                   .LoadS(LoadS),
                   .LoadP(LoadP),
                   .Clear(Clear),
                   .IncQ(IncQ),
                   .Data_in(Data_in),
                   .clk(clk)
                  );
  
  div_ctrlpath CP (.PgtN(PgtN), 
                   .LoadN(LoadN),
                   .LoadS(LoadS),
                   .LoadP(LoadP),
                   .Clear(Clear),
                   .IncQ(IncQ),
                   .Start(Start),
                   .Stop(Stop),
                   .clk(clk)
                  );
  
endmodule