`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2023 16:40:11
// Design Name: 
// Module Name: resultMuxTB
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


module resultMuxTB();

logic [31:0] aluResult, readData, pcPlus4;
logic [1:0]  resultSrc;
logic [31:0] result;

resultMux uut (
.aluResult(aluResult),
.readData(readData),
.pcPlus4(pcPlus4),
.resultSrc(resultSrc),
.result(result));

initial begin
    aluResult = 32'b001;
    readData = 32'b010;
    pcPlus4 = 32'b011;
    resultSrc = 2'b00;
    #10;
    resultSrc = 2'b01;
    #10;
    resultSrc = 2'b10;
    #10;
    $finish;
end
    
initial begin
    $monitor("Time %t, Result=%d", $time, result);
end
    
endmodule
