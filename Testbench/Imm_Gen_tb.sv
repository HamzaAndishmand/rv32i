`include "Modules/Immediate_Gen.sv"
module Imm_Gen_tb();

	logic [31:0] instr;
	logic [31:0] imm;

	Immediate_Gen DUT	(
		.instruction(instr),
		.imm_out(imm)
		);
endmodule
