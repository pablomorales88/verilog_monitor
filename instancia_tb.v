`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:14:57 05/10/2017
// Design Name:   instancia
// Module Name:   C:/Users/Pablo/Documents/vhdl_code/biestableT/instancia_tb.v
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

module instancia_tb;
	// Inputs
	reg clk;
	reg reset;
	reg watchdog;

	// Outputs
	wire error;
	wire [23:0] contador;
	wire pulso;
	wire flag1;
	wire resetuC;


	// Instantiate the Unit Under Test (UUT)
	instancia uut (
		.clk(clk), 
		.reset(reset), 
		.watchdog(watchdog), 
		.error(error), 
		.contador(contador),
		.pulso(pulso),
		.flag1(flag1),
		.resetuC(resetuC)
		);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		watchdog = 0;
		// Wait 100 ns for global reset to finish
		#30 reset = 1 ;
      #500  
		watchdog = 1;
		#10000000  
		watchdog = 0;
		#10000000 
		watchdog = 1;
		#10000000
		watchdog = 0;
		#10000000
		watchdog = 1;
		#10000000
		watchdog = 0;
		#700000000 
		watchdog = 1;
		#100000000
		watchdog = 0;  
		#10000000
		watchdog = 1;
		#10000000
		watchdog = 0;
		#10000000
		watchdog = 1;
		#10000000
		watchdog = 0;
		#10000000
		watchdog = 1;  
		#10000000
		watchdog = 0;
		#10000000
		watchdog = 1;
		#10000000
		watchdog = 0;
		#10000000
		watchdog = 1;
		#10000000
		watchdog = 0;
		#10000000
		watchdog = 1;
		#10000000
		watchdog = 0;  
		#10000000
		watchdog = 1;
		#10000000
		watchdog = 0;  		
		// Add stimulus here

	   end
		
		always begin
      #10  clk =  ! clk;
		
		end
	
      
endmodule

