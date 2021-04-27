module Kevin_number_detector_G(in, out);
	parameter n=4;

	input[n-1:0]in;
	output out;

	wire not_w, not_x, not_y, not_z;
	wire and0, and1, and2, and3, and4;

	not not_0(not_w, in[3]);
	not not_1(not_x, in[2]);
	not not_2(not_y, in[1]);
	not not_3(not_z, in[0]);

	and and_0(and0, in[3], in[2], not_z);
	and and_1(and1, in[3], in[1], not_z);
	and and_2(and2, not_w, in[2], in[1]);
	and and_3(and3, not_w, in[2], in[0]);
	and and_4(and4, not_x, not_y, in[0]);

	or or_0(out, and0, and1, and2, and3, and4);

endmodule


module Kevin_number_detector_D(in, out);
	parameter n=4;
	
	input[n-1:0]in;
	output out;

	assign out=(in[3]&in[2]&!in[0])|(in[3]&in[1]&!in[0])|(!in[3]&in[2]&in[1])|(!in[3]&in[2]&in[0])|(!in[2]&!in[1]&in[0]);

endmodule


module Kevin_number_detector_B(in, out);
	parameter n=4;

	input[n-1:0]in;
	output out;
	reg out;

	always@(*)begin
		case(in)
			1,5,6,7,9,10,12,14:begin
				out = 1'b1;
			end
			default:begin
				out = 1'b0;
			end
		endcase
	end

endmodule

