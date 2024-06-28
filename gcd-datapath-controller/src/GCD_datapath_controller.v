
module GCD_datapath_controller(
  input clk,
  input [15:0] data_in,
  input start,
  output done
);
  
  wire ldA, ldB, sel1, sel2, sel_in, lt, gt, eq;
  
  GCD_datapath M1 (
    clk,
    data_in,
    ldA,
    ldB,
    sel1,
    sel2,
    sel_in,
    lt,
    gt,
    eq
 );
  
  controller M2 (
    clk,
    lt,
    gt,
    eq,
    start,
    ldA,
    ldB,
    sel1,
    sel2,
    sel_in,
    done    
  );
  
endmodule