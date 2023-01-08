`timescale 1ns / 1ps


module serial_Adder(input [7:0] A , B,input clk , resetf, shrf, loadf, output reg [7:0] sum);
     
reg [7:0]temp1;
reg [7:0]temp2;
reg [7:0]s;
reg temp4;
wire temp3;
logic [7:0] temp5;
assign temp5 = 0;
reg reset, shr, load;
reg c;

debouncer d1 (resetf,clk,reset);
debouncer d2 (loadf,clk,load);
debouncer d3 (shrf,clk,shr);

shift_Register o0(clk, reset, shr, load, 0, A, temp1);
shift_Register o1(clk, reset, shr, load, 0, B, temp2); 

fullAdder fa(temp1[0],temp2[0],temp4,temp3,s[0]);
two_One_Mux m1(temp4,s[0],(reset| load | shr ),c );
d_Flip_Flop o2(c,clk,reset,shr,temp4);


shift_Register o3(clk, reset, shr, load, s[0] ,temp5, sum);

endmodule
