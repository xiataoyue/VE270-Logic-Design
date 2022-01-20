`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/17 16:01:09
// Design Name: 
// Module Name: Counter
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


module Counter(clk, reset, updown, Q, SSD, AN);
    parameter N = 4;
    input clk, reset, updown;
    output [N-1:0] Q;
    output [6:0] SSD;
    output [N-1:0] AN;
    reg [N-1:0] Q;
    reg [6:0] SSD;
    assign AN = 4'b1110;
    
    always @(posedge clk or posedge reset)
        if(reset == 1'b1) Q = 0;
        else if(updown == 1'b1) Q = Q + 1;
        else if(updown == 1'b0) Q = Q - 1;
        else Q = Q;
    
    always @(Q)
        case (Q)
            4'b0000: SSD = 7'b0000001;
            4'b0001: SSD = 7'b1001111;
            4'b0010: SSD = 7'b0010010;
            4'b0011: SSD = 7'b0000110;
            4'b0100: SSD = 7'b1001100;
            4'b0101: SSD = 7'b0100100;
            4'b0110: SSD = 7'b0100000;
            4'b0111: SSD = 7'b0001111;
            4'b1000: SSD = 7'b0000000;
            4'b1001: SSD = 7'b0000100;
            4'b1010: SSD = 7'b0001000;
            4'b1011: SSD = 7'b1100000;
            4'b1100: SSD = 7'b0110001;
            4'b1101: SSD = 7'b1000010;
            4'b1110: SSD = 7'b0110000;
            4'b1111: SSD = 7'b0111000;
        endcase
    
endmodule
