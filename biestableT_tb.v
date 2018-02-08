`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:45:51 05/10/2017
// Design Name:   biestableT
// Module Name:   C:/Users/Pablo/Documents/vhdl_code/biestableT/biestableT_tb.v
// Project Name:  biestableT
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: biestableT
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module biestableT_tb;

	// Inputs
	reg clk;
	reg rst;
	reg wdg;

	// Outputs
	wire wdgOut;

	// Instantiate the Unit Under Test (UUT)
	biestableT uut (
		.clk(clk), 
		.rst(rst), 
		.wdg(wdg), 
		.wdgOut(wdgOut)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		wdg = 0;
		#30 rst = 1;
		// Wait 100 ns for global reset to finish
		#50  
		wdg = 1;
		#50  
		wdg = 0;
		#50  
		wdg = 1;
		#50  
		wdg = 0;
		#50  
		wdg = 1;
		#50  
		wdg = 0;
		#50  
		wdg = 1;
		#50  
		wdg = 0;
		
      end  
		// Add stimulus here
		always begin
      #10  clk =  ! clk;
		
	end
      
endmodule

