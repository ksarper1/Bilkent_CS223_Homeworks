`timescale 1ns / 1ps

module dataMemory(
		input logic clk,
		input logic [3:0] M_add, //memory address
		input logic M_we, //memory write enable
		input logic M_re, //memory read enable
		input logic [3:0] M_wd, //memory write data
		input logic reset,
		output logic [3:0] M_rd //memory read data
);
  reg [3:0] mem [15:0];//4 x 16

     initial begin
        mem[0] <= 4'b0000;
        mem[1] <= 4'b0001;
        mem[2] <= 4'b0000;
        mem[3] <= 4'b0111;
        mem[4] <= 4'b0100;
        mem[5] <= 4'b0101;
        mem[6] <= 4'b0110;
        mem[7] <= 4'b0111;
        mem[8] <= 4'b1000;
        mem[9] <= 4'b1001;
        mem[10] <= 4'b1010;
        mem[11] <= 4'b1011;
        mem[12] <= 4'b1100;
        mem[13] <= 4'b1101;
        mem[14] <= 4'b1110;
        mem[15] <= 4'b1111;
    end

always_ff @(posedge reset) begin
	mem[0] <= 4'b0000;
        mem[1] <= 4'b0001;
        mem[2] <= 4'b0010;
        mem[3] <= 4'b0011;
        mem[4] <= 4'b0100;
        mem[5] <= 4'b0101;
        mem[6] <= 4'b0110;
        mem[7] <= 4'b0111;
        mem[8] <= 4'b1000;
        mem[9] <= 4'b1001;
        mem[10] <= 4'b1010;
        mem[11] <= 4'b1011;
        mem[12] <= 4'b1100;
        mem[13] <= 4'b1101;
        mem[14] <= 4'b1110;
        mem[15] <= 4'b1111;
end

always_ff @(posedge clk) begin
    if (M_we) begin
        mem[M_add] <= M_wd;
    end
    if (M_re) begin
        M_rd <= mem[M_add];
    end
end	


  
endmodule
