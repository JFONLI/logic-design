`define PUSH 2'd0
`define POP 2'd1
`define PP 2'd2
`define IDLE 2'd3

module queue(clk,reset,go,cmd,r_num,ready,w_en,r_en,full,almost_full,empty,almost_empty,error,w_num,addr);
	input clk,reset,go;
	input [17:0]cmd;
	input [15:0]r_num;

	output reg ready;
	output w_en,r_en;
	output full,almost_full,empty,almost_empty;
	output [15:0]w_num;
	output reg error;
	output reg [4:0]addr;
	
	reg [1:0]state, next_state;
	reg [5:0]total, next_total;
	reg [15:0]last, next_last;
	reg [4:0]push, next_push;
	reg [4:0]pop, next_pop;
	reg next_ready;
	reg next_error;
	reg last_en, next_last_en;
	
	always@(posedge reset or posedge clk)begin
		if (reset == 1'b1)begin
			state <= `IDLE;
			total <= 6'd0;
			last <= 16'bx;
			push <= 5'd0;
			pop <= 5'd0;
			ready <= 1'b1;
			last_en <= 1'b0;
			error <= 1'b0;
		end
		else begin
			state <= next_state;
			total <= next_total;
			last <= next_last;
			push <= next_push;
			pop <= next_pop;
			ready <= next_ready;
			error <= next_error;
			last_en <= next_last_en;
		end
	end
	
	always@(*)begin
		if (reset == 1'b1)begin
			next_error = 1'b0;
		end
		next_state = state;
		next_total = total;
		next_last = last;
		next_push = push;
		next_pop = pop;
		next_ready = ready;
		next_last_en = last_en;
		next_error = error;
		
		case(state)
			`PUSH:begin
				//$display("PUSHING");
				if (total + 6'd1 > 6'd32)begin
					next_error = 1'b1;
				end
				else begin
					next_total = total + 6'd1;
					addr = push;
					if (push + 5'd1 > 5'd31)
						next_push = push + 5'd1 - 5'd31;
					else
						next_push = push + 5'd1;
				end
				
				next_ready = 1'b1;
				next_state = `IDLE;
			end
				
			`POP:begin
				//$display("POPING");
				if (total == 6'd0)begin
					//$display("INPOPERROR");
					next_error = 1'b1;
				end
				else begin
					next_last_en = 1'b1;
					next_total = total - 6'd1;
					next_last = r_num;
					addr = pop;
					if (pop + 5'd1 > 5'd31)
						next_pop = pop + 5'd1 - 5'd31;
					else
						next_pop = pop + 5'd1;
				end
				
				next_ready = 1'b1;
				next_state = `IDLE;
			end
				
			`PP:begin
				//$display("PPING");
				if (total - 6'd1 < 6'd0)begin
					next_error = 1'b1;
				end
				else if (last_en == 1'b0)begin
					//$display("IN");
					next_error = 1'b1;
				end
				else begin
					next_total = total + 6'd1;
					addr = push;
					if (push + 5'd1 > 5'd31)
						next_push = push + 5'd1 - 5'd31;
					else
						next_push = push + 5'd1;
				end
				
				next_ready = 1'b1;
				next_state = `IDLE;
			end
				
			`IDLE:begin
				next_error = 1'b0;
				if (ready == 1 && go == 1 && cmd[17:16] == 2'd0)begin
					next_ready = 1'b0;
					next_state = `PUSH;
				end
				if (ready == 1 && go == 1 && cmd[17:16] == 2'd1)begin
					next_ready = 1'b0;
					next_state = `POP;
				end
				if (ready == 1 && go == 1 && cmd[17:16] == 2'd2)begin
					next_ready = 1'b0;
					next_state = `PP;
				end
				if (ready == 0 || go == 0 && cmd[17:16] == 2'd3)begin
					next_ready = 1'b1;
					next_state = `IDLE;
				end
			end
		endcase
	end
		
	assign full = (total == 6'd32)? 1'b1:1'b0;
	assign almost_full = (total == 6'd31)? 1'b1:1'b0;
	assign empty = (total == 6'd0)? 1'b1:1'b0;
	assign almost_empty = (total == 6'd1)? 1'b1:1'b0;
	assign w_en = (state == `PUSH || state == `PP)? 1'b1:1'b0;
	assign r_en = (state == `POP)? 1'b1:1'b0;
	assign w_num = (state == `PUSH)? cmd[15:0]:last;
	
	
	

endmodule
