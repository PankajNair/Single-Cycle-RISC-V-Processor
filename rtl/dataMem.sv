`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.12.2023 23:08:20
// Design Name: 
// Module Name: dataMem
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


module dataMem(
input logic clk, WE,
input logic [31:0] A,
input logic [31:0] WD,
input logic [3:0] writeStrobe,
output logic [31:0] RD
    );
    
logic [31:0] dm [63:0];
integer i;

initial 
begin
    for(i=0;i<64;i=i+1)
        dm[i] = i;
end

always_ff @(posedge clk)
begin 
    if(WE)
        case(writeStrobe)
            4'b1111: dm[A[31:2]] <= WD;
            4'b1100: dm[A[31:2]][31:16] <= WD[15:0];
            4'b0011: dm[A[31:2]][15:0]  <= WD[15:0];
            4'b1000: dm[A[31:2]][31:24] <= WD[7:0];
            4'b0100: dm[A[31:2]][23:16] <= WD[7:0];
            4'b0010: dm[A[31:2]][15:8]  <= WD[7:0];
            4'b0001: dm[A[31:2]][7:0]   <= WD[7:0];
            default: dm[A[31:2]] <= WD;
        endcase
end

assign RD = dm[A[31:2]];
endmodule
