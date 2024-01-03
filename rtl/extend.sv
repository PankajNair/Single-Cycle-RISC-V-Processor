`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2023 00:46:50
// Design Name: 
// Module Name: extend
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


module extend(
input logic [31:7] instr,
input logic [2:0] immSrc,
output logic [31:0] immExt
    );

always_comb
begin
    case(immSrc)
        3'b000: immExt = {{20{instr[31]}}, instr[31:20]};                                //I
        3'b001: immExt = {{20{instr[31]}}, instr[31:25], instr[11:7]};                   //S
        3'b010: immExt = {{20{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0};   //B 
        3'b011: immExt = {{12{instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0}; //J
        3'b100: immExt = {instr[31:12], 12'b0};                                          //U
        default: immExt = 32'bx;
    endcase
end

endmodule
