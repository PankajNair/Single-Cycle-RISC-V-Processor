`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.12.2023 23:08:20
// Design Name: 
// Module Name: dataMem
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


module dataMem(
input logic clk, WE,
input logic [31:0] A,
input logic [31:0] WD,
output logic [31:0] RD
    );
    
logic [31:0] dm [63:0];
integer i;

initial 
begin
    for(i=0;i<64;i=i+1)
        dm[i] = i;
end

always_ff @(posedge clk)
begin 
    if(WE)
        dm[A[31:2]] <= WD;
end

assign RD = dm[A[31:2]];
endmodule
