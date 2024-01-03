`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2023 15:45:06
// Design Name: 
// Module Name: mainDecoder
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


module mainDecoder(
input logic [6:0] op,
output logic [2:0] resultSrc,
output logic memWrite, branch, aluSrc, pcTargetSrc, regWrite, jump,
output logic [2:0] immSrc, 
output logic [1:0] aluOp
    );

logic [13:0] control;

assign {regWrite, immSrc, aluSrc, pcTargetSrc, memWrite, resultSrc, branch, aluOp, jump} = control;
   
always_comb
begin
    case(op)
        7'b0110011: control = 14'b1_000_0_0_0_000_0_01_0;  //R-type
        7'b0010011: control = 14'b1_000_1_0_0_000_0_01_0;  //I-type (ALU)
        7'b0000011: control = 14'b1_000_1_0_0_001_0_00_0;  //I-type (lw)
        7'b0100011: control = 14'b0_001_1_0_1_000_0_00_0;  //S-type (sw)   
        7'b1100011: control = 14'b0_010_0_0_0_000_1_00_0;  //B-type
        7'b1101111: control = 14'b1_011_0_0_0_010_0_00_1;  //J-type (jal)
        7'b1100111: control = 14'b1_000_1_1_0_010_0_00_1;  //I-type (jalr)
        7'b0110111: control = 14'b1_100_0_0_0_100_0_00_0;  //U-type (lui)
        7'b0010111: control = 14'b1_100_0_0_0_011_0_00_0;  //U-type (auipc)      
        7'b0000000: control = 14'b0_000_0_0_0_000_0_00_0;  //reset
        default: control = 14'bx;
    endcase   
end
	   
endmodule
