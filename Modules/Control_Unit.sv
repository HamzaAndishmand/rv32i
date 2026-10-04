module Control_Unit(
	input logic [6:0] op,
	output logic reg_write,
	output logic read,
	output logic mem_write,
	output logic [1:0] srcB_sel,
	output logic jump,
	output logic [1:0] result_sel,
	output logic branch
	);

	always_comb begin
		case(op)
			7'b0110011: begin
				srcB_sel = 2'b00;
				reg_write = 1'b1;
				read = 1'b0;
				mem_write = 1'b0;
				jump = 1'b0;
				result_sel = 2'b00;
				branch = 1'b0;
			end
			7'b0010011: begin
				reg_write = 1'b1;
				read = 1'b0;
				mem_write = 1'b0;
				srcB_sel = 2'b01;
				jump = 1'b0;
				result_sel = 2'b00;
				branch = 1'b0;
			end
			7'b0000011: begin
				reg_write = 1'b1;
				read = 1'b1;
				mem_write = 1'b0;
				srcB_sel = 2'b01;
				jump = 1'b0;
				result_sel = 2'b01;
				branch = 1'b0;
			end
			7'b0100011: begin
				reg_write = 1'b0;
				read = 1'b0;
				mem_write = 1'b1;
				srcB_sel = 2'b01;
				jump = 1'b0;
				result_sel = 2'b00;
				branch = 1'b0;
			end
			7'b1100111: begin 
				reg_write = 1'b1;
				read = 1'b0;
				mem_write = 1'b0;
				srcB_sel = 2'b01;
				jump = 1'b1;
				result_sel = 2'b10;
				branch = 1'b1;
			end
			default: begin
				reg_write = 1'b0;
				read  = 1'b0;
				mem_write = 1'b0;
				srcB_sel = 2'b00;
				jump = 1'b0;
				result_sel = 2'b00;
				branch = 1'b0;
			end
		endcase
	end
endmodule
