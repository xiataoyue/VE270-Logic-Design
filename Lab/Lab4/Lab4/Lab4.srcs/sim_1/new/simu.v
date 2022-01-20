`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/17 16:30:25
// Design Name: 
// Module Name: simu
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


module simu;
    parameter half_period = 50;
    parameter counter_size = 4;
    wire [counter_size-1:0] Q;
    wire [6:0] SSD;
    wire [3:0] AN;
    reg clock, reset, updown;
    assign AN = 4'b1110;
    Counter #(counter_size) UUT (clock,reset,updown, Q, SSD, AN);
    initial begin
        #0 clock = 0; updown = 1; reset = 1;
        #100 reset =0;
        #300 reset = 1;
        #100 reset = 0;
        #300 updown = 0;
        #300 updown = 1;
        #300 reset = 1;
    end
    always #half_period clock = ~clock;
    initial #2000 $stop;
endmodule
