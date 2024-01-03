`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.12.2023 22:50:30
// Design Name: 
// Module Name: instMemTB
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


module instMemTB();

logic [31:0] A;
logic [31:0] RD;

instMem uut (
.A(A), 
.RD(RD));

initial begin
   A = 32'd0;
   #10;
   A = 32'd4;
   #10;
   A = 32'd8;
   #10;
   A = 32'd12;
   #10;
   $finish;
end 

initial begin
   $monitor("Time %d, RD = %h", $time, RD);
end

endmodule
