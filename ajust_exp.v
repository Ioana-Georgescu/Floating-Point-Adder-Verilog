`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2020 09:38:26 AM
// Design Name: 
// Module Name: ajust_exp
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


module ajust_exp(
    input [8:0]val2,
    input [7:0]exponent,
    output [7:0]exp_ajust
    );

    reg [8:0]v2;
    reg [7:0]exp;

    always @(*)
    begin
        v2 = val2;
        if(v2[7:0] == 8'hff)//toti bitii pe 1
            begin
                exp = 0;
            end
        else
            if(v2 == 0)//deja normalizat
                begin
                    exp = exponent;
                end
            else
                if(v2[8] == 1)//exponentul trebuie decrementat
                    begin
                        if(exponent < v2[7:0])
                            exp = 0;
                        else
                            exp = exponent - v2[7:0];
                    end
                else//exponentul trebuie incrementat
                    begin
                        exp = exponent + v2[7:0];
                    end
    end

    assign exp_ajust = exp;

endmodule
