# RV32I Single-Cycle RISC-V CPU in SystemVerilog, with C++ Assembler and Verification

> An in-progress hardware/software co-design of a RISC-V CPU

[![RTL Verification](https://github.com/HamzaAndishmand/rv32i/actions/workflows/ci.yml/badge.svg)](https://github.com/HamzaAndishmand/rv32i/actions/workflows/ci.yml)
![Status](https://img.shields.io/badge/status-In%20Progress-blue)
![Language](https://img.shields.io/badge/SystemVerilog-RTL-orange)

## Overview
This project contains the documentation of a single-cycle RV32I RISC-V processor that was implemented from scratch using SystemVerilog. Testbenches simulated under Verilator and are run after every push.

## Project Status
**Current Working:**
- Complete implementation of all instruction types (R, I, S, B, U, and J)
- ALU with a self-checking testbench and independent oracle
- C++ assembler that converts R-type and I-type instructions to 32 bit binary machine code
- CI pipeline under Verilator

**WIP:**
- top.sv
- Immediate_Gen testbench

**Soon to be added:** 
- Single-cycle data path integration
- C++ golden reference models for testbenched modules
- S, B, U and J instruction conversion to assembler

## Architecture
![Block diagram](./Diagrams/RV32I.drawio.png)

## Verification Philosophy

All modules are checked against a reference model. Each modules' testbench drives the DUT with random inputs then compares the outputs against the oracle
which also implements the same operations from the spec, independent from the RTL. This system has done a good job at flagging bugs.

Currently, oracles are written in SystemVerilog within each testbench. Porting the oracles to C++ golden models is the next step after datapath integration.

## Known Issues
- CI only covers ALU testbench. More modules to be added as soon as the testbenches are complete.
- The assembler is a table driven translator, it looks up each mnemonic in an opcode/funct table and packs the operand fields into a 32-bit word. Once the CPU is complete I'd like to grow it into a full two pass assembler with error reporting.

## Build & Run

**Required**
- Verilator v5.050
- GNU Make

**Steps**
```bash
git clone https://github.com/HamzaAndishmand/rv32i.git
cd rv32i
make sim_verilator
```

**Expected output:**
```bash
Total tests passed:        1000
Total tests failed:           0
random_num done
Total tests passed:        3240
Total tests failed:           0
check_corners done
- Testbench/ALU_tb.sv:184: Verilog $finish
- S i m u l a t i o n   R e p o r t: Verilator 5.050 2026-07-01
- Verilator: $finish at 52ns; walltime 0.009 s; speed 5.650 us/s
- Verilator: cpu 0.009 s on 1 threads; allocated 7 MB
```

To clean build artifacts:
```bash
make clean
```
