`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:03:37 05/30/2017
// Design Name:   uCSelect
// Module Name:   C:/Users/Pablo/Documents/vhdl_code/biestableT/pruebaModulouCSelect.v
// Project Name:  biestableT
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: uCSelect
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pruebaModulouCSelect;

	// Inputs
	reg clk;
	reg errorUC1;
	reg errorUC2;
	reg reset;

		reg mon1_u1;
		reg mon2_u1;
		reg mon1_u2;
		reg mon2_u2;
	// Outputs
	wire resetuC1;
	wire resetuC2;
	wire selectedProcessor;

	// Instantiate the Unit Under Test (UUT)
	uCSelect uut (
		.clk(clk), 
		.errorUC1(errorUC1), 
		.errorUC2(errorUC2), 
		.mon1_u1(mon1_u1),
		.mon2_u1(mon2_u1),
		.mon1_u2(mon1_u2),
		.mon2_u2(mon2_u2),
		
		.reset(reset), 
		.resetuC1(resetuC1), 
		.resetuC2(resetuC2), 
		.selectedProcessor(selectedProcessor)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		errorUC1 = 0;
		errorUC2 = 0;
		reset = 0;
		mon1_u1=0;
		mon1_u2=0;
		mon2_u1=0;
		mon2_u2=0;
		// Wait 100 ns for global reset to finish
		#100;
      reset = 1;  
		errorUC1 = 0;
		errorUC2 = 0;
		// Add stimulus here
		#100;
		 
		errorUC1 = 1;
		errorUC2 = 1;
		
		end
		always begin
      #10  clk =  ! clk;
		
		end
      
endmodule

