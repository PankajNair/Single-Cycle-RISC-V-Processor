`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2023 12:25:01
// Design Name: 
// Module Name: pcTargetMux
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


module pcTargetMux(
input logic [31:0] pc, A,
input logic pcTargetSrc,
output logic [31:0] targetResult
    );

assign targetResult = (pcTargetSrc)?A:pc;

endmodule
