`timescale 1ns / 1ps

module fullAdder(input logic a,b,cin, output logic s, cout );
    logic n1,n2,n3;
    halfAdder o1 (a,b,n1,n2);
    halfAdder o2 (n2,cin,n3,s);
    or o3 (cout,n3,n1);
    
endmodule