`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2025 21:44:22
// Design Name: 
// Module Name: Instruction_memory
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


module Instruction_memory(
 input [31:0] A , //address
 input rst,
 output [31:0] RD 
    );
    
   reg [31:0] Mem [1023:0] ;
   
   assign RD = (rst == 1'b0) ? 32'h00000000 : Mem[A[31:2]];
   
   
   
   
endmodule
