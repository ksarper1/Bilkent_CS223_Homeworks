`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2022 23:37:26
// Design Name: 
// Module Name: labCalculatorSt
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module labCalculatorSt(input logic a,b,c,d, output logic y,z
    );
        
      logic [1:0] group;
      
      assign group[1] = c;
      assign group[0] = d;
      logic o;
      xor x(o,a,b);
      logic o2;
      nand nan(o2, a,b);
      logic o3, o4;
      halfAdderBeh h(a,b,o4, o3);
      logic o5, o6;
      halfSubtractorBeh hs(a,b,o5,o6); 
      always_comb begin
          casex(group)
              2'b00 : begin y = o; z = 0; end
              2'b01 : begin y = o2;  z = 0; end
              2'b10 : begin
              y = o3;
              z = o4;
              end
              2'b11 : begin
              y = o5;
              z = o6;
              end
              default: begin
                  y = o5;
                  z = o6;
              end
          endcase
      end
                
        
      endmodule
      
    

