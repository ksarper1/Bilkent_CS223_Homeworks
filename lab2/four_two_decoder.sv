`timescale 1ns / 1ps

module four_two_decoder(input logic A0,A1,E, output logic D0,D1,D2,D3 

    );
    logic n0,n1;
    two_one_decoder o1(A0,E,n0,n1);
    two_one_decoder o2(A1,n0,D0,D1);
    two_one_decoder o3(A1,n1,D2,D3);
endmodule
