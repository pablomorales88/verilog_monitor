`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:18:38 05/15/2017
// Design Name:   divisorF
// Module Name:   C:/Users/Pablo/Documents/vhdl_code/biestableT/divisorF_tv.v
// Project Name:  biestableT
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: divisorF
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module divisorF_tv;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire clk500hz;

	// Instantiate the Unit Under Test (UUT)
	divisorF uut (
		.clk(clk), 
		.reset(reset), 
		.clk500hz(clk500hz)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 1;
      end
		
		always begin
      #10  clk =  ! clk;
		
		end  
		// Add stimulus here

	
      
endmodule

