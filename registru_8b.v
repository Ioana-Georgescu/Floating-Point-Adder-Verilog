`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2020 09:31:35 AM
// Design Name: 
// Module Name: registru_8b
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


module registru_8b(
    input [7:0]exponent,
    input clk, clear, load,
    output reg [7:0]saved_exp
    );

    always @(posedge clk)
        if(clear)
            saved_exp <= 8'b0;
        else if(load)
            saved_exp <= exponent;

endmodule
