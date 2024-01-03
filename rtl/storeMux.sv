`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.12.2023 03:56:46
// Design Name: 
// Module Name: storeMux
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


module storeMux(
input logic [1:0] storeSrc,
input logic [31:0] storeAddress,
output logic [3:0] writeStrobe
    );

always_comb
begin
    case(storeSrc)
    2'b10: writeStrobe = 4'b1111;  //sw
    2'b01: case(storeAddress[1:0]) //sh
            2'b00: writeStrobe = 4'b0011;
            2'b01: writeStrobe = 4'b1100;
           endcase
    2'b00: case(storeAddress[1:0]) //sb
            2'b00: writeStrobe = 4'b0001;
            2'b01: writeStrobe = 4'b0010;
            2'b10: writeStrobe = 4'b0100;
            2'b11: writeStrobe = 4'b1000;
           endcase
    default: writeStrobe = 4'b1111;
    endcase
end

endmodule

