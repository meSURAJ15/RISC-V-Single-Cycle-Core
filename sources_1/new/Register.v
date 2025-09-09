`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2025 22:04:11
// Design Name: 
// Module Name: Register
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

module Register (clk, rst, A1, A2, A3 , RD1 , RD2, WE3, WD3);
 
input [4:0] A1, A2, A3 ;
input clk , rst,WE3;
input [31:0] WD3;
output  [31 :0]  RD1, RD2 ;


//memory creation
reg [31:0] mem [31:0];

//read functionality

assign RD1 = (rst) ? mem[A1]: 32'h0000_0000; 
assign RD2 = (rst) ? mem[A2]: 32'h0000_0000;


always @(posedge clk) begin
    if (WE3)  mem [A3] <= WD3;
    else mem [A3] <= 32'h0000_0000;

end
endmodule
