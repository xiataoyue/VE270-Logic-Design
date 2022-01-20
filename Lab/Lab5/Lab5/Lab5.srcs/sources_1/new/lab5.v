`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/30 12:27:01
// Design Name: 
// Module Name: lab5
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


module lab5(clock, reset, set, clock_1hz, AN, CA);
    parameter N = 4;
    input reset, set, clock;
    output clock_1hz;
    output [N-1:0] AN;
    output [6:0] CA;
    reg clock_500hz, clock_1hz;
    reg [30:0] Q;
    reg [6:0] CA;
    reg [6:0] CA_unit;
    reg [6:0] CA_ten;
    reg [N-1:0] AN = 4'b1110;
    reg [30:0] t = 0;
    
    always @(posedge clock)
    begin
        if(t%100000 == 0) clock_500hz = ~clock_500hz;
        if(t%50000000 == 0) clock_1hz = ~clock_1hz;
        t = t + 1;
    end
    
    always @(posedge clock_1hz or posedge reset or posedge set)
    begin
        if(reset == 1) Q <= 0;
        else if(set == 1) Q <= 50;
        else if(Q == 59) Q <= 0;
        else Q = Q + 1;
    end
    
    always @(Q)
    begin
        case(Q%10)
            0: CA_unit = 7'b0000001;
            1: CA_unit = 7'b1001111;
            2: CA_unit = 7'b0010010;
            3: CA_unit = 7'b0000110;
            4: CA_unit = 7'b1001100;
            5: CA_unit = 7'b0100100;
            6: CA_unit = 7'b0100000;
            7: CA_unit = 7'b0001111;
            8: CA_unit = 7'b0000000;
            9: CA_unit = 7'b0000100;
        endcase
        
        case(Q/10)
            0: CA_ten = 7'b0000001;
            1: CA_ten = 7'b1001111;
            2: CA_ten = 7'b0010010;
            3: CA_ten = 7'b0000110;
            4: CA_ten = 7'b1001100;
            5: CA_ten = 7'b0100100;
        endcase
    end
    
    always @(posedge clock_500hz)
    begin
        AN[0] = ~AN[0];
        AN[1] = ~AN[1];
        if(AN == 4'b1110) CA <= CA_unit;
        else if(AN == 4'b1101) CA <= CA_ten;
        else CA = 7'b0000001;
    end
            
endmodule
