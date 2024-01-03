`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.12.2023 22:20:55
// Design Name: 
// Module Name: regFileTB
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


module regFileTB();

logic clk = 0;
logic WE3;
logic [4:0] RA1, RA2, WA3;
logic [31:0] RD1, RD2, WD3;

always #5 clk = ~clk;

regFile uut (
.clk(clk), 
.WE3(WE3), 
.RA1(RA1), 
.RA2(RA2), 
.WA3(WA3), 
.WD3(WD3), 
.RD1(RD1), 
.RD2(RD2));

initial begin
   WE3 = 0;
   WA3 = 5'b00001;
   WD3 = 32'd12345678;
   RA1 = 5'b00001;
   RA2 = 5'b00010;
   #10;
   RA1 = 5'b00001;
   RA2 = 5'b00010;
   WE3 = 1;;
   #10;
   $finish;
end 

initial begin
   $monitor("Time %d, RD1 = %d, RD2 = %d", $time, RD1, RD2);
end

endmodule
