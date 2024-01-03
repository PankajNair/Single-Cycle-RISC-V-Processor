`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2023 00:13:59
// Design Name: 
// Module Name: dataMemTB
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


module dataMemTB();
logic clk = 0; 
logic WE;
logic [31:0] A;
logic [31:0] WD;
logic [3:0] writeStrobe;
logic [31:0] RD;

always #5 clk = ~clk;

dataMem uut (
.clk(clk), 
.WE(WE), 
.A(A), 
.WD(WD), 
.writeStrobe(writeStrobe),
.RD(RD));

initial begin
   WE = 0;
   A = 32'd4;
   writeStrobe = 4'b1111;
   WD = 32'd12345678;
   #10
   WE = 1;
   #10
   WE=0;
   WD = 32'd0;
   writeStrobe = 4'b0010;
   #10;
   WE = 1;
   #10
   $finish;
end 

initial begin
   $monitor("Time %d, RD = %h", $time, RD);
end

endmodule
