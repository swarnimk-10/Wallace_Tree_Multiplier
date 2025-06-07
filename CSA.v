`timescale 1ns / 1ps

module CSA(
    input [31:0] A, 
    input [31:0] B,  
    input [31:0] C,
    
    output [31:0] SUM,
    output [31:0] CARRY    
);
    
    assign SUM = A ^ B ^ C;
    assign CARRY[0] = 0;
    assign CARRY[31:1] = (A&B) | (A&C) | (B&C);
        
endmodule