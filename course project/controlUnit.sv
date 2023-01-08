`timescale 1ns / 1ps

module controlUnit(input logic clk, reset, 
				input logic [11:0] inst, 
				output logic [2:0]nextAddr, 
				output logic RF_we ,M_we ,M_re, D_re,
				output logic[2:0] ALU_opcode,
				output logic [2:0] r1,
				output logic [2:0] r2,
				output logic [2:0] rw,
				output logic [3:0] c1,
				output logic rwSRC);


logic inSRC;
logic PCEn;
logic IREn;
logic [11:0] IR;

initial begin
    nextAddr = 0;
end

 controller cont(.clk(clk),.reset(reset),.opCode(IR[11:9]), 
				 .RF_we(RF_we), 
				 .M_we(M_we), 
				 .M_re(M_re), 
				 .D_re(D_re), 
				 .ALU_opcode(ALU_opcode), 
				 .inSRC(inSRC), 
				 .rwSRC(rwSRC),
				 .PCEn(PCEn),
				 .IREn(IREn));
 //RF Input muxes
     assign r1 = (inSRC) ? IR[2:0]:IR[6:4];
     assign r2 = (inSRC) ? IR[5:3]:IR[6:4];
     assign rw = (rwSRC) ? IR[6:4]:IR[8:6];
     assign c1 = IR[3:0];
 
 
 //Bozuk
always @(posedge clk)begin //PC
	if(reset)
		nextAddr <= 3'b000;
	else begin
		nextAddr <= (PCEn) ? (nextAddr + 1):nextAddr;
		IR <= (IREn) ? inst:IR;
	end
end
   
    
    
    
endmodule
