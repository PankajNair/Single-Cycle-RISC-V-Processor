`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2023 19:55:12
// Design Name: 
// Module Name: alu
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
// Change auipc to add and add multiplexer in path for auipc or add inst
//////////////////////////////////////////////////////////////////////////////////


module alu(
input logic signed [31:0] A, B,
input logic [3:0] aluControl,
output logic signed [31:0] aluResult,
output logic zero, beq, bne, blt, bge, bltu, bgeu
    );

always_comb
begin
    case(aluControl)
        4'h0: aluResult = A+B;                                  //add
        4'h1: aluResult = A-B;                                  //sub
        4'h2: aluResult = A&B;                                  //and
        4'h3: aluResult = A|B;                                  //or
        4'h4: aluResult = A^B;                                  //xor
        4'h5: aluResult = {31'b0,(A<B)};                        //slt
        4'h6: aluResult = {31'b0,($unsigned(A)<$unsigned(B))};  //sltu
        4'h7: aluResult = A<<B;                                 //sll
        4'h8: aluResult = A>>>B;                                //sra
        4'h9: aluResult = A>>B;                                 //srl
        default: aluResult = 32'bx;
    endcase
end

assign zero = (aluResult == 32'b0);
assign beq = (A==B);
assign bne = (A!=B);
assign blt = (A<B);
assign bge = (A>=B);
assign bltu = ($unsigned(A)<$unsigned(B));
assign bgeu = ($unsigned(A)>=$unsigned(B));

endmodule
