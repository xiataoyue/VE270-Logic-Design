`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/17 16:01:09
// Design Name: 
// Module Name: SSD
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


module SSD(Q, CA);
    input [3:0] Q;
    output reg [6:0] CA;
    
    always @(Q)
    case(Q)
        4'h0: CA = 7'b0000001;
        4'h1: CA = 7'b1001111;
        4'h2: CA = 7'b0010010;
        4'h3: CA = 7'b0000110;
        4'h4: CA = 7'b1001100;
        4'h5: CA = 7'b0100100;
        4'h6: CA = 7'b0100000;
        4'h7: CA = 7'b0001111;
        4'h8: CA = 7'b0000000;
        4'h9: CA = 7'b0000100;
        4'ha: CA = 7'b0001000;
        4'hb: CA = 7'b1100000;
        4'hc: CA = 7'b0110001;
        4'hd: CA = 7'b1000010;
        4'he: CA = 7'b0110000;
        4'hf: CA = 7'b0111000;
        default CA = 7'b0000001;
    endcase
        
endmodule
