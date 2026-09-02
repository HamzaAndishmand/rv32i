module Immediate_Gen(
	input logic [31:0] instruction,
	output logic [31:0] imm_out);

	logic [6:0] opcode = instruction[6:0];	

	always_comb begin
		case(opcode) //I-type imm
			7'b0010011: 
				imm_out = {{20{instruction[31]}}, instruction[31:20]};
			7'b0000011: 
				imm_out = {{20{instruction[31]}}, instruction[31:20]};
			default:
				imm_out = 32'h00000000;
		endcase
	end
endmodule
