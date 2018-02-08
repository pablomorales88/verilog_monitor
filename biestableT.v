`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:39:47 05/09/2017 
// Design Name: 
// Module Name:    biestableT 
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
module biestableT(
	 input  clk,
	 input  rst,
	 input  wdg,
	 output wire wdgOut
    );

	 reg reg1;
	 reg reg2;
	 reg flag1;
	 
	 always @(posedge clk)
	 begin
	   if(!rst) begin 
			reg1 <= 1'b0;
			reg2 <= 1'b0;
			end
		else begin
		reg1 <= wdg;
		reg2 <= reg1;
		end
	 end
	 	 
	 assign wdgOut = reg1 ^ reg2;

endmodule
