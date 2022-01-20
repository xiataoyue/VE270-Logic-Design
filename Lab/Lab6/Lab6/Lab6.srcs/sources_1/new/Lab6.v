`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/17 17:40:37
// Design Name: 
// Module Name: Lab6
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


module lab6(
clock, reset, col, row, reg_code, AN, CA
    );
input clock, reset;
input [3:0] row;
output [3:0] col;
output [3:0] reg_code;
output [3:0] AN;
output [6:0] CA;

wire orrow;
reg [3:0] col;
reg [3:0] state;
reg ld;

reg [3:0] code;
reg [3:0] reg_code;

reg [3:0] AN = 4'b1110;
reg [6:0] CA;

reg [40:0] t = 0;
reg clk = 0;

parameter s0 = 4'b0000;
parameter s1 = 4'b0001;
parameter s2 = 4'b0010;
parameter s3 = 4'b0011;
parameter s4 = 4'b0100;
parameter s5 = 4'b0101;
parameter s6 = 4'b0110;
parameter s7 = 4'b0111;
parameter s8 = 4'b1000;
parameter s9 = 4'b1001;


assign orrow = |row; 


always @(posedge clock)
begin
    if (t%500000 == 1)
    clk = ~clk;
    t = t + 1;
end


always @ (posedge clk or posedge reset)
    if (reset == 1) 
    begin
        ld = 0;
        state = s0; 
        col = 4'b1111; 
        reg_code = 0;
    end
    else
        case (state)
        s0: 
        begin
            col = 4'b1111;
            if (orrow == 1'b0) state <= s0;
            else if (orrow == 1'b1)
            begin
            col <= 4'b0001;      
            state <= s1;
            end
            else state <= s0;
        end
        
        s1: 
        begin
            if (orrow == 0) 
            begin
                state <= s2;
                col <= 4'b0010;
            end
            else if (orrow == 1)
                state <= s5;
            else state <= s0;
        end
        
        s2: 
        begin
            if (orrow == 0) 
            begin
                state <= s3;
                col <= 4'b0100;
            end
            else if (orrow == 1) state <= s6;
            else state <= s0;
        end
        s3: 
        begin
            if (orrow == 0) 
            begin
                state <= s4;
                col <= 4'b1000;
            end
            else if (orrow == 1) 
            state <= s7;
            else state <= s0;
        end
        s4: 
        begin
            if (orrow == 0) state <= s0;
            else if (orrow == 1) state <= s8;
            else state <= s0;
        end
        
        s5: 
        begin
            ld <= 1;
            state = s9;
            case (row)
                4'b0001 : code <= 4'b0000;
                4'b0010 : code <= 4'b0100;
                4'b0100 : code <= 4'b1000;
                4'b1000 : code <= 4'b1100;
            endcase
            reg_code <= code;
            col <= 4'b1111;
        end
        
        s6: 
        begin
            ld <= 1;
            state <= s9;
            case (row)
                4'b0001 : code <= 4'b0001;
                4'b0010 : code <= 4'b0101;
                4'b0100 : code <= 4'b1001;
                4'b1000 : code <= 4'b1101;
            endcase
            reg_code <= code;
            col <= 4'b1111;
        end
        
        s7: 
        begin
            ld <= 1;
            state <= s9;
            case (row)
                4'b0001 : code <= 4'b0010;
                4'b0010 : code <= 4'b0110;
                4'b0100 : code <= 4'b1010;
                4'b1000 : code <= 4'b1110;
            endcase
            reg_code <= code;
            col <= 4'b1111;
        end
        
        s8: 
        begin
            ld <= 1;
            state <= s9;
            case (row)
                4'b0001 : code <= 4'b0011;
                4'b0010 : code <= 4'b0111;
                4'b0100 : code <= 4'b1011;
                4'b1000 : code <= 4'b1111;
            endcase
            reg_code <= code;
            col <= 4'b1111;
        end
        
        s9: 
        begin
            ld <= 0;
            if (orrow == 0) state <= s0;
            else if (orrow == 1) state <= s9;
            else state <= s0;
        end
        
    default: state <= s0;
    endcase

always @ (reg_code)
    case (reg_code)
        0 : CA <= 7'b0000001; 
        1 : CA <= 7'b1001111; 
        2 : CA <= 7'b0010010; 
        3 : CA <= 7'b0000110;
        4 : CA <= 7'b1001100; 
        5 : CA <= 7'b0100100;
        6 : CA <= 7'b0100000;
        7 : CA <= 7'b0001111; 
        8 : CA <= 7'b0000000;
        9 : CA <= 7'b0000100;
        10: CA <= 7'b0001000;
        11: CA <= 7'b1100000;
        12: CA <= 7'b0110001;
        13: CA <= 7'b1000010;
        14: CA <= 7'b0110000;
        15: CA <= 7'b0111000;
       default : CA <= 7'b0000001;
       endcase
endmodule

