`timescale 1ns / 1ps

//module trafficLights(input logic SA, SB, clk_in, reset, output logic [2:0] LA, LB   );
    
//logic [3:0]state;


//logic temp0;
//logic temp1;
//logic temp2;
//logic temp3;


//clock_divider c(clk_in, clk_out);

//logic [3:0]out0;
//logic [3:0]out1;
//logic [15:0]out2;
//logic [15:0]out3;
//logic [15:0]out4;
//logic [7:0]out5;
//logic [7:0]out6;
//logic [15:0]out7;
//logic [7:0]out8;
//logic [7:0]out9;
//logic [7:0]out10;
//logic [7:0]out11;
//logic [3:0]out12;
//logic [31:0]out13;
//logic [7:0]out14;
//logic [7:0]out15;
//logic [3:0]out16;
//logic [3:0]out17;
//logic [7:0]out18;
//logic [3:0]out19;
//logic [3:0]out20;
//logic [3:0]out21;

//logic [3:0]nextState;


////for S0'
//two_four_decoder d0({state[1],state[2]},out0);
//two_four_decoder d1({SB,state[3]},out1);
//four_sixteen_decoder d2({SA,state[3],state[1],state[0]},out2);
//four_sixteen_decoder d3({state[2],state[0],SA,SB},out3);
//four_sixteen_decoder d4({state[2],state[1],state[0],SA},out4);


////for S1'
//three_eight_decoder d5({state[0],state[1],state[2]},out5);
//three_eight_decoder d6({state[0],SB,state[3]},out6);
//four_sixteen_decoder d7({SA,state[1],state[0],state[2]},out7);
//three_eight_decoder d8({state[1],state[0],SA},out8);


////for S2'
//three_eight_decoder d9({state[0],state[1],state[2]},out9);
//three_eight_decoder d10({state[0],SB,state[3]},out10);
//three_eight_decoder d11({SA,state[0],state[3]},out11);
//two_four_decoder d12({state[1],state[2]},out12);


////for S3'
//five_thirtytwo_decoder d13({state[0],state[1],state[2],SA,SB},out13);
//three_eight_decoder d14({state[0],SB,state[3]},out14);
//three_eight_decoder d15({SA,SB,state[3]},out15);

////for outputs

//two_four_decoder d16({state[0],state[1]},out16);
//two_four_decoder d17({state[3],state[2]},out17);
//three_eight_decoder d18({state[3],state[1],state[0]},out18);
//two_four_decoder d19({state[3],state[2]},out19);
//two_four_decoder d20({state[3],state[0]},out20);
//two_four_decoder d21({state[2],state[0]},out21);
////temp0 = state[3] && state[2] && !state[1]*!state[0];

////temp1 = !state[1] && state[2] && state[0];

////temp2 = !state[3]*!state[2] && state[3]*!state[1]*!state[0];

////temp3 = !state[3]*!state[2] && !state[3]*state[0] && !state[2]*!state[0];


//always_comb begin


//LA[2] = out16[0]| state[3]| state[2];
//LA[1] = !state[1]| state[2]| state[0];
//LA[0] = 1;

//LB[2] = out17[0]|out18[4];
//LB[1] = out19[0]|out20[1] |out21[0] ;
//LB[0] = 1;

//end

//always_comb begin
//nextState[3] = out13[24]|out14[3]|out15[3];
//nextState[2] = out9[3]|out10[5]|out11[7]|out12[2];
//nextState[1] = out5[3]|out6[5]|out7[6]|out8[6];
//nextState[0] = out0[1]|out1[3]|out2[1]|out3[3]|out4[4];
//end

//always_ff @(posedge clk_out) begin

//    if(reset)begin 
//    state[3] <= 0;
//    state[2] <= 0;
//    state[1] <= 0;
//    state[0] <= 0;
//    end
//    else state <= nextState;
//end

//endmodule
module trafficLights(input logic SA, SB, clk_in, reset, output logic [2:0] LA, LB );
typedef enum logic [3:0]{S0,S1,S2,S3,S4,S5,S6,S7,S8,S9,ni1,ni2,ni3,ni4,ni5} statetype;

parameter red = 3'b111;
parameter green = 3'b011;
parameter yellow = 3'b001;

reg[28:0] counter = 0;
reg clk1;



always @(posedge clk_in)
begin

    if(counter == 150000000)
       begin
       counter <= 0;
       clk1 = ~clk1;
        end
        else
        counter <= counter +1;
     end
statetype state,nextstate;

always_ff @(posedge clk1, posedge reset)
if(reset)state <= S0;
else state <= nextstate;

always_comb
case(state)
S0: if(SA) nextstate = S1;
    else if(~SA&~SB) nextstate = S0;
    else if(~SA&SB) nextstate = S8;
S1: if(SA) nextstate = S2;
else nextstate = S0;
S2: if(SA&SB) nextstate = S3;
    else if(SA&~SB) nextstate = S2;
    else if(~SA) nextstate = S1;
S3: nextstate = S4;
S4: nextstate = S5;
S5: nextstate = S6;
S6: nextstate = S7;
S7: nextstate = S0;
S8: if(SB) nextstate = S9;
else nextstate = S0;
S9: if(~SA&SB) nextstate = S7;
else nextstate = S0;
ni1:nextstate = S0;
ni2:nextstate = S0;
ni3:nextstate = S0;
ni4:nextstate = S0;
ni5:nextstate = S0;
endcase
always_comb
    case(state)
        S0:{LA,LB} = {red,red};
        S1:{LA,LB} = {yellow,red};
        S2:{LA,LB} = {green,red};
        S3:{LA,LB} = {yellow,red};
        S4:{LA,LB} = {red,red};
        S5:{LA,LB} = {red,yellow};
        S6:{LA,LB} = {red,green};
        S7:{LA,LB} = {red,yellow};
        S8:{LA,LB} = {red,yellow};
        S9:{LA,LB} = {red,green};
        
        ni1:{LA,LB} = {red,green};
        ni2:{LA,LB} = {red,green};
        ni3:{LA,LB} = {red,green};
        ni4:{LA,LB} = {red,green};
        ni5:{LA,LB} = {red,green};
        endcase
endmodule
//module trafficLights(input logic clk,input logic reset,input logic SA, SB,output logic [2:0] la,lb);
//typedef enum logic [2:0]{S0,S1,S2,S3,S4,S5,S6,S7} statetype;

//parameter red = 3'b111;
//parameter green = 3'b011;
//parameter yellow = 3'b001;

//reg[28:0] counter = 0;
//reg clk1;



//always @(posedge clk)
//begin
//  // counter <= counter +1;
//    if(counter == 150000000)
//       begin
//       counter <= 0;
//       clk1 = ~clk1;
//        end
//        else
//        counter <= counter +1;
//     end
//statetype state,nextstate;

//always_ff @(posedge clk1, posedge reset)
//if(reset)state <= S0;
//else state <= nextstate;

//always_comb
//case(state)
//S0: if(~SB) nextstate = S0; 
//else nextstate = S1;
//S1: nextstate = S2;
//S2: nextstate = S3;
//S3: nextstate = S4; 
//S4:if(~SA & SB) nextstate = S4;
//    else  nextstate = S5;
//S5: nextstate = S6; 
//S6: nextstate = S7; 
//S7: nextstate = S0;
//endcase

//always_comb
//    case(state)
//        S0:{la,lb} = {green,red};
//        S1:{la,lb} = {yellow,red};
//        S2:{la,lb} = {red,red};
//        S3:{la,lb} = {red,yellow};
//        S4:{la,lb} = {red,green};
//        S5:{la,lb} = {red,yellow};
//        S6:{la,lb} = {red,red};
//        S7:{la,lb} = {yellow,red};
//        endcase
//endmodule