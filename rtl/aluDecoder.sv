`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.12.2023 15:45:56
// Design Name: 
// Module Name: aluDecoder
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


module aluDecoder(
input logic	opB5,
input logic [2:0] funct3,
input logic	funct7B5,
input logic [1:0] aluOp,
output logic [3:0] aluControl
    );

always_comb
begin
    case(aluOp)
        2'b00: aluControl = 4'h0;                 //add (lw, sw)
        2'b01: case(funct3)                       //R-type or I-type ALU
                   3'h0: if (funct7B5 & opB5)      
                               aluControl = 4'h1; //sub
                           else 
                               aluControl = 4'h0; //add, addi
                   3'h1: aluControl = 4'h7;       //sll, slli
                   3'h2: aluControl = 4'h5;       //slt, slti
                   3'h3: aluControl = 4'h6;       //sltu, sltui
                   3'h4: aluControl = 4'h4;       //xor
                   3'h5: if (funct7B5) 
                               aluControl = 4'h8; //sra
                           else 
                               aluControl = 4'h9; //srl        
                   3'h6: aluControl = 4'h3;       //or, ori
                   3'h7: aluControl = 4'h2;       //and, andi
                   default: aluControl = 4'bxxx; 
               endcase
        default: aluControl = 4'bxxxx;
    endcase
end

endmodule
