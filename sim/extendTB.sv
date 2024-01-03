`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2023 11:31:03
// Design Name: 
// Module Name: extendTB
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


module extendTB();

logic [31:7] instr;
logic [1:0]  immSrc;
logic [31:0] immExt;

extend uut (
.instr(instr), 
.immSrc(immSrc), 
.immExt(immExt));

initial 
begin
   instr = 25'b1111111111000100101000110;
   immSrc = 2'b00;
   #10;
   instr = 25'b1111111111000100101000110;
   immSrc = 2'b01;
   #10;
   instr = 25'b1111111111000100101000110;
   immSrc = 2'b10;
   #10;
   instr = 25'b1111111111000100101000110;
   immSrc = 2'b11;
   #10;
   $finish;
end 

initial 
begin
   $monitor("Time %d, immExt = %b", $time, immExt);
end

endmodule
