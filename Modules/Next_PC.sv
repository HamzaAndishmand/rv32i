module Next_PC(
	input [31:0] current_pc,
	output logic [31:0] next_pc,
	input logic jump,
	input logic [31:0] address
	);

	always_comb begin
		next_pc = jump ? {address[31:1], 1'b0} : current_pc + 4; 
	end
endmodule
