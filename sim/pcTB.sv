`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2023 14:08:15
// Design Name: 
// Module Name: pcTB
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


module pcTB();

logic clk = 0; 
logic reset;
logic [31:0] pcNext;
logic [31:0] pc;

always #5 clk = ~clk;

pc uut (
.clk(clk), 
.reset(reset), 
.pcNext(pcNext), 
.pc(pc));

initial begin
   reset = 0;
   #10;
   reset = 1;
   #10;
   reset = 0;
   pcNext = 32'd12345678;
   #10;
   pcNext = 32'd17291729;
   #10;
   pcNext = 32'd87654321;
   #10;
   $finish;
end
 
endmodule
