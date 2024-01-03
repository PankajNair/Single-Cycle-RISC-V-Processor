`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2023 16:59:49
// Design Name: 
// Module Name: pcMux
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


module pcMux(
input logic [31:0] pcPlus4,
input logic [31:0] pcTarget,
input logic pcSrc,
output logic [31:0] pcNext
    );

assign pcNext = (pcSrc)? pcTarget:pcPlus4;

endmodule
