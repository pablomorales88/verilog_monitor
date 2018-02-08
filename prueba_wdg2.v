`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:42:12 06/05/2017
// Design Name:   instancia
// Module Name:   C:/Users/Pablo/Documents/vhdl_code/biestableT/prueba_wdg2.v
// Project Name:  biestableT
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: instancia
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module prueba_wdg2;

	// Inputs
	reg clk;
	reg reset;
	reg watchdogUC1;
	reg watchdogUC2;

	// Outputs
	wire resetUC1;
	wire resetUC2;
	wire selectedProcessor;

	// Instantiate the Unit Under Test (UUT)
	instancia uut (
		.clk(clk), 
		.reset(reset), 
		.watchdogUC1(watchdogUC1), 
		.watchdogUC2(watchdogUC2), 
		.resetUC1(resetUC1), 
		.resetUC2(resetUC2), 
		.selectedProcessor(selectedProcessor)
	);


	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		watchdogUC1 = 0;
		watchdogUC2 = 0;
		
		// Wait 100 ns for global reset to finish
		#100;
      reset = 1; 
		// Add stimulus here
		#100;
		watchdogUC1 = !watchdogUC1;
		watchdogUC2 = 0;
		#100;
		watchdogUC1 = !watchdogUC1;
		watchdogUC2 = 0;
		#100;
		watchdogUC1 = !watchdogUC1;
		watchdogUC2 = 0;
		#100;
		watchdogUC1 = !watchdogUC1;
		watchdogUC2 = 0;
		#100;
		watchdogUC1 = !watchdogUC1;
		watchdogUC2 = 0;
		#100;
		watchdogUC1 = !watchdogUC1;
		watchdogUC2 = 0;
		#100;
		watchdogUC1 = !watchdogUC1;
		watchdogUC2 = 0;
		#100;
		watchdogUC1 = !watchdogUC1;
		watchdogUC2 = 0;
		#100;
		watchdogUC1 = !watchdogUC1;
		watchdogUC2 = 0;
		#100;
		watchdogUC1 = !watchdogUC1;
		watchdogUC2 = 0;
		#100;
		watchdogUC1 = !watchdogUC1;
		watchdogUC2 = 0;
		#100;
		watchdogUC1 = !watchdogUC1;
		watchdogUC2 = 0;
		#100;
		watchdogUC1 = !watchdogUC1;
		watchdogUC2 = 0;
		#100;
		watchdogUC1 = 0;
		watchdogUC2 = !watchdogUC2;
		#100;
		watchdogUC1 = 0;
		watchdogUC2 = !watchdogUC2;
		#100;
		watchdogUC1 = 0;
		watchdogUC2 = !watchdogUC2;
		#100;
		watchdogUC1 = 0;
		watchdogUC2 = !watchdogUC2;
		#100;
		watchdogUC1 = 0;
		watchdogUC2 = !watchdogUC2;
		#100;
		watchdogUC1 = 0;
		watchdogUC2 = !watchdogUC2;
		#100;
		watchdogUC1 = 0;
		watchdogUC2 = !watchdogUC2;
		#100;
		watchdogUC1 = 0;
		watchdogUC2 = !watchdogUC2;
		#100;
		watchdogUC1 = 0;
		watchdogUC2 = !watchdogUC2;
		#100;
		watchdogUC1 = 0;
		watchdogUC2 = !watchdogUC2;
		#100;
		watchdogUC1 = 0;
		watchdogUC2 = !watchdogUC2;
		
		end
		always begin
      #10  clk =  ! clk;
		
		end
      
endmodule

