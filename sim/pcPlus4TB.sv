`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2023 14:16:39
// Design Name: 
// Module Name: pcPlus4TB
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


module pcPlus4TB();

logic [31:0] pc;
logic [31:0] pcPlus4;

pcPlus4 uut (
.pc(pc), 
.pcPlus4(pcPlus4));

initial begin
   pc = 32'd0;
   #10;
   pc = 32'd4;
   #10;
   pc = 32'd8;
   #10;
   pc = 32'd12;
   #10;
   $finish;
end 

initial begin
   $monitor("Time %d, PC = %d, PCPlus4 = %d", $time, pc, pcPlus4);
end

endmodule
