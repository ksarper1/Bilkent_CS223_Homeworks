`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2022 00:16:38
// Design Name: 
// Module Name: halfSubtractorBeh
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


module halfSubtractorBeh(input logic a,b, output logic diff, borrow

    );
    
    assign diff = ~a&b | a&~b;
    assign borrow = ~a&b; 
endmodule
