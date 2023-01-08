`timescale 1ns / 1ps


module two_one_decoder(input logic A0, E, output logic D0 , D1);
    assign D0 = ~A0&E;
    assign D1 = A0&E; 
endmodule
