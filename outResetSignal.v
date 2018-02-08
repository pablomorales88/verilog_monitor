`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:52:28 05/11/2017 
// Design Name: 
// Module Name:    outResetSignal 
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
//
//////////////////////////////////////////////////////////////////////////////////
module outResetSignal(
		input clk,
		input error,
		input reset,
		output reg resetuC
    );
	 reg [5:0] count;
	 reg [22:0] count2;
	 reg flagError;	//Este flag se levana cuando la señal de error esta en 1,y se baja despues que se cuenta hasta 10
	 reg flagRestablecimiento;
	 always @(posedge clk) begin
	 if(!reset)begin
			count=0;
			flagError=0;
			resetuC=1'b1;
			flagRestablecimiento=0;
			count2=0;
	 end
	 if(error) begin
	 flagError=1;
	 end
	 /*Este if es el tiempo que esta en bajo el reset para resetear el uC, 1uS de resetuC*/
	 if(flagError==1 && flagRestablecimiento==0) begin
	 count=count+1'b1;
	 resetuC=1'b0;
			if(count==6'b111111) begin
					count=0;
					resetuC=1'b1;
					flagError=0;
					flagRestablecimiento=1;
			end
	 end		
	 /* Este es el tiempo en donde no le da bola a la señal de error para que no resetee todo el tiempo*/
	 if(flagRestablecimiento)begin
			count2=count2+1'b1;
			if(count2==23'b11111111)begin
			flagRestablecimiento=0;
			flagError=0;
			end
	 end
	 
	 end
endmodule
