`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2020 09:43:24 AM
// Design Name: 
// Module Name: floating_point_adder
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


module floating_point_adder(
    input [15:0]exponenti,
    input [47:0]mantise,
    input clk, load, clear, op,
    output [7:0]rez_exp,
    output [23:0]rez_mant
    );

    wire [15:0]exps1, exps2, exps3;
    wire [7:0] exp1, exp2, exp3, exp4;
    wire [8:0]val1, val2;
    wire [49:0]mants, saved_mants;
    wire [56:0]mants_conc, saved_mants_conc, mants_alin, saved_mants_alin;
    wire [25:0]sum, saved_sum;
    wire [23:0]mant_norm;


    registru_16b registrul_1_exp (exponenti, clk, clear, load, exps1);
    registru_48b registrul_1_mant (mantise, clk, clear, load, mants);

    comp_exp modulul_1 (exps1, exps2, val1);
    concat modulul_7 (mants, val1, mants_conc);
    registru_16b registrul_2_exp (exps2, clk, clear, load, exps3);
    registru_57b registrul_2_mant (mants_conc, clk, clear, load, saved_mants_conc);

    aleg_exp modulul_2 (exps3, exp1);
    alin_mant modulul_4 (saved_mants_conc, mants_alin);
    registru_8b registrul_3_exp (exp1, clk, clear, load, exp2);
    registru_50b registrul_3_mant (mants_alin, clk, clear, load, saved_mants_alin);

    add_mant modulul_5 (saved_mants_alin, op, sum);
    registru_8b registrul_4_exp (exp2, clk, clear, load, exp3);
    registru_26b registrul_4_mant (sum, clk, clear, load, saved_sum);

    normaliz modulul_6 (saved_sum, val2, mant_norm);
    ajust_exp modulul_3 (val2, exp3, exp4);
    registru_8b registrul_5_exp (exp4, clk, clear, load, rez_exp);
    registru_24b registrul_5_mant (mant_norm, clk, clear, load, rez_mant);

endmodule
