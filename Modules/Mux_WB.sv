module Mux_WB (
	input logic [1:0] sel,
	input logic [31:0] alu_result,
	input logic [31:0] load_data,
	input logic [31:0] current_pc,
	output logic [31:0] wd
	);

	always_comb begin
		case(sel)
			2'b00: begin
				wd = alu_result;
			end
			2'b01: begin
				wd = load_data;
			end
			2'b10: begin
				wd = current_pc + 32'd4;
			end
			default: 
				wd = alu_result;
		endcase
	end
endmodule
