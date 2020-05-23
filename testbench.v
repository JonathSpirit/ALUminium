`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:02:55 05/04/2019
// Design Name:   main
// Module Name:   C:/Users/guill/Desktop/Creation/electronique/Xilinx/ALUGP8B/testbench.v
// Project Name:  ALUGP8B
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench;

	// Inputs
	reg [7:0] numLeft;
	reg clkNumLeft;
	reg [7:0] numRight;
	reg clkNumRight;
	reg [7:0] opChoose;
	reg clkOpChoose;

	// Outputs
	wire [7:0] result;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.numLeft(numLeft), 
		.clkNumLeft(clkNumLeft), 
		.numRight(numRight), 
		.clkNumRight(clkNumRight), 
		.opChoose(opChoose), 
		.clkOpChoose(clkOpChoose), 
		.result(result)
	);

	initial begin
		// Initialize Inputs
		numLeft = 0;
		clkNumLeft = 0;
		numRight = 0;
		clkNumRight = 0;
		opChoose = 0;
		clkOpChoose = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		numLeft = 3;
		numRight = 11;
		opChoose = 8'b00010001;
		#10;
		clkNumLeft=1;
		clkNumRight=1;
		clkOpChoose=1;
		#10;
		clkNumLeft=0;
		clkNumRight=0;
		clkOpChoose=0;
		
	end
      
endmodule

