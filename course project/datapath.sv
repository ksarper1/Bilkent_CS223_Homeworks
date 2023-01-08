`timescale 1ns / 1ps

module datapath(
                input logic clk, reset, 
				input logic RF_we ,M_we ,M_re, D_re,
				input logic[2:0] ALU_opcode,
				input logic [2:0] r1,
				input logic [2:0] r2,
				input logic [2:0] rw,
				input logic [3:0] c1,				
				input logic rwSRC);
				
				
logic [3:0] RF_wd;
logic [3:0] memOut;
logic [3:0] v1;
logic [3:0] v2;
logic [3:0] ALUOut;

dataMemory dm1(
	.clk(clk),
	.M_add(c1), 
	.M_we(M_we), 
	.M_re(M_re), 
	.M_wd(v1), 
	.reset(reset),
	.M_rd(memOut)
	);

aLU aLU1(.ALUopcode(ALU_opcode), 
	.v1(v1), 
	.v2(v2),
	.out(ALUOut)
	);

registerFile reg1(
	.RF_wad(rw),
	.RF_ad1(r1), 
	.RF_ad2(r2),
	.RF_we(RF_we),       
	.clk(clk),
	.reset(reset),
	.RF_wd(RF_wd),  
	.RF_d1(v1), 
	.RF_d2(v2)
	);
    
    
	assign RF_wd = (rwSRC) ? memOut:ALUOut;
    
endmodule