`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:41:39 05/10/2017 
// Design Name: 
// Module Name:    watchdog 
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
module watchdog(input clk,
					 input wdg, 
					 input pulso,
					 input reset,
					 output reg error
					 //output reg [23:0] count,
					 //output reg flag1
					 
    );
	 reg [27:0] count;
	 reg flag1;

	 always @(posedge clk) begin
	   /*Este constador es el que cuenta hasta 300ms*/
		count=count+1'b1;
		if(!reset)begin
			count=0;
			error=0;
			flag1=0;
			end
			
		if(pulso==1 && wdg==1) begin
				if(flag1==0)begin
					flag1=1;
				end
		end
		else if(pulso==1 && wdg==0) begin
				if(flag1==1)begin
					count=0;
					flag1=0;
					error=0;
				end
		end
		/* Si conte hasta 300ms vuelvo todo a 0 */	
		/*if (count==26'b1110_0100_1110_0001_1100_0000) begin*/
		if (count==28'b1110111110101111000010000000) begin
		/*if (count==24'b111001001110000111000000) begin*/
			flag1=0;	
			error=1;
			count=0;
		end
		end
endmodule
