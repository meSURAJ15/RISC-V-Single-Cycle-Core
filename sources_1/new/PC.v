`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2025 21:51:47
// Design Name: 
// Module Name: PC
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


module PC( PC , PC_Next ,rst, clk);

input rst,clk ;
input  [31:0] PC_Next ;
output reg [31:0] PC ;

   
   always @(posedge clk) begin
    if (rst == 1'b0 ) PC <= 32'h00000000;
    else PC <= PC_Next ;
   end
   
   
endmodule
