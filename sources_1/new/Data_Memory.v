`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2025 22:43:00
// Design Name: 
// Module Name: d_memory
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


module d_memory (clk,WE,A,WD,RD);

input clk, WE ;
input  [31:0] A , WD ;
output [31:0] RD;

reg [31:0] data_mem [1023:0] ;

assign RD = (WE == 1'b0) ? data_mem[A] : 32'h0000_0000;

always @(posedge clk) begin
     if (WE) data_mem[A] <= WD ;
     else data_mem[A] <= 32'h0000_0000;
end



endmodule
