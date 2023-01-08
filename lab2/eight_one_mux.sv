`timescale 1ns / 1ps

module eight_one_mux(input logic D0,D1,D2,D3,D4,D5,D6,D7,S0,S1,S2, output logic Y

    );
    logic n1,n2,n3,n4,n5;
    
    four_one_mux o1(D0,D1,D2,D3,S0,S1,n1);
    four_one_mux o2(D4,D5,D6,D7,S0,S1,n2);
//    assign n5 = ~S2;
    not o6(n5,S2);
    and o3(n3,n5,n1);
    and o4(n4,n2,S2);
    or o5(Y,n3,n4);
endmodule
