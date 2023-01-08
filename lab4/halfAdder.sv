`timescale 1ns / 1ps

module halfAdder(input logic a,b, output logic c,s

    );
    assign c= a&b;
    assign s= ~a&b|a&~b;
endmodule