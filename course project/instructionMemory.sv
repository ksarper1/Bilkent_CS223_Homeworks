`timescale 1ns / 1ps

module instructionMemory(input logic [2:0] pc ,output logic [11:0] imMemory);
    
    logic [11:0] memory[0:7];
    initial begin
        memory[0] = 12'b000000000000;
        memory[1] = 12'b001000100010;
        memory[2] = 12'b011111010001;
        memory[3] = 12'b010101010001;
        memory[4] = 12'b000100000011;
        memory[5] = 12'b000000000000;
        memory[6] = 12'b010000000010;
        memory[7] = 12'b000100000000;
    end

     
  
    assign imMemory = memory[pc];
    
       
 
endmodule