`timescale 1ns / 1ps

module three_eight_decoder(input [2:0] in, output reg [7:0] ou);
always_comb
    case(in)
        0: ou = 8'b00000001;
        1: ou = 8'b00000010;
        2: ou = 8'b00000100;
        3: ou = 8'b00001000;
        4: ou = 8'b00010000;
        5: ou = 8'b00100000;
        6: ou = 8'b01000000;
        7: ou = 8'b10000000;
    endcase
endmodule
