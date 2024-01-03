`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2023 14:14:14
// Design Name: 
// Module Name: pcPlus4
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


module pcPlus4(
input logic [31:0] pc,
output logic [31:0] pcPlus4
    );
    
assign pcPlus4 = pc + 32'd4;

endmodule
