`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/30 13:09:06
// Design Name: 
// Module Name: lab5_sim
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


module lab5_sim;

reg reset, set, clock;
wire clock_1hz;
wire [3:0] AN;
wire [6:0] CA;
lab5 UUT (reset, set, clock,clock_1hz, AN, CA);
initial begin
#0 clock = 0;reset = 0;
end

always #20 clock = ~clock;

endmodule
