`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2024 12:22:30
// Design Name: 
// Module Name: aluResultMux
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


module aluResultMux(
input logic [31:0] aluResult,
input logic [31:0] multResult,
input logic aluResultSrc,
output logic [31:0] result
    );

assign result = (aluResultSrc)? multResult:aluResult;

endmodule
