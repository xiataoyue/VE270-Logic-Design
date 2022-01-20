`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/17 17:56:32
// Design Name: 
// Module Name: sim
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


module sim_lab6;
parameter half_period = 10;
reg clock, reset;
reg [3:0] row;
wire [3:0] col;
wire [3:0] reg_code;

wire [3:0] AN;
wire [6:0] CA;

lab6 UUT (clock, reset, col, row, reg_code, AN, CA);
initial begin
#0 clock = 0; reset = 0; row = 4'b0000;
#10 row = 4'b0010;
#5 row = 4'b0000;
#200 reset = 1;
#20 reset = 0;
end

always #half_period clock = ~clock;
initial #2000 $stop;


endmodule

