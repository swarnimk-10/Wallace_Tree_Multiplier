# Pipelined 16-bit Wallace Tree Multiplier

## Overview
This project implements a **pipelined 16-bit Wallace Tree Multiplier** in Verilog, designed for high-speed multiplication in digital systems such as processors and DSPs. The multiplier efficiently multiplies two 16-bit unsigned inputs to produce a 32-bit output product.

## Why Wallace Tree Multiplier?
Wallace tree multipliers are essential for high-performance computing because they reduce the critical path delay caused by sequential addition of partial products. By parallelizing the reduction using CSAs and a fast final adder (CLA), this design achieves faster multiplication than naive methods.

![Screenshot 2025-06-07 161449](https://github.com/user-attachments/assets/7b77cdd7-29e8-495b-b02e-18d79c700865)


## Key Features
- **Partial Product Generation (PP):**  
  Generates 16 partial products from two 16-bit inputs using bitwise AND and shift operations.
  
- **Carry Save Adder (CSA) Tree:**  
  Uses a Wallace tree structure with Carry Save Adders to reduce the multiple partial products into two operands efficiently, minimizing addition delay.
  
- **Carry Lookahead Adder (CLA):**  
  Final stage adds the two reduced operands with a fast CLA to produce the final 32-bit product output.
  
- **Pipelining:**  
  The design is pipelined across multiple stages to increase throughput and achieve higher clock frequencies suitable for integration in modern processors.

## Module Breakdown
- `PP.v` — Partial Product generation module  
- `CSA.v` — Carry Save Adder module for parallel addition  
- `CLA.v` — Carry Lookahead Adder module for fast final addition  
- `Wallace_Tree_Mult.v` — Top-level module integrating PP, CSA tree, and CLA with pipelining stages

First, partial products are calculated. Partial products are the offset of the first number. The 
translation is done by looking at the second number. The first number is shifted to the left by 
the numeric value for each bit of the '1' value of the second number. In the '0' bits of the second 
number, the partial products get '0'. The partial products obtained are collected in threes with the Carry save adder. As a 
result of this operation, 32-bit carry and sum numbers are obtained. The process is repeated in 
the same way for the subsequent results. 
At the end of the transactions, the two results from a single CSA are combined with the 
CLA and the result is obtained. 

![wallace](https://github.com/user-attachments/assets/540cb9f9-48bf-4010-9974-b16b05aa13fd)

## Schematic
![Screenshot 2025-06-07 153821](https://github.com/user-attachments/assets/b35b0aeb-2c3e-4572-8761-6f3549f6bfb0)

## Simulation
![Screenshot 2025-06-07 155104](https://github.com/user-attachments/assets/22675235-3155-484c-ba5c-6bb11a1489b2)


## Design and Analysis
As seen below, 379 LUTs are used. The total chip on power value is 52.44W. The individual power 
consumptions are indicated on the right. Most of the power consumption is due to the high I/O 
rating. Although signal and logic consume approximately 10% power, I/O value accounts for 
most of the power consumption with 90% value.

![Screenshot 2025-06-07 161114](https://github.com/user-attachments/assets/1423b841-30cf-4d37-8138-cfe1b8c4d335)

![Screenshot 2025-06-07 161154](https://github.com/user-attachments/assets/c166904c-a922-4ff3-8f7c-f1ce93def86f)
