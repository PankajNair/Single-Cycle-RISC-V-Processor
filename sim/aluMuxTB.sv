`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2023 16:54:25
// Design Name: 
// Module Name: aluMuxTB
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


module aluMuxTB();

logic [31:0] RD2;
logic [31:0] immExt;
logic aluSrc;
logic [31:0] srcB;

aluMux uut (
.RD2(RD2), 
.immExt(immExt), 
.aluSrc(aluSrc), 
.srcB(srcB));

initial begin
   RD2 = 32'd12345678;
   immExt = 32'd87654321;
   aluSrc = 1'b0;
   #10;
   aluSrc = 1'b1;
   #10;
   $finish;
end 

initial begin
   $monitor("Time %d, B = %h", $time, srcB);
end

endmodule
