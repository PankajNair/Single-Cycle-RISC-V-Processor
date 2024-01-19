`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2023 22:14:19
// Design Name: 
// Module Name: singleCycleTop
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module singleCycleTop(
input logic clk, reset,
output logic [31:0] writeData,dataAddress,
output logic memWrite 
);

logic [31:0] pc, instr, readData;
logic [3:0] writeStrobe;

singleCycleCore singleCycleCoreInst (
.clk(clk),
.reset(reset),
.instr(instr),
.readData(readData),
.pc(pc),
.memWrite(memWrite),
.aluResult(dataAddress),
.writeData(writeData),
.writeStrobe(writeStrobe)
    );

instMem instMemInst ( 
.A(pc),
.RD(instr) 
    );

dataMem dataMemInst (
.clk(clk), 
.WE(memWrite),
.writeStrobe(writeStrobe),
.A(dataAddress), 
.WD(writeData),
.RD(readData) 
    );
		    
endmodule
