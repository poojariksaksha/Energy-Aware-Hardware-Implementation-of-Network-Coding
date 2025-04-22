# Energy-Aware-Hardware-Implementation-of-Network-Coding

## Project Overview

This project focuses on the design and implementation of an energy-aware hardware accelerator for Network Coding (NC), leveraging VHDL to model and simulate the entire encoding process over Galois Field GF(8). The primary goal is to enhance network throughput and reliability through Random Linear Network Coding (RLNC), while maintaining low energy consumption and efficient hardware resource usage.

The architecture is inspired by the work of Angelopoulos, Médard, and Chandrakasan, and includes four core functional modules: RAM-based message storage, Linear Feedback Shift Registers (LFSRs) for random coefficient generation, Galois Field multipliers, and a binary tree of Galois Field adders. These modules are implemented as parameterized VHDL components and verified through simulation.

The final NC encoder design integrates the modules using structural VHDL, forming a scalable and energy-efficient encoding pipeline. The design was synthesized using Synopsys Design Compiler, and optimization metrics such as area, timing slack, and power consumption were analyzed.

This project demonstrates the feasibility of deploying NC hardware accelerators in energy-constrained environments, such as wireless sensor networks and edge devices, where performance and power efficiency are both critical.
## Core Modules

- **RAM_8x3.vhdl**: 3-bit memory module
- **LFSR.vhdl**: Linear Feedback Shift Register for generating coefficients
- **GF_Multiplier.vhdl**: Performs GF(8) multiplication with modulo reduction
- **GF_Adder.vhdl**: XOR-based GF addition
- **Blocks 1–5**: Structural integration of components leading to complete NC encoder

---

## Simulation & Synthesis

- Simulated in ModelSim
- Synthesized in Synopsys Design Compiler
- Synthesis reports include area, slack, and setup time analysis

---

## References

- [ComNets Lectures](https://www.youtube.com/@comnetslectures7672)
- Galois Field Calculator: http://www.ece.unb.ca/cgi-bin/tervo/galois3.pl
- IEEE NUiCONE Conference Papers on Network Coding
