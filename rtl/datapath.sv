`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2023 21:02:32
// Design Name: 
// Module Name: datapath
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


module datapath(
input logic	clk,reset,
input logic [2:0] resultSrc, loadSrc,
input logic	 pcSrc,aluSrc, pcTargetSrc,
input logic [1:0] storeSrc,
input logic	regWrite,
input logic [2:0] immSrc,
input logic [4:0] aluControl,
input logic [31:0] instr,
input logic [31:0] readData,
output logic zero, beq, bne, blt, bge, bltu, bgeu,
output logic [31:0] pc,
output logic [31:0] aluResult, writeData,
output logic [3:0] writeStrobe
    );
    
logic [31:0] pcNext,pcPlus4,pcTarget;
logic [31:0] immExt;
logic [31:0] srcA,srcB;
logic [31:0] result;
logic [31:0] targetResult;
logic [31:0] loadData;

pc pcInst(
.clk(clk), 
.reset(reset),
.pcNext(pcNext),
.pc(pc)
    );

pcMux pcMuxInst(
.pcPlus4(pcPlus4),
.pcTarget(pcTarget),
.pcSrc(pcSrc),
.pcNext(pcNext)
    );

pcPlus4 pcPlus4Inst(
.pc(pc),
.pcPlus4(pcPlus4)
    );

pcTarget pcTargetInst(
.pc(targetResult),
.immExt(immExt),
.pcTarget(pcTarget)
    );

pcTargetMux pcTargetMuxInst(
.pc(pc), 
.A(srcA),
.pcTargetSrc(pcTargetSrc),
.targetResult(targetResult)
    );
    
regFile regFileInst(
.clk(clk), 
.WE3(regWrite),
.RA1(instr[19:15]), 
.RA2(instr[24:20]), 
.WA3(instr[11:7]),
.WD3(result),
.RD1(srcA), 
.RD2(writeData)
    );

extend extendInst(
.instr(instr[31:7]),
.immSrc(immSrc),
.immExt(immExt)
    );

aluMux aluMuxInst(
.RD2(writeData), 
.immExt(immExt),
.aluSrc(aluSrc),
.srcB(srcB)
    );

alu aluInst(
.A(srcA), 
.B(srcB),
.aluControl(aluControl),
.aluResult(aluResult),
.zero(zero),
.beq(beq), 
.bne(bne), 
.blt(blt), 
.bge(bge), 
.bltu(bltu), 
.bgeu(bgeu)
    );

resultMux resultMuxInst(
.resultSrc(resultSrc),
.readData(loadData), 
.aluResult(aluResult), 
.pcPlus4(pcPlus4),
.pcTarget(pcTarget),
.immExt(immExt),
.result(result)
    );
    
loadMux loadMuxInst(
.loadSrc(loadSrc),
.loadAddress(aluResult),
.readData(readData),
.loadData(loadData)
    );

storeMux storeMuxInst(
.storeSrc(storeSrc),
.storeAddress(aluResult),
.writeStrobe(writeStrobe)
    );

endmodule
