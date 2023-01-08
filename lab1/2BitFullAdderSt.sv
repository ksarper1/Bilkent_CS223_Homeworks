`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2022 00:26:50
// Design Name: 
// Module Name: 2BitFullAdderSt
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


module TwoBitFullAdderSt(input logic a0,b0,a1,b1,cin, output logic s0,s1,cout

    );
    logic n1;
    fullAdderSt o1(a0,b0,cin,s0,n1);
    fullAdderSt o2(a1,b1,n1,s1,cout);
endmodule
