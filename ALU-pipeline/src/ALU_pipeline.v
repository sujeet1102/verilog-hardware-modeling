module ALU_pipeline (
  input clk1,	// two-phase clock
  input clk2,
  input [3:0] rs1,
  input [3:0] rs2,
  input [3:0] rd,
  input [3:0] func,
  input [7:0] addr,
  output [15:0] Zout
);
  
  reg [15:0] L12_A, L12_B;
  reg [3:0] L12_rd, L12_func; 
  reg [7:0] L12_addr;	//L12
  
  reg [7:0] L23_Z; 
  reg [3:0] L23_rd; 
  reg [7:0] L23_addr;	//L23
  
  reg [7:0] L34_Z; 
  reg [7:0] L34_addr;	//L34
  
  reg [15:0] regbank [0:15];
  reg [15:0] mem [0:255];
  
  assign Zout = L34_Z;
  
  // Stage 1 (S1) clk1
  always @ (posedge clk1) begin
    L12_A <= #2 regbank[rs1];
    L12_B <= #2 regbank[rs2];
    L12_rd <= #2 rd;
    L12_func <= #2 func;
    L12_addr <= #2 addr;
  end
  
  // Stage 2 (S2) clk2
  always @ (posedge clk2) begin
    case(func)
      0: L23_Z <= #2 L12_A + L12_B;
      1: L23_Z <= #2 L12_A - L12_B;
      2: L23_Z <= #2 L12_A * L12_B;
      3: L23_Z <= #2 L12_A;
      4: L23_Z <= #2 L12_B;
      5: L23_Z <= #2 L12_A & L12_B;
      6: L23_Z <= #2 L12_A | L12_B;
      7: L23_Z <= #2 L12_A ^ L12_B;
      8: L23_Z <= #2 ~L12_A;
      9: L23_Z <= #2 ~L12_B;
      10: L23_Z <= #2 L12_A >> 1;
      11: L23_Z <= #2 L12_A << 1;
      default: L23_Z <= #2 16'hxxxx;
    endcase
    L23_rd <= #2 L12_rd;
    L23_addr <= #2 L12_addr;
  end
  
  // Stage 3 (S3) clk1
  always @ (posedge clk1) begin
    regbank[L23_rd] <= #2 L23_Z;
    L34_Z <= #2 L23_Z;
    L34_addr <= #2 L23_addr;
  end
  
  // Stage 4 (S4) clk2
  always @ (posedge clk2) begin
    mem[L34_addr] <= #2 L34_Z;
  end
  
endmodule