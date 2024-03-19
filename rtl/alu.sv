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
input logic [4:0] aluControl,
output logic signed [31:0] aluResult,
output logic zero, beq, bne, blt, bge, bltu, bgeu
    );

logic [31:0] result;

always_comb
begin
    case(aluControl)
        5'h0: result = A+B;                                  //add
        5'h1: result = A-B;                                  //sub
        5'h2: result = A&B;                                  //and
        5'h3: result = A|B;                                  //or
        5'h4: result = A^B;                                  //xor
        5'h5: result = {31'b0,(A<B)};                        //slt
        5'h6: result = {31'b0,($unsigned(A)<$unsigned(B))};  //sltu
        5'h7: result = A<<B;                                 //sll
        5'h8: result = A>>>B;                                //sra
        5'h9: result = A>>B;                                 //srl
        default: result = 32'bx;
    endcase
end

assign aluResult = result;

assign zero = (aluResult == 32'b0);
assign beq = (A==B);
assign bne = (A!=B);
assign blt = (A<B);
assign bge = (A>=B);
assign bltu = ($unsigned(A)<$unsigned(B));
assign bgeu = ($unsigned(A)>=$unsigned(B));

endmodule
