`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:06:33 05/15/2017 
// Design Name: 
// Module Name:    divisorF 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module divisorF(
	input clk,
	input reset,
	output reg clk500hz
    );
	integer contador;
	always @(posedge clk)
	begin
	if(!reset)
		begin
			contador=0;
			clk500hz=0;
		end
	if(contador==100000)
		begin
		clk500hz=!clk500hz;
		contador=0;
		end
	else 
		begin
		contador=contador+1'b1;
		end
	end

endmodule
