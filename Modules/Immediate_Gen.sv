module Immediate_Gen(
	input logic [31:0] Instruction,
	output logic [31:0] imm_out);

	always_comb begin
		case(Instruction[6:0])
			7'b0010011, 7'b0000011, 7'b1100111:
				imm_out = {{20{Instruction[31]}}, Instruction[31:20]};
			7'b0100011:
				imm_out = {{20{Instruction[31]}}, Instruction[31:25], Instruction[11:7]};
			7'b1100011:
				imm_out = {{19{Instruction[31]}}, Instruction[31], Instruction[7], Instruction[30:25], Instruction[11:8], 1'b0};
			7'b0110111:
				imm_out = {Instruction[31:12], {12{1'b0}}};
			default:
				imm_out = 32'd0;
		endcase
	end
endmodule
