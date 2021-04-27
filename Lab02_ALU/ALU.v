module ALU (A, B, sel, Cin, Y, Zero);
	input [32 - 1 : 0] A, B;
	input [3 : 0] sel;
	input Cin;
	output reg [32 - 1 : 0] Y;
	output reg Zero;

	wire out1;
	wire out2;
	wire out3;
	wire out4;
	wire out5;
	wire out6;
	wire [32-1:0] out15;
	wire [5-1:0] out16;

	/*
		Design your code here
	*/
	AND a1(.a(A[0]), .b(B[0]), .out(out1));
	OR a2(.a(A[0]), .b(B[0]), .out(out2));
	NOT a3(.a(A[0]), .out(out3));
	XOR a4(.a(A[0]), .b(B[0]), .out(out4));
	XNOR a5(.a(A[0]), .b(B[0]), .out(out5));
	NOR a6(.a(A[0]), .b(B[0]), .out(out6));
	Decoder a7(.a(A[5-1:0]), .b(out15));
	Arbiter a8(.r(A[5-1:0]), .g(out16));
	
	always@(*)begin
		case (sel)
			4'b0000: Y = {31'b0, out1};
			4'b0001: Y = {31'b0, out2};
			4'b0010: Y = {31'b0, out3};
			4'b0011: Y = {31'b0, out4};
			4'b0100: Y = {31'b0, out5};
			4'b0101: Y = {31'b0, out6};
			4'b0110: Y = A+B+Cin;
			4'b0111: Y = A-B;
			4'b1000: begin
				if (A>B)	Y = A-B;
				else	Y=B-A;
			end
			4'b1001: Y = A[15:0]*B[15:0];
			4'b1010: Y = A << 1'b1;
			4'b1011: Y = A << 1'b1;
			4'b1100: Y = A >> 1'b1;
			4'b1101: begin 
				Y = A >> 1'b1;
				Y[31] = A[31];
			end
			4'b1110: Y = {out15};
			4'b1111: Y = {27'b0, out16};
		endcase
	end
	
	always@(*)begin
		if(sel == 4'b1110 || sel == 4'b1111)	Zero = 0;
		if (Y != 32'b0) Zero = 0;
		else Zero = 1;
	end

	
	


endmodule 

module Arbiter(r, g); // find-first-one unit
	input [5 - 1 : 0] r;
	output[5 - 1 : 0] g;
	reg[5 - 1 : 0] g;

	always @(*) begin
		casex(r)
			5'b00000: g = 5'b00000;
			5'bxxxx1: g = 5'b00001;
			5'bxxx10: g = 5'b00010;
			5'bxx100: g = 5'b00100;
			5'bx1000: g = 5'b01000;
			5'b10000: g = 5'b10000;
			default: g = 5'b00000;
		endcase
	end
endmodule

module Decoder(a, b); // binary to one-hot decoder
	input [5 - 1 : 0] a;
	output[32- 1 : 0] b;

	wire[32 - 1 : 0] b = 1 << a;

endmodule

module AND (a, b, out);
	input  a, b;
	output out;
	wire nand_ab;

	nand n1(nand_ab, a, b);
	nand n2(out, nand_ab, nand_ab);	

endmodule

module OR (a, b, out);
	input  a, b;
	output out;
	wire not_a, not_b;

	nand n1(not_a, a, a);
	nand n2(not_b, b, b);
	nand n3(out, not_a, not_b);

endmodule

module NOT (a, out);
	input  a;
	output out;

	nand n1(out, a, a);
	
endmodule

module XOR (a, b, out);
	input  a, b;
	output out;
	wire not_ab, not_a_ab, not_b_ab;

	nand n1(not_ab, a, b);
	nand n2(not_a_ab, a, not_ab);
	nand n3(not_b_ab, b, not_ab);
	nand n4(out, not_a_ab, not_b_ab);	
	
endmodule

module XNOR (a, b, out);
	input  a, b;
	output out;
	wire not_ab_a, not_ab_b, not_ab, temp;
	
	nand n1(not_ab, a, b);
	nand n2(not_ab_a, a, not_ab);
	nand n3(not_ab_b, b, not_ab);
	nand n4(temp, not_ab_a, not_ab_b);
	nand n5(out, temp, temp);
	
endmodule

module NOR (a, b, out);
	input  a, b;
	output out;
	wire not_a, not_b, temp;

	nand n1(not_a, a, a);
	nand n2(not_b, b, b);
	nand n3(temp, not_a, not_b);
	nand n4(out, temp, temp);
	
endmodule
