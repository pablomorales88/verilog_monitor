`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:42:31 05/16/2017
// Design Name:   divisorDCM
// Module Name:   C:/Users/Pablo/Documents/vhdl_code/biestableT/divDCM_tb.v
// Project Name:  biestableT
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: divisorDCM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module divDCM_tb;

	// Inputs
	reg CLK_IN1;
	reg RESET;

	// Outputs
	wire CLK_OUT1;

	// Instantiate the Unit Under Test (UUT)
	divisorDCM uut (
		.CLK_IN1(CLK_IN1), 
		.CLK_OUT1(CLK_OUT1), 
		.RESET(RESET)
	);

	initial begin
		// Initialize Inputs
		CLK_IN1 = 0;
		RESET = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      always begin
      #10  CLK_IN1 =  ! CLK_IN1;
		
		end
endmodule

