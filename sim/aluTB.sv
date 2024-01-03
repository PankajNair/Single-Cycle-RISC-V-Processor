`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2023 20:35:34
// Design Name: 
// Module Name: aluTB
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


module aluTB();

logic [31:0] A;
logic [31:0] B;
logic [3:0]  aluControl;
logic  zero, beq, bne, blt, bge, bltu, bgeu;
logic [31:0] aluResult;

alu uut (
.A(A), 
.B(B), 
.aluControl(aluControl), 
.zero(zero),
.beq(beq), 
.bne(bne), 
.blt(blt), 
.bge(bge), 
.bltu(bltu), 
.bgeu(bgeu),
.aluResult(aluResult));

initial 
begin
   A = 32'd4;
   B = -32'd5;
   aluControl = 4'h0; // test add operation
   #10;
   aluControl = 4'h1; // test sub operation
   #10;
   aluControl = 4'h2; // test and operation
   #10;
   aluControl = 4'h3; // test or operation
   #10;
   aluControl = 4'h4; // test xor operation
   #10;
   aluControl = 4'h5; // test slt operation
   #10;
   aluControl = 4'h6; // test sltu operation
   #10;
   aluControl = 4'h7; // test lui operation
   #10;
   aluControl = 4'h8; // test auipc operation
   #10;
   aluControl = 4'h9; // test LUI operation
   #10;
   aluControl = 4'ha; // test sll operation
   #10;
   aluControl = 4'hb; // test sra operation
   #10;
   aluControl = 4'hc; // test srl operation
   #10;
   $finish;
end 

initial 
begin
   $monitor("Time %d, Result = %d, Zero = %b", $time, aluResult, zero);
end

endmodule
