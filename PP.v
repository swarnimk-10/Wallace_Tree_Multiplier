`timescale 1ns / 1ps
  
module PP(
    input [15:0] A,
    input [15:0] B,
	
    output [31:0]PP0,
    output [31:0]PP1,
    output [31:0]PP2, 
    output [31:0]PP3,
    output [31:0]PP4,
    output [31:0]PP5,
    output [31:0]PP6,
    output [31:0]PP7,
    output [31:0]PP8,
    output [31:0]PP9,
    output [31:0]PP10,
    output [31:0]PP11,
    output [31:0]PP12,
    output [31:0]PP13,
    output [31:0]PP14,
    output [31:0]PP15
);   
    wire [31:0]PP[15:0];  //16 wires each 32 bits wide
 
    genvar i;
    generate
        for(i = 0; i <= 15; i = i + 1)
        begin
            assign PP[i][31:0] = {16'h0000,(A[i] * B)} << i;
        end
	endgenerate
	 	
	assign PP0 = PP[0][31:0];
    assign PP1 = PP[1][31:0];
    assign PP2 = PP[2][31:0];
    assign PP3 = PP[3][31:0];
    assign PP4 = PP[4][31:0];
    assign PP5 = PP[5][31:0];
    assign PP6 = PP[6][31:0];
    assign PP7 = PP[7][31:0];
    assign PP8 = PP[8][31:0];
    assign PP9 = PP[9][31:0];
    assign PP10 = PP[10][31:0];
    assign PP11 = PP[11][31:0];
    assign PP12 = PP[12][31:0];
    assign PP13 = PP[13][31:0];
    assign PP14 = PP[14][31:0];
    assign PP15 = PP[15][31:0];	
		
endmodule

