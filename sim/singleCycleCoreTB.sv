`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2023 23:16:45
// Design Name: 
// Module Name: singleCycleCoreTB
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


module singleCycleCoreTB();

logic clk = 0;
logic reset;
logic [31:0] instr;
logic [31:0] readData;
logic [31:0] pc;
logic memWrite;
logic [31:0] aluResult;
logic [31:0] writeData;

always #5 clk = ~clk;

singleCycleCore uut (
.clk(clk),
.reset(reset), 
.instr(instr), 
.readData(readData), 
.pc(pc), 
.memWrite(memWrite), 
.aluResult(aluResult), 
.writeData(writeData));

initial begin
   reset = 1'b1;
   #4;
   reset = 1'b0;
   instr = 32'h00400093; // addi x1, x0, 4
   readData = 32'h00000004;
   #15;
   $finish;
end 

initial begin
   $monitor("At time %d, PC = %h, MemWrite = %b, ALUResult = %h, WriteData = %h", $time, pc, memWrite, aluResult, writeData);
end

endmodule
