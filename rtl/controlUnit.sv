`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2023 15:45:56
// Design Name: 
// Module Name: controlUnit
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


module controlUnit(
input logic [6:0] op,
input logic [2:0] funct3,
input logic [6:0] funct7,
input logic zero, beq, bne, blt, bge, bltu, bgeu,
output logic [2:0] resultSrc, loadSrc,
output logic memWrite, pcSrc, aluSrc, regWrite, pcTargetSrc,
output logic [2:0] immSrc,
output logic [1:0] storeSrc,
output logic [4:0] aluControl
    );

logic [1:0] aluOp;
logic branch;
logic jump;
  
mainDecoder mainDecoderInst (
.op(op),
.resultSrc(resultSrc),
.memWrite(memWrite), 
.branch(branch), 
.aluSrc(aluSrc), 
.regWrite(regWrite), 
.jump(jump),
.pcTargetSrc(pcTargetSrc),
.immSrc(immSrc), 
.aluOp(aluOp)
    );
    
aluDecoder aluDecoderInst (
.opB5(op[5]),
.funct3(funct3),
.funct7(funct7),
.aluOp(aluOp),
.aluControl(aluControl)
    );

always_comb
begin
    case(funct3)
        3'h0: pcSrc = branch&beq|jump;
        3'h1: pcSrc = branch&bne|jump;
        3'h4: pcSrc = branch&blt|jump;
        3'h5: pcSrc = branch&bge|jump;
        3'h6: pcSrc = branch&bltu|jump;
        3'h7: pcSrc = branch&bgeu|jump;
        default: pcSrc = 1'b0;
    endcase
end

always_comb
begin
    if(op==7'b0000011)
        begin
            case(funct3)
                3'h0: loadSrc = 3'b000; //lb
                3'h1: loadSrc = 3'b001; //lh
                3'h2: loadSrc = 3'b010; //lw
                3'h4: loadSrc = 3'b011; //lbu
                3'h5: loadSrc = 3'b100; //lhu
                default: loadSrc = 3'b010;
            endcase
        end
    else
        loadSrc = 3'b010;
end

always_comb
begin
    if(op==7'b0100011)
        begin
            case(funct3)
                3'h0: storeSrc = 2'b00; //sb
                3'h1: storeSrc = 2'b01; //sh
                3'h2: storeSrc = 2'b10; //sw
                default: storeSrc = 2'b10;
            endcase
        end
    else
        storeSrc = 2'b10;
end

endmodule
