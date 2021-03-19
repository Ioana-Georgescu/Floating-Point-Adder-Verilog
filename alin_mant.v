`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2020 09:40:01 AM
// Design Name: 
// Module Name: alin_mant
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


module alin_mant(
    input [56:0]mantise_conc,
    output [49:0]mantise_alin
    );

    reg semn1, semn2;
    reg [8:0]val1;
    reg [23:0]mant1, mant2, aux;

    always @(*)
        begin
            val1 = mantise_conc[56:48];
            semn1 = mantise_conc[47];
            mant1 = {1'b1, mantise_conc[46:24]};
            semn2 = mantise_conc[23];
            mant2 = {1'b1, mantise_conc[22:0]};

            if(val1[8] > 0)
                begin
                    aux = mant2 >> val1[7:0];
                    mant2 = aux;
                end
            else
                begin
                    aux = mant1 >> val1[7:0];
                    mant1 = aux;
                end
        end

    assign mantise_alin = {semn1, mant1, semn2, mant2};

endmodule
