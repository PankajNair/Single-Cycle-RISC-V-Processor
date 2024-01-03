`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2023 17:01:08
// Design Name: 
// Module Name: pcTargetTB
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


module pcTargetTB();
logic [31:0] pc;
logic [31:0] immExt;
logic [31:0] pcTarget;

pcTarget uut (
.pc(pc), 
.immExt(immExt), 
.pcTarget(pcTarget));

initial begin
   pc = 32'd4;
   immExt = 32'd4;
   #10;
   pc = 32'd12;
   immExt = 32'd10;
   #10;
   $finish;
end 

initial begin
   $monitor("Time %d, PCTarget = %h", $time, pcTarget);
end

endmodule
