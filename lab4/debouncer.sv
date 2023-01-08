`timescale 1ns / 1ps


module debouncer(input in, clk, output reg out );
reg init = 1;
always @(*)
out = in & init;
always @(posedge clk)
init = ~in;
endmodule
