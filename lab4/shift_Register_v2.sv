`timescale 1ns / 1ps


module shift_Register_v2(input clk, reset, shr, load, shr_in, [7:0] Din, output reg [7:0]Dout);
wire w0,w1,w2,w3,w4,w5,w6,w7, a0,a1,a2,a3,a4,a5,a6,a7;
four_One_Mux o0(w7,shr_in,Din[7],Din[7],shr,load,a7);
four_One_Mux o1(w6,w7,Din[6],Din[6],shr,load,a6);
four_One_Mux o2(w5,w6,Din[5],Din[5],shr,load,a5);
four_One_Mux o3(w4,w5,Din[4],Din[4],shr,load,a4);
four_One_Mux o4(w3,w4,Din[3],Din[3],shr,load,a3);
four_One_Mux o5(w2,w3,Din[2],Din[2],shr,load,a2);
four_One_Mux o6(w1,w2,Din[1],Din[1],shr,load,a1);
four_One_Mux o7(w0,w1,Din[0],Din[0],shr,load,a0);


d_Flip_Flop ff1(a7,clk,reset,w7);
d_Flip_Flop ff2(a6,clk,reset,w6);
d_Flip_Flop ff3(a5,clk,reset,w5);
d_Flip_Flop ff4(a4,clk,reset,w4);
d_Flip_Flop ff5(a3,clk,reset,w3);
d_Flip_Flop ff6(a2,clk,reset,w2);
d_Flip_Flop ff7(a1,clk,reset,w1);
d_Flip_Flop ff0(a0,clk,reset,w0);

always@(*)
begin
Dout[7]=w7;
Dout[6]=w6;
Dout[5]=w5;
Dout[4]=w4;
Dout[3]=w3;
Dout[2]=w2;
Dout[1]=w1;
Dout[0]=w0;
end

endmodule
