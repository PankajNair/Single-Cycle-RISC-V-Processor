`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2023 21:37:32
// Design Name: 
// Module Name: datapathTB
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


module datapathTB();

logic clk=0; 
logic reset;
logic [2:0] resultSrc;
logic pcSrc, aluSrc, regWrite;
logic [2:0] immSrc;
logic [3:0] aluControl;
logic [31:0] instr;
logic [31:0] readData;
logic zero, beq, bne, blt, bge, bltu, bgeu;
logic [31:0] pc, aluResult, writeData;

datapath uut(
.clk(clk), 
.reset(reset), 
.resultSrc(resultSrc), 
.pcSrc(pcSrc), 
.aluSrc(aluSrc), 
.regWrite(regWrite),
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
.aluResult(aluResult), 
.writeData(writeData));

always #10 clk = ~clk;

initial begin
   reset = 1; 
   #20; 
   reset = 0; 
   instr = 'b010011; //addi
   readData = 'b001;
   resultSrc = 3'b000;
   pcSrc = 0;
   aluSrc = 1;
   regWrite = 1;
   immSrc = 3'b000;
   aluControl = 4'b0010;
   #20;
   $finish;
end

initial begin
   $monitor("Time %t, Zero = %b, PC = %d, ALUResult = %d, WriteData = %d", $time, zero, pc, aluResult, writeData);
end

endmodule
