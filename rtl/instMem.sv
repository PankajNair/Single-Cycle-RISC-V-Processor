`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.12.2023 22:27:19
// Design Name: 
// Module Name: instMem
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


module instMem(
input logic [31:0] A,
output logic [31:0] RD
    );

logic [31:0] im [63:0];

initial
begin
    $readmemh("riscvtest.mem", im);
end

assign RD = im[A[31:2]];
    
endmodule
