`timescale 1ns / 1ps



module two_four_decoder(input [1:0] in, output reg [3:0] ou

    );
    always_comb
    case(in)
        0: ou = 4'b0001;
        1: ou = 4'b0010;
        2: ou = 4'b0100;
        3: ou = 4'b1000;
        endcase
endmodule
