`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2020 09:42:09 AM
// Design Name: 
// Module Name: aleg_exp
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


module aleg_exp(
    input [15:0]exponenti,
    output [7:0]exponent
    );

    assign exponent = (exponenti[15:8] > exponenti[7:0]) ? exponenti[15:8] : exponenti[7:0];//exp;

endmodule
