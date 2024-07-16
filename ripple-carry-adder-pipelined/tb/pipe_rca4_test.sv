module pipe_rca4_test;
	reg [3:0] A, B, A_prev, B_prev;
	reg Cin, Cin_prev, Clk;
	wire [3:0] Sum;
	wire Cout;
		
	pipe_rca4 DUT (Cout, Sum, A, B, Cin, Clk);
	
	initial
		begin
			Clk = 1'b0;
            $monitor($time, " Sum = %d", Sum);
          	$dumpfile("file.vcd");
          	$dumpvars(0, pipe_rca4_test);
			#100 $finish;
		end
  
	always #5 Clk = ~Clk;
  
  	initial begin
      #2 A = 7; B = 5; Cin = 0;
      #10 A = 1; B = 2; Cin = 0;
      #10 A = 3; B = 2; Cin = 0;
      #10 A = 5; B = 2; Cin = 1;
      #10 A = 1; B = 1; Cin = 0;
    end
  
endmodule