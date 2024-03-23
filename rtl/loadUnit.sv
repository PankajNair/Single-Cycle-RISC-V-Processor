`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.03.2024 23:18:41
// Design Name: 
// Module Name: loadUnit
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


module loadUnit(
input logic [2:0] loadSrc,
input logic [31:0] readData,
input logic [31:0] loadAddress,
output logic [31:0] loadData
    );

always_comb
begin
    case (loadSrc)
        3'b010: loadData = readData;   //lw
        3'b001: case(loadAddress[1:0]) //lh
                    2'b00: loadData = {{16{readData[15]}},readData[15:0]};
                    2'b01: loadData = {{16{readData[31]}},readData[31:16]};
                endcase
        3'b000: case(loadAddress[1:0]) //lb
                    2'b00: loadData = {{24{readData[7]}},readData[7:0]};
                    2'b01: loadData = {{24{readData[15]}},readData[15:8]};
                    2'b10: loadData = {{24{readData[23]}},readData[23:16]};
                    2'b11: loadData = {{24{readData[31]}},readData[31:24]};
                endcase
        3'b100: case(loadAddress[1:0]) //lhu
                    2'b00: loadData = {16'b0,readData[15:0]};
                    2'b01: loadData = {16'b0,readData[31:16]};
                endcase
        3'b011: case(loadAddress[1:0]) //lbu
                    2'b00: loadData = {24'b0,readData[7:0]};
                    2'b01: loadData = {24'b0,readData[15:8]};
                    2'b10: loadData = {24'b0,readData[23:16]};
                    2'b11: loadData = {24'b0,readData[31:24]};
                endcase
        default: loadData = readData;
    endcase
end

endmodule
