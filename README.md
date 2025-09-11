# RISC-V-Single-Cycle-Core
# RISC-V Single Cycle Processor (Verilog)

## 📌 Project Overview
This project implements a **RISC-V single cycle processor** in Verilog HDL.  
The design follows the classical single cycle CPU architecture, where each instruction is fetched, decoded, executed, and completed in a **single clock cycle**.  

The processor is verified using **Vivado** for synthesis, simulation, and implementation.

---

## 🏗️ Architecture

The design is divided into modular components:
- **Program Counter (PC)** – Holds the address of the current instruction.
- **Instruction Memory** – Stores machine instructions.
- **PC Adder** – Increments PC by 4 for sequential execution.
- **Register File** – 32 general-purpose registers with read/write capability.
- **Sign Extend Unit** – Extends immediate values to 32 bits.
- **ALU** – Executes arithmetic and logical operations.
- **Data Memory** – Read/write access for load/store instructions.
- **Control Unit** – Generates control signals based on instruction type.
  - Main Decoder
  - ALU Decoder
- **Multiplexers** – Select between operands (Register/Immediate, ALU/Data, etc.).

---

## 🔑 Features
- Implements **RV32I instruction subset**
- Handles:
  - Arithmetic & Logical operations
  - Load/Store instructions
  - Branch operations
- Modular design for reusability and clarity
- Synthesizable on **Xilinx FPGAs**

---

## 📂 Project Structure
