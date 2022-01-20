`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/30 17:02:20
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


module sim;

reg clock;
reg stop;
reg [3:0] add_num;
reg equal;
wire [3:0] AN;
wire [6:0] CA;
wire flow;

Lab7 #(1, 15) UUT (
clock, AN, CA, stop, add_num, equal, flow 
);
initial begin
#0 clock = 0; stop = 0;
#300 stop = 1; add_num = 4'b0100;
#350 equal = 1;
#40 equal = 0;add_num = 4'b0011;
#80 equal = 1;
#40 equal = 0;
#80 equal = 1;
#40 equal = 0;
#80 equal = 1;
#40 equal = 0;

end

always #20 clock = ~clock;

endmodule
