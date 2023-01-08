`timescale 1ns / 1ps

module two_One_Mux(input logic D0,D1,S, output logic Y);
    
    assign Y = (S)?D1:D0;
endmodule
