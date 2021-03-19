`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2020 09:24:11 AM
// Design Name: 
// Module Name: registru_16b
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


module registru_16b(
    input [15:0]exponenti,
    input clk, clear, load,
    output reg [15:0]saved_exps
    );

    always @(posedge clk)
    begin
        if(clear)
            saved_exps <= 16'b0;
        else if(load)
            saved_exps <= exponenti;
    end

endmodule
