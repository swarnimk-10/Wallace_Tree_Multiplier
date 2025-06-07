`timescale 1ns / 1ps

module tb_Wallace_Tree_Mult();

    reg [15:0] A, B;
    wire [31:0] C;
    wire carry;

    // Instantiate the multiplier
    Wallace_Tree_Mult uut (
        .A(A),
        .B(B),
        .C(C),
        .carry(carry)
    );

    // Task to display inputs and output nicely
    task display_result;
        input [15:0] a_in, b_in;
        input [31:0] product;
        input carry_out;
        reg [31:0] expected;
        begin
            expected = a_in * b_in;  // Calculate expected product using Verilog arithmetic
            $display("A = %h, B = %h, Product = %h, Expected = %h, Carry = %b, %s", 
                a_in, b_in, product, expected, carry_out,
                (product == expected) ? "PASS" : "FAIL");
        end
    endtask

    initial begin
        // Test vectors
        A = 16'h0000; B = 16'h0000; #10 display_result(A, B, C, carry);
        A = 16'h0001; B = 16'h0001; #10 display_result(A, B, C, carry);
        A = 16'hFFFF; B = 16'hFFFF; #10 display_result(A, B, C, carry);
        A = 16'h1234; B = 16'hABCD; #10 display_result(A, B, C, carry);
        A = 16'h0F0F; B = 16'h00FF; #10 display_result(A, B, C, carry);
        A = 16'h8000; B = 16'h0002; #10 display_result(A, B, C, carry);

        // Random test vectors
        repeat (5) begin
            A = $random;
            B = $random;
            #10 display_result(A, B, C, carry);
        end

        $stop;
    end

endmodule
