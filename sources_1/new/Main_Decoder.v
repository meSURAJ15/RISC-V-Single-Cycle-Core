`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2025 18:41:31
// Design Name: 
// Module Name: Main_Decoder
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


module Main_Decoder(
input Zero,
input [6:0] op,
output PCSrc, ResultSrc, MemWrite, ALUSrc,RegWrite,
output [1:0] ImmSrc,ALUOp
    );
    
    parameter lw = 7'b0000011 ; 
    parameter sw = 7'b0100011 ;
    parameter R_type = 7'b0110011 ;
    parameter beq = 7'b1100011 ;
    
    wire Branch ;
    
    assign RegWrite = ((op == lw)|(op == R_type)) ? 1'b1 : 1'b0;
    
    assign MemWrite = (op == sw) ? 1'b1: 1'b0;
    
    assign ALUSrc = ((op == lw)|(op == sw)) ? 1'b1 : 1'b0;
    
    assign ResultSrc = (op == lw)? 1'b1 : 1'b0;
    
    assign ImmSrc = (op == sw ) ? 2'b01 : (op == beq ) ? 2'b10 : 2'b00 ;
    
    assign Branch = (op == beq) ? 1'b1 : 1'b0;
    
    assign ALUOp = (op == R_type) ? 2'b10 : (op == beq) ? 2'b01 : 2'b00;
    
    assign PCSrc = Zero & Branch;
    
    
    
endmodule
