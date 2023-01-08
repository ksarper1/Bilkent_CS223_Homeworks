`timescale 1ns / 1ps

module top(input logic clk ,reset, output logic [2:0] opCode);
   
    logic [11:0] imMemory;
    logic RF_we ,M_we ,M_re, D_re;
    logic [2:0]r1, r2, rw; 
    logic [3:0]c1;
    logic [2:0] ALU_opcode;
    logic [2:0] pc;
    logic rwSRC;
    
    instructionMemory instM(.pc(pc), .imMemory(imMemory));
        
    controlUnit cU(.clk(clk), .reset(reset),
				.inst(imMemory),
				.nextAddr(pc), 
				.RF_we(RF_we),
				.M_we(M_we),
				.M_re(M_re), 
				.D_re(D_re),
				.ALU_opcode(ALU_opcode),
				.r1(r1),
				.r2(r2),
				.rw(rw),
				.c1(c1), 
				.rwSRC(rwSRC));

	datapath d1(.clk(clk), .reset(reset), 
				.RF_we(RF_we),
				.M_we(M_we),
				.M_re(M_re), 
				.D_re(D_re),
				.ALU_opcode(ALU_opcode),
				.r1(r1),
				.r2(r2),
				.rw(rw),
				.c1(c1),				
				.rwSRC(rwSRC));
				
    
    assign opCode = imMemory[11:9];
    
endmodule
