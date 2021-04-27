`define UP 5'd2
`define DOWN 5'd4
`define LEFT 5'd3
`define RIGHT 5'd1
`define IDLE 1'd0
`define SUM 1'd1

module full_adder(a, b, cin, cout, sum) ;
	input a, b, cin;
	output cout, sum;
	reg cout;
	reg sum;
	
	always @(a or b or cin) begin
		case({a,b,cin})
		0:begin cout = 0; sum = 0; end
		1:begin cout = 0; sum = 1; end
		2:begin cout = 0; sum = 1; end
		3:begin cout = 1; sum = 0; end
		4:begin cout = 0; sum = 1; end
		5:begin cout = 1; sum = 0; end
		6:begin cout = 1; sum = 0; end
		7:begin cout = 1; sum = 1; end
		endcase
	end
endmodule

module adderSubtractor(a, b, cin, cout, sum) ;
    parameter n = 5;
    input signed[n - 1 : 0] a, b;
    input cin;
    output signed[n - 1 : 0] sum;
    output cout;
	
	wire b0;
	wire b1;
	wire b2;
	wire b3;
	wire b4;
	
	wire c0;
	wire c1;
	wire c2;
	wire c3;
	wire c4;
	
	xor x1(b0, b[0], cin);
	xor x2(b1, b[1], cin);
	xor x3(b2, b[2], cin);
	xor x4(b3, b[3], cin);
	xor x5(b4, b[4], cin);
	
	full_adder f1(a[0], b0, cin, c0, sum[0]);
	full_adder f2(a[1], b1, c0, c1, sum[1]);
	full_adder f3(a[2], b2, c1, c2, sum[2]);
	full_adder f4(a[3], b3, c2, c3, sum[3]);
	full_adder f5(a[4], b4, c3, c4, sum[4]);
	
	xor x6(cout, c3, c4);

endmodule

