`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2023 22:00:34
// Design Name: 
// Module Name: singleCycleCore
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


module singleCycleCore(
input logic clk,reset,
input logic [31:0] instr,
input logic [31:0] readData,
output logic [31:0] pc,
output logic memWrite,
output logic [31:0] result, storeData
    );

logic aluSrc, pcTargetSrc, pcSrc, regWrite, aluResultSrc;
logic beq, bne, blt, bge, bltu, bgeu, zero;
logic [2:0] resultSrc,immSrc,loadSrc;
logic [1:0] storeSrc;
logic [4:0] aluControl;

controlUnit controlUnitInst(
.op(instr[6:0]),
.funct3(instr[14:12]),
.funct7(instr[31:25]), 
.zero(zero), 
.beq(beq), 
.bne(bne), 
.blt(blt), 
.bge(bge), 
.bltu(bltu),
.bgeu(bgeu),
.storeSrc(storeSrc),
.loadSrc(loadSrc),
.resultSrc(resultSrc),
.memWrite(memWrite), 
.pcSrc(pcSrc), 
.aluSrc(aluSrc), 
.regWrite(regWrite),  
.pcTargetSrc(pcTargetSrc),
.aluResultSrc(aluResultSrc),
.immSrc(immSrc),
.aluControl(aluControl)
    );

datapath datapathInst (
.clk(clk),
.reset(reset),
.resultSrc(resultSrc),
.pcSrc(pcSrc),
.aluSrc(aluSrc), 
.pcTargetSrc(pcTargetSrc),
.aluResultSrc(aluResultSrc),
.regWrite(regWrite),
.storeSrc(storeSrc),
.loadSrc(loadSrc),
.immSrc(immSrc),
.aluControl(aluControl),
.instr(instr),
.readData(readData),
.zero(zero), 
.beq(beq), 
.bne(bne), 
.blt(blt), 
.bge(bge), 
.bltu(bltu), 
.bgeu(bgeu),
.pc(pc),
.result(result),
.storeData(storeData)
    );	

endmodule
