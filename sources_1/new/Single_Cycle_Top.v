`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.09.2025 22:54:15
// Design Name: 
// Module Name: Single_Cycle_Top
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
module Single_Cycle_Top (
    input clk,
    input rst,
    output [31:0] ALU_out,     // Expose something to prevent trimming
    output [31:0] PC_out
);

wire [31:0] PC_Top, RD_ins, SrcA, SrcB, ALUResult;
wire [31:0] Read_data, PCPlus4, RD2_Top, Result, Imm_Ext_Top;
wire RegWrite, MemWrite, ALUSrc, ResultSrc, Zero;
wire [1:0] ImmSrc;
wire [2:0] ALUControl_Top;

PC programcounter (
    .clk(clk),
    .rst(rst),
    .PC(PC_Top),
    .PC_Next(PCPlus4)
);

Instruction_memory IM (
    .rst(rst),
    .A(PC_Top),
    .RD(RD_ins)
);

PC_Adder PC_Adder (
    .a(PC_Top),
    .b(32'd4),
    .c(PCPlus4)
);

Register R (
    .clk(clk),
    .rst(rst),
    .A1(RD_ins[19:15]),
    .A2(RD_ins[24:20]),
    .A3(RD_ins[11:7]),
    .RD1(SrcA),
    .RD2(RD2_Top),
    .WE3(RegWrite),
    .WD3(Result)
);

Sign_Extend SE (
    .In(RD_ins),
    .ImmSrc(ImmSrc),
    .Imm_Ext(Imm_Ext_Top)
);

Mux Mux_Register_to_ALU (
    .a(RD2_Top),
    .b(Imm_Ext_Top),
    .s(ALUSrc),
    .c(SrcB)
);

ALU alu (
    .A(SrcA),
    .B(SrcB),
    .ALUControl(ALUControl_Top),
    .Zero(Zero),
    .Result(ALUResult)
);

d_memory DM (
    .clk(clk),
    .WE(MemWrite),
    .A(ALUResult),
    .WD(RD2_Top),
    .RD(Read_data)
);

Control_Unit CU_Top (
    .Zero(Zero),
    .op(RD_ins[6:0]),
    .funct7(RD_ins[31:25]),
    .funct3(RD_ins[14:12]),
    .MemWrite(MemWrite),
    .RegWrite(RegWrite),
    .ResultSrc(ResultSrc),
    .ALUSrc(ALUSrc),
    .ImmSrc(ImmSrc),
    .ALUControl(ALUControl_Top)
);

Mux Mux_DataMemory_to_Register (
    .a(ALUResult),
    .b(Read_data),
    .s(ResultSrc),
    .c(Result)
);

// Prevent trimming
assign ALU_out = ALUResult;
assign PC_out  = PC_Top;

endmodule