module TBT(clk , rst , start , data , en , addr , fin , result);

    parameter datawidth = 5;
    parameter memwidth = 5;

    input clk , rst , start;
    input [datawidth - 1 : 0] data;
    output en , fin;
    output [memwidth - 1 : 0] addr;
    output [datawidth - 1 : 0] result;

    reg state , next_state;
    reg [memwidth - 1 : 0] num , next_num;
    reg [memwidth - 1 : 0] leng , next_leng;
    reg [datawidth - 1 : 0] ans , next_ans;
	reg [datawidth - 1 : 0] latt, next_latt;
	
	wire [datawidth-1:0] temp2;
	wire [datawidth-1:0] temp1;
	wire [datawidth-1:0] temp11;
	wire [datawidth-1:0] temp12;
	wire overflow;
	
	adderSubtractor a1(ans, 5'd2, 1'b0, overflow, temp2);
	adderSubtractor a2(ans, 5'd1, 1'b0, overflow, temp1);
	adderSubtractor a3(ans, -5'd1, 1'b0, overflow, temp11);
	adderSubtractor a4(ans, -5'd2, 1'b0, overflow, temp12);
	
	
	

    always@(posedge rst or posedge clk)begin
        if(rst == 1'b1)begin
            state <= `IDLE;
            num <= 5'd31;
            leng <= 5'd0;
            ans <= 5'd0;
			latt <= 5'd5;
        end
        else begin
            state <= next_state;
            num <= next_num;
            leng <= next_leng;
            ans <= next_ans;
			latt <= next_latt;
        end
    end

    always@(*)begin
        next_num = num + 5'd1;
        next_leng = leng;
        next_ans = ans;
        next_state = state;
		next_latt = latt;
		
        case(state)
            `IDLE:begin
                next_state = (start == 1'b1)? `SUM : `IDLE;
                next_num = (start == 1'b1)? 5'd0 : 5'd31;
                next_leng = (start == 1'b1)? data : leng;
				next_latt = (start == 1'b1)? 5'd5 : latt;
            end
            `SUM:begin
				if (num < leng)begin
					case(latt)
						5'd1:begin
						case(data)
							`UP:begin next_ans = ans;
										next_latt = latt;
								end
							`RIGHT:begin next_ans = temp11;
											next_latt = 5'd2;
									end
							`DOWN:begin next_ans = temp11;
										next_latt = 5'd4;
									end
							`LEFT:begin next_ans = ans;
										next_latt = latt;
									end
							default:begin next_ans = ans;
										next_latt = latt;
									end
						endcase
						end
						5'd2:begin
						case(data)
							`UP:begin next_ans = ans;
										next_latt = latt;
								end
							`RIGHT:begin next_ans = temp2;
											next_latt = 5'd3;
									end
							`DOWN:begin next_ans = ans;
										next_latt = 5'd5;
									end
							`LEFT:begin next_ans = temp12;
										next_latt = 5'd1;
									end
							default:begin next_ans = ans;
										next_latt = latt;
									end
						endcase
						end
						5'd3:begin
						case(data)
							`UP:begin next_ans = ans;
										next_latt = latt;
								end
							`RIGHT:begin next_ans = ans;
											next_latt = latt;
									end
							`DOWN:begin next_ans = temp1;
										next_latt = 5'd6;
									end
							`LEFT:begin next_ans = temp11;
										next_latt = 5'd2;
									end
							default:begin next_ans = ans;
										next_latt = latt;
									end
						endcase
						end
						5'd4:begin
						case(data)
							`UP:begin next_ans = temp12;
										next_latt = 5'd1;
								end
							`RIGHT:begin next_ans = ans;
											next_latt = 5'd5;
									end
							`DOWN:begin next_ans = temp2;
										next_latt = 5'd7;
									end
							`LEFT:begin next_ans = ans;
										next_latt = latt;
									end
							default:begin next_ans = ans;
										next_latt = latt;
									end
						endcase
						end
						5'd5:begin
						case(data)
							`UP:begin next_ans = temp11;
										next_latt = 5'd2;
								end
							`RIGHT:begin next_ans = temp1;
											next_latt = 5'd6;
									end
							`DOWN:begin next_ans = temp1;
										next_latt = 5'd8;
									end
							`LEFT:begin next_ans = temp11;
										next_latt = 5'd4;
									end
							default:begin next_ans = ans;
										next_latt = latt;
									end
						endcase
						end
						5'd6:begin
						case(data)
							`UP:begin next_ans = temp2;
										next_latt = 5'd3;
								end
							`RIGHT:begin next_ans = ans;
											next_latt = latt;
									end
							`DOWN:begin next_ans = temp12;
										next_latt = 5'd9;
									end
							`LEFT:begin next_ans = ans;
										next_latt = 5'd5;
									end
							default:begin next_ans = ans;
										next_latt = latt;
									end
						endcase
						end
						5'd7:begin
						case(data)
							`UP:begin next_ans = temp11;
										next_latt = 5'd4;
								end
							`RIGHT:begin next_ans = temp1;
											next_latt = 5'd8;
									end
							`DOWN:begin next_ans = ans;
										next_latt = latt;
									end
							`LEFT:begin next_ans = ans;
										next_latt = latt;
									end
							default:begin next_ans = ans;
										next_latt = latt;
									end
						endcase
						end
						5'd8:begin
						case(data)
							`UP:begin next_ans = ans;
										next_latt = 5'd5;
								end
							`RIGHT:begin next_ans = temp12;
											next_latt = 5'd9;
									end
							`DOWN:begin next_ans = ans;
										next_latt = latt;
									end
							`LEFT:begin next_ans = temp2;
										next_latt = 5'd7;
									end
							default:begin next_ans = ans;
										next_latt = latt;
									end
						endcase
						end
						5'd9:begin
						case(data)
							`UP:begin next_ans = temp1;
										next_latt = 5'd6;
								end
							`RIGHT:begin next_ans = ans;
											next_latt = latt;
									end
							`DOWN:begin next_ans = ans;
										next_latt = latt;
									end
							`LEFT:begin next_ans = temp1;
										next_latt = 5'd8;
									end
							default:begin next_ans = ans;
										next_latt = latt;
									end
						endcase
						end
					endcase
					end
					else begin
						next_ans = ans;
						next_latt = latt;
					end
            end
        endcase
    end

    assign en = 1'b1;
    assign addr = num;
    assign fin = (start == 1'b1 && num == leng)? 1'b1 : 1'b0;
    assign result = (fin == 1'b1)? ans : 5'd0;

endmodule
