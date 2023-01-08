`timescale 1ns / 1ps


module four_one_mux(input logic D0,D1,D2,D3,S0,S1, output logic Y

    );
    logic n1,n2;
    two_one_mux o1(D0,D1,S0,n1);
    two_one_mux o2(D2,D3,S0,n2);
    two_one_mux o3(n1,n2,S1,Y);
endmodule
