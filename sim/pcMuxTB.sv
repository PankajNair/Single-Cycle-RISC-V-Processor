`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2023 17:01:58
// Design Name: 
// Module Name: pcMuxTB
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


module pcMuxTB();
logic [31:0] pcPlus4;
logic [31:0] pcTarget;
logic pcSrc;
logic [31:0] pcNext;

pcMux uut (
.pcPlus4(pcPlus4), 
.pcTarget(pcTarget), 
.pcSrc(pcSrc), 
.pcNext(pcNext));

initial begin
   pcPlus4 = 32'd4;
   pcTarget = 32'd12345678;
   pcSrc = 0;
   #10;
   pcSrc = 1;
   #10;
   $finish;
end 

initial begin
   $monitor("Time %d, PCNext = %d", $time, pcNext);
end

endmodule
