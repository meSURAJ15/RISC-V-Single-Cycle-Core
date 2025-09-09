`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2025 20:08:42
// Design Name: 
// Module Name: Control_Unit
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


module Control_Unit(

input Zero,
input [6:0] op,funct7,
input [2:0] funct3,

output PCSrc, ResultSrc, MemWrite, ALUSrc,RegWrite, 
output [1:0] ImmSrc,
output [2:0] ALUControl

    );
    
    wire [1:0] ALUOp;
    
    Main_Decoder Main_Decoder (
        .Zero(Zero),
        .op(op),
        .PCSrc(PCSrc), 
        .ResultSrc(ResultSrc), 
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite),
        .ImmSrc(ImmSrc),
        .ALUOp(ALUOp)
        
    
    );
    
    
    
    ALU_decoder Alu_decoder (
        .op5(op[5]) , 
        .funct7_5(funct7[5]) ,
        .funct3(funct3),
        .ALUOp(ALUOp) ,
        .ALUControl(ALUControl)
    );
    
    
endmodule
