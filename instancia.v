`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:00:46 05/10/2017 
// Design Name: 
// Module Name:    instancia 
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
module instancia
	(
	 
	 input clk,
	 input reset,
	 input watchdogUC1,
	 input watchdogUC2,
	 
	 input mon_1_u1,
	 input mon_2_u1,
	 input mon_1_u2,
	 input mon_2_u2,
	 
	 output resetUC1,
	 output resetUC2,
	 output selectedProcessorUC
	 
	 //Señales de salida que deben ser borradas
	 /*output [23:0]contadorUC1,
	 output [23:0]contadorUC2,
	 output flag1UC1,
	 output flag1UC2
	 */
	 /*
	 output error,//Este error pasa a ser ErrorUC1 y ErrorUC2 y son wire que se interconectan adentro de la instancia
	 output [23:0]contador,// Esto no va 
	 output pulso,//Esto tampoco va
	 output flag1,// Esto tampoco va
	 output resetuC// Y esto es resetUC1 y resetUC2
	 */
	 );
	 //Dos wire que se les va a asignal la salida de wdgOutPuCx	
	 wire wdgOutPulsouC1;
	 wire wdgOutPulsouC2;
	 //Dos instancias de biesableT
	 biestableT beTuC1(.clk(clk),.rst(reset),.wdg(watchdogUC1),.wdgOut(wdgOutPuC1));
	 biestableT beTuC2(.clk(clk),.rst(reset),.wdg(watchdogUC2),.wdgOut(wdgOutPuC2));
	 //Se le asigna la salida de wdgOutPuCx a los wire wdgOutPulsouCx arriba declarados
	 assign wdgOutPulsouC1=wdgOutPuC1;
	 assign wdgOutPulsouC2=wdgOutPuC2;
	 //assign pulso=wdgOutPulso;
	 
	 //Dos instancias del watchdog
	 watchdog wduC1(.clk(clk),.wdg(watchdogUC1),.pulso(wdgOutPulsouC1),.reset(reset),.error(errorUC1));//,.count(contadorUC1),.flag1(flag1UC1)); //de aca contador y flag no tendrian que salir pero bueno, despues lo saco
	 watchdog wduC2(.clk(clk),.wdg(watchdogUC2),.pulso(wdgOutPulsouC2),.reset(reset),.error(errorUC2));//,.count(contadorUC2),.flag1(flag1UC2)); //de aca contador y flag no tendrian que salir pero bueno, despues lo saco
	 //Creo dos wire que sonlas salidas de error de cada modulod e watchdog, que ingresaran al ultimo modulo que sera el que decidira.
	 wire errorWDGuC1;
	 wire errorWDGuC2;
	 assign errorWDGuC1=errorUC1;
	 assign errorWDGuC2=errorUC2;
	 
	 uCSelect oRS(.clk(clk),.errorUC1(errorWDGuC1),.errorUC2(errorWDGuC2),.reset(reset),.resetuC1(resetuC1),.resetuC2(resetuC2),.selectedProcessor(selectedProcessorUC),.mon1_u1(mon_1_u1),.mon2_u1(mon_2_u1),.mon1_u2(mon_1_u2),.mon2_u2(mon_2_u2)); 
	 assign resetUC1=resetuC1;
	 assign resetUC2=resetuC2;
	 //assign selectedProcessorUC=selectedProcessorUC;
	 
	 //outResetSignal oRS(.clk(clk),.error(errorWDG),.reset(reset),.resetuC(resetuC));
	 //aca voy a instanciar el modulo de salida
	 //Las señales de IN del modulo seran (error,clk,reset)
	 //tendra una señal de salida que sera la que reiniciarà el uC
	 
	 
endmodule
