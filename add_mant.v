`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2020 01:18:39 PM
// Design Name: 
// Module Name: add_mant
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


module add_mant(
    input [49:0]mantise_conc,
    input op,
    output [25:0]sum
    );

    reg semn1, semn2;
    reg [23:0]mant1, mant2;
    reg [24:0]s;
    reg semn_s;

    always @(*)
    begin
        semn1 = mantise_conc[49];
        semn2 = mantise_conc[24];
        mant1 = mantise_conc[48:25];
        mant2 = mantise_conc[23:0];

        if(op == 0)//adunare
            begin
                if(semn1 == semn2)
                    begin
                        s = mant1 + mant2;
                        semn_s = semn1;
                    end
                else
                    begin
                        if(mant1 >= mant2)
                            begin
                                s = mant1 - mant2;
                                semn_s = semn1;
                            end
                        else
                            begin
                                s = mant2 - mant1;
                                semn_s = semn2;
                            end
                    end
            end
        else//scadere
            begin
                if(semn1 == semn2)
                    begin
                        if(mant1 >= mant2)
                            begin
                                s = mant1 - mant2;
                                semn_s = semn1;
                            end
                        else
                            begin
                                s = mant2 - mant1;
                                semn_s = ~semn2;
                            end
                    end
                else
                    begin
                        semn_s = semn1;
                        s = mant1 + mant2;
                    end
        end
    end

    assign sum = {semn_s, s};

endmodule
