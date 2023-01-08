`timescale 1ns / 1ps

module registerFile(
    input logic [2:0] RF_wad,RF_ad1, RF_ad2, // source register address 1 and 2
    input logic RF_we,        // write enable
    input logic clk,
    input logic reset,
    input logic [3:0] RF_wd,  // write data
    output logic [3:0] RF_d1, 
	output logic [3:0] RF_d2 // read data from source register 1 and 2
    );
    
    reg [3:0] memory[0:7]; // 8x4-bit register file
    initial begin
    memory[0] = 4'b0000;
    memory[1] = 4'b0001;
    memory[2] = 4'b0010;
    memory[3] = 4'b0011;
    memory[4] = 4'b0100;
    memory[5] = 4'b0000;
    memory[6] = 4'b0000;
    memory[7] = 4'b0000;
    end
    
    always_ff @(posedge reset) begin
            memory[0] = 4'b0000;
            memory[1] = 4'b0001;
            memory[2] = 4'b0010;
            memory[3] = 4'b0011;
            memory[4] = 4'b0000;
            memory[5] = 4'b0000;
            memory[6] = 4'b0000;
            memory[7] = 4'b0000;
    end
    

always_ff @(posedge clk) begin
	// read from source registers
	RF_d1 <= memory[RF_ad1];
    RF_d2 <= memory[RF_ad2];
	// write to destination register
    if(RF_we)begin
        memory[RF_wad] <= RF_wd;
    end
end
    
endmodule
