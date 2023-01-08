`timescale 1ns / 1ps

module aLU(input logic [2:0] ALUopcode, 
input logic [3:0] v1, v2, //values at the adresses
output logic [3:0] out );
   logic [3:0] out1;
   
   always_comb begin 
    case(ALUopcode)
       default: begin               
            out1 = 4'b0000;
       end
      
       3'b001: begin //sub
           out1 = v2 - v1;
       end
       
       3'b010: begin//add
            out1 = v1 + v2;
       end
       
       3'b011: begin//ascend
       
       end
       
       3'b100: begin//descend
       
       end
          
    endcase
    
    end
    
    assign out = out1;
endmodule
