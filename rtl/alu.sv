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
//////////////////////////////////////////////////////////////////////////////////


module alu(
input logic signed [31:0] A, B,
input logic [4:0] aluControl,
output logic signed [31:0] aluResult,
output logic zero, beq, bne, blt, bge, bltu, bgeu
    );

logic [63:0] result;

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
        5'ha: result = A*B;                                  //mul
        5'hb: result = A*B;                                  //mulh
        5'hc: result = A*$unsigned(B);                       //mulsu
        5'hd: result = $unsigned(A)*$unsigned(B);            //mulu
        5'he: result = A/B;                                  //div
        5'hf: result = $unsigned(A)/$unsigned(B);            //divu
        5'h10: result = A%B;                                 //rem
        5'h11: result = $unsigned(A)%$unsigned(B);           //remu
        default: result = 32'bx;
    endcase
end

assign aluResult = (aluControl == (5'hb|5'hc|5'hd))? result[63:32]:result[31:0];

assign zero = (aluResult == 32'b0);
assign beq = (A==B);
assign bne = (A!=B);
assign blt = (A<B);
assign bge = (A>=B);
assign bltu = ($unsigned(A)<$unsigned(B));
assign bgeu = ($unsigned(A)>=$unsigned(B));

endmodule
