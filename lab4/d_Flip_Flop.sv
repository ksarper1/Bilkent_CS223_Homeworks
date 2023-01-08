`timescale 1ns / 1ps


module d_Flip_Flop(input D,clk,reset,shr,output reg Q );
    
    always @(posedge clk) 
    begin
    if(shr)begin
    if(reset==1'b1)
        Q <= 1'b0; 
    else 
        Q <= D; 
end 
end
endmodule
