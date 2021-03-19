`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2020 01:26:03 AM
// Design Name: 
// Module Name: registru_26b
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

module registru_26b(
    input [25:0]mant_sum,
    input clk, clear, load,
    output reg [25:0]saved_mant_sum
    );

    always @(posedge clk)
        if(clear)
            saved_mant_sum <= 26'b0;
        else if(load)
            saved_mant_sum <= mant_sum;

endmodule