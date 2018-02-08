`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:42:37 05/26/2017 
// Design Name: 
// Module Name:    uCSelect 
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
module uCSelect(
		input clk,
		input errorUC1,
		input errorUC2,
		input reset,
		input mon1_u1,
		input mon2_u1,
		input mon1_u2,
		input mon2_u2,
		output reg resetuC1,
		output reg resetuC2,
		output reg selectedProcessor
		
		//Aca tendrian que entrar MON1_u1,MON2_u2,MON1_u2,MON2_u2
		//input mon1_u1,
		//input mon2_u1,
		//input mon1_u2,
		//input mon2_u2
		);
		
		reg [1:0] state;
		reg [7:0] count_UC1;
		reg [7:0] count_UC2;
		reg [26:0] count2;

		reg flagErrorUC1;
		reg flagErrorUC2;
		reg flagRestablecimiento;
		reg [1:0]countVecesReset;
		reg activeProcessor=0;
		always @(posedge clk) begin
		if(!reset)
		begin
			count_UC1=1'b0;
			count_UC2=1'b0;
			count2=1'b0;
			flagErrorUC1=0;
			flagErrorUC2=0;
			resetuC1=1'b1; // si esta en 1, esta prendido la obc1, si esta en 0 esta apagada, porque no pasa por ningun negador.
			resetuC2=1'b1;// tiene q estar en cero p q sea 1, porque tiene el tps, y en la obc, pasa por un negador la señal. Entonces, si esta en 0, se prende la obc2, si esta en 1, la obc2 esta apagada
			flagRestablecimiento=0;
			selectedProcessor=1'b0;
			countVecesReset=0;
		end
		if(errorUC1)
			begin
				flagErrorUC1=1;
			end
		if(errorUC2)
			begin
				flagErrorUC2=1;
			end
			
		if((mon1_u1==0 && mon2_u1==0 && activeProcessor == 0) || (mon1_u2==0 && mon2_u2==0 && activeProcessor == 1))
			begin
			state=0; //state normal op
			end
		
		else if((mon1_u1==1 && mon2_u1==1 && activeProcessor == 0) || (mon1_u2==1 && mon2_u2==1 && activeProcessor == 1))
			begin
				state=1; //state program
				//resetuC1=1'b1; // Enciendo ambas OBC
				//resetuC2=1'b1; // Enciendo ambas OBC
				// Siempre va a estar entrando aca, porque mientras programa, mon1 y mon 2 van a ser 11.
			end
		else if((mon1_u1==1 && mon2_u1==0 && activeProcessor == 0) || (mon1_u2==1 && mon2_u2==0 && activeProcessor == 1))
			begin
				state=0;
			//funciona en modo finalizado programacion
			end
		else if((mon1_u1==0 && mon2_u1==1 && activeProcessor == 0) || (mon1_u2==0 && mon2_u2==1 && activeProcessor == 1))
			begin
				state=2;
				//funciona en modo switch obc
			end
	
		

		if(state==0) begin
			//Siempre va a pasar que en alguna de las variables flagErrorUC1 o flagErrorUC2 va a estar en 1. 
			if(flagErrorUC1==1 && flagRestablecimiento==0 && activeProcessor==0) // Si el procesdorAcivo (por defecto es 0), si no hay error, no va a entrar aca
				begin
					if(countVecesReset==1)
						begin
							activeProcessor=1;
							countVecesReset=0;
							count_UC1=0;
							resetuC1=1'b0;
							resetuC2=1'b0; 
						end
					else
						begin
							count_UC1=count_UC1+1'b1;
							resetuC1=1'b0;
							if(count_UC1==8'b11111111)
								begin
									countVecesReset=countVecesReset+1'b1;
									count_UC1=0;
									resetuC1=1'b1;
									flagErrorUC1=0;
									flagRestablecimiento=1;
								end
						end
				end
			else if(flagErrorUC2==1 && flagRestablecimiento==0 && activeProcessor==1)//
				begin
					if(countVecesReset==1)
						begin
							activeProcessor=0;
							countVecesReset=0;
							count_UC2=0;
							resetuC1=1'b1;
							resetuC2=1'b1;
						end
					else
						begin
							count_UC2=count_UC2+1'b1;
							resetuC2=1'b0;
							if(count_UC2==8'b11111111)
								begin
									countVecesReset=countVecesReset+1'b1;
									count_UC2=0;
					
									resetuC2=1'b0;
										
									//funciona, tengo que bajar los tiempos y ver bien los del reset. Pero anda joia.
									flagErrorUC2=0;
									flagRestablecimiento=1;
								end
						end
				end
	 
			end
		
		else if(state==1)begin
			resetuC1=1'b1; // Enciendo ambas OBC
			resetuC2=1'b1; // Enciendo ambas OBC
		end
		
		else if(state==2)begin
			if(activeProcessor==0)
				begin
					activeProcessor=1;
				end
			else
				begin
					activeProcessor=0;
				end
		end
	 
	 
		selectedProcessor = activeProcessor;
	
		/* Este es el tiempo en donde no le da bola a la señal de error para que no resetee todo el tiempo*/
		if(flagRestablecimiento)
			begin
				count2=count2+1'b1;
				flagErrorUC1=0;
				flagErrorUC2=0;
					if(count2==27'b111111111111111111111111111)
						begin
							/*if(count2==20'b11111111111111111111)begin*/
							flagRestablecimiento=0;
							count2=0;
						end
			end
	 
	 end //@alwsaysemd
endmodule