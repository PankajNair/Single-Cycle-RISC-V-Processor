`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2024 12:07:51
// Design Name: 
// Module Name: multiply
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


module multiply(
input logic signed [31:0] A, B,
input logic [4:0] multControl,
output logic signed [31:0] multResult
    );

logic [63:0] result;

always_comb
begin
    case(multControl)
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

assign multResult = (multControl == (5'hb|5'hc|5'hd))? result[63:32]:result[31:0];

endmodule
