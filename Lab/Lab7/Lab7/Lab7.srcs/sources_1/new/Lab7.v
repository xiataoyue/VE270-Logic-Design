`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/30 15:42:48
// Design Name: 
// Module Name: Lab7
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


module Lab7(clock, AN, CA, stop, add_num, equal, flow);
input clock;
input stop;
input [3:0] add_num;
input equal;
output [3:0] AN;
output [6:0] CA;
output flow;

reg stop2 = 0;
reg stop3 = 0;
reg [3:0] AN;
reg [6:0] CA;
reg [6:0] CA1 = 7'b1111111, CA2 = 7'b1111111, CA3 = 7'b1111111, CA4 = 7'b1111111;
reg [30:0] t;
reg clock_1hz = 1'b1, clock_500hz = 1'b1;
reg [3:0] num = 4'b0000;
reg flow = 1'b0;
reg sign;

always @(posedge clock)
begin
    if(t%100000 == 0) clock_500hz <= ~clock_500hz;
    if(t%25000000 == 0) clock_1hz <= ~clock_1hz;
    t = t + 1;
end

reg [30:0] t1 = 0;
always @(posedge clock_500hz)
begin
    case(t1 % 4)
        0: begin
               AN <= 4'b0111;
               CA <= CA4;
           end
        1: begin
               AN <= 4'b1110;
               CA <= CA1;
           end
        2: begin
               AN <= 4'b1101;
               CA <= CA2;
           end
        3: begin
               AN = 4'b1011;
               CA <= CA3;
           end
    endcase
    t1 = t1 + 1;
end

reg[30:0] t2 = 0;
always @(posedge clock_1hz)
begin
    if(stop + stop2 == 0)
    begin
        t2 = t2 + 1;
        CA4 <= CA3;
        CA3 <= CA2;
        CA2 <= CA1;
        
        case(t2)
            1: CA1 <= 7'b0100100;
            2: CA1 <= 7'b1001111;
            3: CA1 <= 7'b0000000;
            4: CA1 <= 7'b0000110;
            5: CA1 <= 7'b0001111;
            6: CA1 <= 7'b0000001;
            7: CA1 <= 7'b0000100;
            8: CA1 <= 7'b1001111;
            9: CA1 <= 7'b0000001;
            10: CA1 <= 7'b0000001;
            11: CA1 <= 7'b0000000;
            12: CA1 <= 7'b0001111;
            16: begin
                    stop2 <= 1;
                    CA1 <= 7'b1111111;
                end
            default: CA1 <= 7'b1111111;
        endcase
    end
    
    else
    begin
        if(stop3 == 0)
        begin
            CA1 <= 7'b1111111;
            CA2 <= 7'b1111111;
            CA3 <= 7'b1111111;
            CA4 <= 7'b1111111;
        end
        stop3 <= 1;       
        
        if(equal == 1)
        begin
            flow <= 0;
            sign <= num[3];
            num <= num + add_num;
            if(sign != num[3]) 
                if(sign == add_num[3]) flow <= 1;
            if(num[3] == 1) CA2 <= 7'b1111110;
            else CA2 <= 7'b1111111;
            
            case(num)
                0: CA1 <= 7'b0000001;
                1: CA1 <= 7'b1001111;
                2: CA1 <= 7'b0010010;
                3: CA1 <= 7'b0000110;
                4: CA1 <= 7'b1001100;
                5: CA1 <= 7'b0100100;
                6: CA1 <= 7'b0100000;
                7: CA1 <= 7'b0001111;
                8: CA1 <= 7'b0000000;
                9: CA1 <= 7'b0001111;
                10: CA1 <= 7'b0100000;
                11: CA1 <= 7'b0100100;
                12: CA1 <= 7'b1001100;
                13: CA1 <= 7'b0000110;
                14: CA1 <= 7'b0010010;
                15: CA1 <= 7'b1001111;
            endcase
        end
    end
end
                
            
endmodule
