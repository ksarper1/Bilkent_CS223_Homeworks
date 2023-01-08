`timescale 1ns / 1ps

module controller(input logic clk ,reset ,input logic [2:0] opCode, 
				output logic RF_we ,M_we ,M_re, D_re,
				output logic [2:0] ALU_opcode,
				output logic inSRC,
				output logic rwSRC,
				output logic PCEn,
				output logic IREn);

	parameter FETCH = 3'b000;
	parameter DECODE = 3'b001;
	parameter memR = 3'b010;	//L1
	parameter memW = 3'b011;	//L1
	parameter WB = 3'b100;		//L2
	parameter arit = 3'b101;	//L1\
	
	logic [2:0] state;
	logic [2:0] nextstate;


initial begin
    inSRC = 1'b0;
	rwSRC = 1'b0;
    RF_we = 0;
    M_we = 0;
    M_re = 0;
    ALU_opcode = 3'b000;
    D_re = 0;
end


always@(posedge clk)
    if (reset)
		state <= FETCH;
    else
		state <= nextstate;


always@(state or opCode) begin
	case (state)
	FETCH:  begin
		PCEn = 1'b1;
		IREn = 1'b1;
		RF_we = 1'b0;
		M_we = 1'b0;
		M_re = 1'b0;
		rwSRC = 1'b0;
		inSRC = 1'b0;
		ALU_opcode = 3'b000;
		D_re = 1'b0;
		nextstate = DECODE;
		end
	DECODE:  begin
		PCEn = 1'b0;
		IREn = 1'b0;
		RF_we = 1'b0;
		M_we = 1'b0;
		ALU_opcode = 3'b000;
		case(opCode)
			   //Decode muxes and next stage
			   3'b000:	begin
						rwSRC = 1'b1;
						nextstate = memR;	//load
						end
			   3'b001:	begin
						inSRC = 1'b0;
						nextstate = memW;	//store
						end
			   3'b011:	begin
						inSRC = 1'b1;
						rwSRC = 1'b0;
						nextstate = arit;	//add
						end
			   3'b010:	begin
						inSRC = 1'b1;
						rwSRC = 1'b0;
						nextstate = arit;	//add
						end
				3'b110: begin
				        D_re = 1'b1;
				        nextstate = arit;
				        end
			   default: nextstate = FETCH;
			 endcase
		end
		
	arit: begin
		PCEn = 1'b0;
		IREn = 1'b0;
		RF_we = 1'b1;
		M_we = 1'b0;
		M_re = 1'b0;
		rwSRC = 1'b0;
		case(opCode)
			3'b011:	ALU_opcode = 3'b010;	//add
			3'b010:	ALU_opcode = 3'b001;	//sub
			default: ALU_opcode = 3'b000;
			endcase
		    nextstate = FETCH;
	end
	
	memW: begin
		PCEn = 1'b0;
		IREn = 1'b0;
		RF_we = 1'b0;
		M_we = 1'b1;
		M_re = 1'b0;
		nextstate = FETCH;
	end
	
	memR:  begin
		PCEn = 1'b0;
		IREn = 1'b0;
		RF_we = 1'b0;
		M_we = 1'b0;
		M_re = 1'b1;
		nextstate = WB;
	end
	
	WB: begin
		PCEn = 1'b0;
		IREn = 1'b0;
		RF_we = 1'b1;
		M_we = 1'b0;
		M_re = 1'b0;
		nextstate = FETCH;
		end
		
	default: nextstate = FETCH;
	
endcase
end


endmodule