module Immediate_Gen(
	input logic [11:0] imm,
	input logic [6:0] opcode,
	output logic [31:0] imm_out);
	
	always_comb begin
		case(opcode)
			7'b0010011:
				imm_out = {{20{imm[11]}}, imm[11:0]};
		endcase
	end
endmodule
