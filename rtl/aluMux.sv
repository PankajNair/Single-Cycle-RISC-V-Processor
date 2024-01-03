`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2023 16:49:13
// Design Name: 
// Module Name: aluMux
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


module aluMux(
input logic [31:0] RD2, immExt,
input logic aluSrc,
output logic [31:0] srcB
    );
 
assign srcB = (aluSrc)? immExt:RD2;
 
endmodule
