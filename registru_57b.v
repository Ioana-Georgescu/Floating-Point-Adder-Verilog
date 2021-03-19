`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2020 09:55:07 AM
// Design Name: 
// Module Name: registru_57b
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


module registru_57b(
    input [56:0]mantise_conc,
    input clk, clear, load,
    output reg [56:0]saved_mants_conc
    );

    always @(posedge clk)
        if(clear)
            saved_mants_conc <= 57'b0;
        else if(load)
            saved_mants_conc <= mantise_conc;

endmodule
