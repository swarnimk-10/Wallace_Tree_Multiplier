`timescale 1ns/1ps

    module CLA (
        input [31:0] A,
        input [31:0] B,
        input CIN,
        output [31:0] SUM,
        output COUT
    );


        wire [31:0] G;
        wire [31:0] P;
        wire [32:0] C;

        genvar j, i;
        generate
 //assume Cin is zero
        assign C[0] = CIN;
 
 //carry generator
        for(j = 0; j < 32; j = j + 1) begin: carry_generator
            assign G[j] = A[j] & B[j];
            assign P[j] = A[j] | B[j];
            assign C[j+1] = G[j] | P[j] & C[j];
        end
 
 //carry out 
        assign COUT = C[32];
 
 //calculate sum 
 //assign sum[0] = A[0] ^ B ^ CIN;
        for(i = 0; i < 32; i = i+1) begin: sum_without_carry
            assign SUM[i] = A[i] ^ B[i] ^ C[i];
        end 
    endgenerate 
endmodule