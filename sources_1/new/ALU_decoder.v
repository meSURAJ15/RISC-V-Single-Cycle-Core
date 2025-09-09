`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2025 18:40:46
// Design Name: 
// Module Name: ALU_decoder
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


module ALU_decoder(
input op5 , funct7_5 ,
input [2:0] funct3,
input [1:0] ALUOp ,
output [2:0] ALUControl
    );
    
    wire [1:0] of5 = {op5 , funct7_5};
    
    parameter add = 2'b00;
    parameter subtract = 2'b01 ;
    parameter look = 2'b10 ;
    parameter NA = 2'b11;
    
    assign ALUControl = (ALUOp == 2'b00) ? 3'b000 :
                        (ALUOp == 2'b01) ? 3'b001 :
                        ((ALUOp == 2'b10)& (funct3 == 3'b000)& ~(of5 == 2'b11)) ? 3'b000 :
                        ((ALUOp == 2'b10)&(funct3 == 3'b000)& (of5 == 2'b11)) ? 3'b001 :
                        ((ALUOp == 2'b10)&(funct3 == 3'b010)) ?   3'b101 :
                        ((ALUOp == 2'b10)&(funct3 == 3'b110)) ?   3'b011 :
                        ((ALUOp == 2'b10)&(funct3 == 3'b111)) ?   3'b011 : 3'b000;
                        
                            
    
endmodule
