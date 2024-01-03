`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.12.2023 20:51:25
// Design Name: 
// Module Name: controlUnitTB
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


module controlUnitTB();

logic [6:0] op;
logic [2:0] funct3;
logic funct7B5;
logic zero, beq, bne, blt, bge, bltu, bgeu;
logic [2:0] resultSrc;
logic memWrite, pcSrc, aluSrc, regWrite, pcTargetSrc;
logic [2:0] immSrc;
logic [3:0] aluControl;

controlUnit uut(
.op(op),
.funct3(funct3),
.funct7B5(funct7B5), 
.zero(zero), 
.beq(beq), 
.bne(bne), 
.blt(blt), 
.bge(bge), 
.bltu(bltu), 
.bgeu(bgeu),
.resultSrc(resultSrc),
.memWrite(memWrite), 
.pcSrc(pcSrc), 
.aluSrc(aluSrc), 
.regWrite(regWrite), 
.pcTargetSrc(pcTargetSrc),
.immSrc(immSrc),
.aluControl(aluControl)
    );

initial 
begin
   op = 7'b0000011; // load
   funct3 = 3'b010;
   funct7B5 = 1'b0;
   zero = 1'b0; beq = 1'b0; bne = 1'b0; blt = 1'b0; bge = 1'b0; bltu = 1'b0; bgeu = 1'b0;
   #10;
   op = 7'b0110011; // add
   funct3 = 3'b000;
   funct7B5 = 1'b0;
   zero = 1'b0; beq = 1'b0; bne = 1'b0; blt = 1'b0; bge = 1'b0; bltu = 1'b0; bgeu = 1'b0;
   #10;    
   $finish;
end 

initial 
begin
   $monitor("Time %d, resultSrc = %b, memWrite = %b, pcSrc = %b, aluSrc = %b, regWrite = %b, immSrc = %b, aluControl = %b, pcTargetSrc = %b", 
   $time, resultSrc, memWrite, pcSrc, aluSrc, regWrite, immSrc, aluControl, pcTargetSrc);
end
endmodule
