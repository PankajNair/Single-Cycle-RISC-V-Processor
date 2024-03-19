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
input logic	[6:0] funct7,
input logic [1:0] aluOp,
output logic [4:0] aluControl
    );

always_comb
begin
    case(aluOp)
        2'b00: aluControl = 5'h0;                                         //add (lw, sw)
        2'b01: case(funct3)                                               //R-type or I-type ALU
                   3'h0: if (funct7 == 7'h20 & opB5)      
                               aluControl = 5'h1;                         //sub
                         else if(funct7 == 7'h01)
                               aluControl = 5'ha;                         //mul
                         else 
                               aluControl = 5'h0;                         //add, addi
                   3'h1: aluControl = (funct7 == 7'h01)? 5'hb:5'h7;       //mulh, sll, slli
                   3'h2: aluControl = (funct7 == 7'h01)? 5'hc:5'h5;       //mulsu, slt, slti
                   3'h3: aluControl = (funct7 == 7'h01)? 5'hd:5'h6;       //mulu, sltu, sltui
                   3'h4: aluControl = (funct7 == 7'h01)? 5'he:5'h4;       //div, xor
                   3'h5: if (funct7 == 7'h20) 
                               aluControl = 5'h8;                         //sra
                         else if (funct7 == 7'h01)
                               aluControl = 5'hf;                         //divu
                         else
                               aluControl = 5'h9;                         //srl        
                   3'h6: aluControl = (funct7 == 7'h01)? 5'h10:5'h3;      //rem, or, ori
                   3'h7: aluControl = (funct7 == 7'h01)? 5'h11:5'h2;      //remu, and, andi
                   default: aluControl = 5'bx; 
               endcase
    endcase
end

endmodule
