`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2020 09:42:50 AM
// Design Name: 
// Module Name: comp_exp
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


module comp_exp(
    input [15:0]exponenti,
    output [15:0]exponenti_fw,
    output [8:0]val1
    );

    reg [8:0]diff;

    assign exponenti_fw = exponenti;

    always @(*)
        begin
            diff = exponenti[7:0] - exponenti[15:8];
    
            if(diff[8] > 0)
                diff[7:0] = ~diff[7:0] + 1;
        end

    assign val1 = diff;

endmodule
