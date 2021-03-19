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


module registru_48b(
    input [47:0]mantise,
    input clk, clear, load,
    output reg [47:0]saved_mants
    );

    always @(posedge clk)
    begin
        if(clear)
            saved_mants <= 48'b0;
        else if(load)
            saved_mants <= mantise;
    end

endmodule
