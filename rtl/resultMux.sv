`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2023 16:35:20
// Design Name: 
// Module Name: resultMux
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


module resultMux(
input logic [2:0] resultSrc,
input logic [31:0] readData, aluResult, pcPlus4, pcTarget, immExt,
output logic [31:0] result
    );

always_comb
begin
    case(resultSrc)
        3'b000: result = aluResult;
        3'b001: result = readData;
        3'b010: result = pcPlus4;
        3'b011: result = pcTarget;
        3'b100: result = immExt;
        default: result = 32'bx;
    endcase
end

endmodule
