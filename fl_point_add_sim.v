`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/05/2020 11:36:47 AM
// Design Name: 
// Module Name: fl_point_add_sim
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


module fl_point_add_sim();

    reg [31:0]a, b, a1, b1, a2, b2, a3, b3, c;
    reg [15:0]exponenti;
    reg [47:0]mantise;
    reg clk, load, clear, op;
    wire [7:0]rez_exp;
    wire [23:0]rez_mant;

    floating_point_adder fl_add (exponenti, mantise, clk, load, clear, op, rez_exp, rez_mant);

    initial begin
        clear=1;
        clk=0;

        #5//seg 1 - operatia 1
            //operanzii pt prima operatie
            a = 32'b01000000100100000000000000000000;//4.5
            b = 32'b01000000010100000000000000000000;//3.25
            exponenti = {a[30:23], b[30:23]};
            mantise = {a[31], a[22:0], b[31], b[22:0]};

            load = 1; clear = 0;
        #5 load=0; clear=1;

        //seg 2 - operatia 1
        #5
            //operanzii pt a doua operatie
            a1 = 32'b01000000100100000000000000000000;//4.5
            b1 = 32'b01000000100100000000000000000000;//4.5
            exponenti = {a1[30:23], b1[30:23]};
            mantise = {a1[31], a1[22:0], b1[31], b1[22:0]};

            load = 1; clear = 0;
        #5 load=0; clear=1;

        //seg 3 - operatia 1
        #5 
            op = 0;//operatia 1

            //operanzii pt operatia 3
            a2 = 32'b00111111101000000000000000000000;//1.25
            b2 = 32'b01000000011100000000000000000000;//3.75
            exponenti = {a2[30:23], b2[30:23]};
            mantise = {a2[31], a2[22:0], b2[31], b2[22:0]};

            load=1; clear=0;
        #5 load=0; clear=1;

        //seg 4 - operatia 1
        #5 
            op = 1;//operatia 2

            //operanzii pt operatia 4
            a3 = 32'b11000000101110000000000000000000;//-5.75
            b3 = 32'b01000000011000000000000000000000;//3.5
            exponenti = {a3[30:23], b3[30:23]};
            mantise = {a3[31], a3[22:0], b3[31], b3[22:0]};

            load=1; clear=0;
        #5 load=0; clear=1;

        //seg 5 - operatia 1
        #5 load=1; clear=0;
        #5
            op = 1;//operatia 3

            c = {rez_mant[23], rez_exp, rez_mant[22:0]};
            $display("Adunarea a=%h + b=%h = %h", a, b, c);
            load=0; clear=1;

        #5 load=1; clear=0;
        #5
            op = 0;//operatia 4

            c = {rez_mant[23], rez_exp, rez_mant[22:0]};
            $display("Scaderea a1=%h - b1=%h = %h", a1, b1, c);
            load=0; clear=1;

        #5 load=1; clear=0;
        #5
            c = {rez_mant[23], rez_exp, rez_mant[22:0]};
            $display("Scaderea a2=%h - b2=%h = %h", a2, b2, c);
            load=0; clear=1;

        #5 load=1; clear=0;
        #5
            c = {rez_mant[23], rez_exp, rez_mant[22:0]};
            $display("Adunarea a3=%h + b3=%h = %h", a3, b3, c);
            load=0; clear=1;
    end

    always begin
        #5 clk = ~clk;
    end

endmodule
