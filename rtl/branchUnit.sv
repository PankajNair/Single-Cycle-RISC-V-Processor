`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2024 23:16:17
// Design Name: 
// Module Name: branchUnit
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


module branchUnit(
input logic signed [31:0] A, B,
output logic beq, bne, blt, bge, bltu, bgeu
    );

assign beq = (A==B);
assign bne = (A!=B);
assign blt = (A<B);
assign bge = (A>=B);
assign bltu = ($unsigned(A)<$unsigned(B));
assign bgeu = ($unsigned(A)>=$unsigned(B));

endmodule
