# RV32I Single-Cycle RISC-V CPU in SystemVerilog, with C++ Assembler and Verification

> An in-progress hardware/software co-design of a RISC-V CPU

[![RTL Verification](https://github.com/HamzaAndishmand/rv32i/actions/workflows/ci.yml/badge.svg)](https://github.com/HamzaAndishmand/rv32i/actions/workflows/ci.yml)
![RTL Status](https://img.shields.io/badge/RTL%20Status-Complete-green)
![Verification Status](https://img.shields.io/badge/Verification-In%20Progress-blue)
![Language](https://img.shields.io/badge/SystemVerilog-RTL-orange)
![Scripting](https://img.shields.io/badge/Scripting-Python-blue)

## Overview
This project is a single-cycle RV32I processor core written in SystemVerilog, targeted for Lattice iCE40 FPGA.

## Status
**WIP:**
- Python program inspector and disassembler
- End to end verification

## Architecture
![Block diagram](./Diagrams/RV32I.drawio.png)

## Synthesis Results
- 2784 LUT4
- 1024 flip-flops
- Fmax = 35.4 MHz

The register file is being built from FFs instead of BRAM, its read logic uses 2094 LUT4s. This is due to it having reset and asynchronous read (BRAM does not support that). Removing reset and makeing reads synchronous is the next step.


## Run

**Required**
- Verilator v5.050
- GNU Make
- OSS-CAD-Suite

**Steps**
```bash
git clone https://github.com/HamzaAndishmand/rv32i.git
cd rv32i
make sim_verilator
make synth
make pnr_ice40
```

To clean build artifacts:
```bash
make clean
```

## Known Issues
- CI only covers ALU testbench. More modules to be added as soon as the testbenches are complete.
- Assembler only covers R and I-type instructions
