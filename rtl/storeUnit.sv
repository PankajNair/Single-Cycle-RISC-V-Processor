`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2024 23:20:46
// Design Name: 
// Module Name: storeUnit
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


module storeUnit(
input logic [1:0] storeSrc,
input logic [31:0] writeData,
input logic [31:0] storeAddress,
output logic [31:0] storeData
    );

always_comb
begin
    case(storeSrc)
    2'b10: storeData = writeData;  //sw
    2'b01: case(storeAddress[1:0]) //sh
            2'b00: storeData = {{16{writeData[15]}},writeData[15:0]};
            2'b01: storeData = {{16{writeData[31]}},writeData[31:16]};
           endcase
    2'b00: case(storeAddress[1:0]) //sb
            2'b00: storeData = {{24{writeData[7]}},writeData[7:0]};
            2'b01: storeData = {{24{writeData[15]}},writeData[15:8]};
            2'b10: storeData = {{24{writeData[23]}},writeData[23:16]};
            2'b11: storeData = {{24{writeData[31]}},writeData[31:24]};
           endcase
    default: storeData = writeData;
    endcase
end

endmodule
