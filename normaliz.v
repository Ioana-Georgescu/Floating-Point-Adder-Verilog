`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2020 09:40:54 AM
// Design Name: 
// Module Name: normaliz
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


module normaliz(
    input [25:0]sum_mants,
    output [8:0]val2,
    output [23:0]mant_norm
    );

    reg [8:0]v2 = 8'b0;
    reg semn;
    reg [24:0]mant;

    always @(*)
    begin
        semn = sum_mants[25];
        mant = sum_mants[24:0];
        if(sum_mants[24] == 1)
            begin
                while(mant[23] != 1)
                begin
                    mant = mant >> 1;
                    v2[7:0] = v2[7:0] + 1;
                end
                v2[8] = 0;//exponentul trebuie incrementat
            end
        else
            begin
                if(mant[23] == 1)//deja normalizata
                    begin
                        v2 = 8'b0;
                    end
                else
                    begin
                        if(mant != 0)
                            begin
                                while(mant[23] != 1)
                                begin
                                    mant = mant << 1;
                                    v2[7:0] = v2[7:0] + 1;
                                end
                                v2[8] = 1;//exponentul trebuie decrementat
                            end
                        else
                            v2[7:0] = 8'hff;
                    end
            end
    end

    assign mant_norm = {semn, mant[22:0]};
    assign val2 = v2;

endmodule
