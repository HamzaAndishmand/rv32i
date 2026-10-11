module top(
	input logic clk,
	input logic reset
	);

	logic [31:0] current_pc;
	logic [31:0] next_pc;
	logic jump;
	logic [31:0] address;
	logic branch_taken;
	logic [31:0] imm;

	pc u_pc(
		.clk(clk),
		.reset(reset),
		.next_pc(next_pc),
		.current_pc(current_pc)
		);

	Next_PC u_Next_PC(
		.current_pc(current_pc),
		.next_pc(next_pc),
		.jump(jump),
		.address(address),
		.branch_taken(branch_taken),
		.imm(imm)
		);

endmodule
