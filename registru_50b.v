`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2020 01:33:40 PM
// Design Name: 
// Module Name: registru_50b
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


module registru_50b(
    input [49:0]mantise,
    input clk, clear, load,
    output reg [49:0]saved_mants
    );

    always @(posedge clk)
        if(clear)
            saved_mants <= 50'b0;
        else if(load)
            saved_mants <= mantise;
endmodule
