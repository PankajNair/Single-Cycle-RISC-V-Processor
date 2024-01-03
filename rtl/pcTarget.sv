`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2023 17:00:15
// Design Name: 
// Module Name: pcTarget
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


module pcTarget(
input logic [31:0] pc,
input logic [31:0] immExt,
output logic [31:0] pcTarget
    );

assign pcTarget = pc+immExt;

endmodule
