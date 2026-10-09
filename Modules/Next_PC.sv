module Next_PC(
	input [31:0] current_pc,
	output logic [31:0] next_pc,
	input logic jump,
	input logic [31:0] address,
	input logic branch_taken,
	input logic [31:0] imm
	);

	always_comb begin
		if(jump) begin
			next_pc = {address[31:1], 1'b0};
		end
		else if (branch_taken) begin
			next_pc = current_pc + imm;
		end
		else begin
			next_pc = current_pc + 4;
		end
	end
endmodule
