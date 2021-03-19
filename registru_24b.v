`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2020 09:32:45 AM
// Design Name: 
// Module Name: registru_48b
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


module registru_24b(
    input [23:0]mantisa,
    input clk, clear, load,
    output reg [23:0]saved_mant
    );

    always @(posedge clk)
        if(clear)
            saved_mant <= 24'b0;
        else if(load)
            saved_mant <= mantisa;

endmodule