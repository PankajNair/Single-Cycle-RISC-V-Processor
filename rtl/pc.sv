`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2023 14:03:15
// Design Name: 
// Module Name: pc
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


module pc(
input logic clk, reset,
input logic [31:0] pcNext,
output logic [31:0] pc
    );
    
always_ff @(posedge clk, posedge reset)
begin
    if(reset)
        pc <= 0;
    else
        pc <= pcNext;
end
endmodule
