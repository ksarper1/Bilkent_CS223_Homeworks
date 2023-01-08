`timescale 1ns / 1ps

module shift_Register(input clk, reset, shr, load, shr_in,[7:0] Din, output reg [7:0]Dout);

always @(posedge clk) begin
if (reset) Dout <= 0;
else if (load) Dout <= Din;
else if (shr) begin 
Dout[7] <= shr_in;
Dout[6] <= Dout[7];
Dout[5] <= Dout[6];
Dout[4] <= Dout[5];
Dout[3] <= Dout[4];
Dout[2] <= Dout[3];
Dout[1] <= Dout[2];
Dout[0] <= Dout[1];
end
end
endmodule