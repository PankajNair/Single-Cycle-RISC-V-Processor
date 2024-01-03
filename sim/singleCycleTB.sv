`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2023 22:25:57
// Design Name: 
// Module Name: singleCycleTB
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


module singleCycleTB();
logic clk = 0;
logic reset;
logic [31:0] writeData, dataAddress;
logic memWrite;

always #10 clk = ~clk;

singleCycleTop uut(
.clk(clk),
.reset(reset),
.writeData(writeData),
.dataAddress(dataAddress),
.memWrite(memWrite));
  
initial 
begin
    reset = 1; 
    #10
    reset = 0;
end

// always @(negedge clk)
// begin
//     if(memWrite) 
//     begin
//         if(dataAddress == 100 & writeData === 25) 
//             begin
//                 $display("Simulation succeeded");
//                 $stop;
//             end   
//     end
//     else if(dataAddress !== 96) 
//     begin
//         $display("Simulation failed");
//         $stop;
//     end
// end

endmodule
