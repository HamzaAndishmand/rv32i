module Instruction_Decoder(
		input [31:0] Instruction,
		output logic [6:0] op,
		output logic [6:0] funct7,
		output logic [2:0] funct3,
		output logic [4:0] rs1,
		output logic [4:0] rs2,
		output logic [4:0] rd
	);

	always_comb begin
		op = Instruction[6:0];
		case(op)
			7'b0110011: begin //R-Type Instructions
				funct7 = Instruction[31:25];
				funct3 = Instruction[14:12];
				rs1 = Instruction[19:15];
				rs2 = Instruction[24:20];
				rd = Instruction[11:7];
			end
			7'b0010011, 7'b0000011, 7'b1100111: begin //I Type Instructions
				funct7 = Instruction[30] ? {1'b0, 1'b1, 5'd0}:7'b0;
				funct3 = Instruction[14:12];
				rs1 = Instruction[19:15];
				rs2 = 5'd0;
				rd = Instruction[11:7];
			end
			7'b0100011: begin //S-Type Instruction
				funct7 = 7'd0;
				funct3 = Instruction[14:12];
				rs1 = Instruction[19:15];
				rs2 = Instruction[24:20];
				rd = 5'd0;
			end
			7'b1100011: begin //B-Type Instruction
				funct7 = 7'd0;
				funct3 = Instruction[14:12];
				rs1 = Instruction[19:15];
				rs2 = Instruction[24:20];
				rd = 5'd0;
			end
			default: begin
				funct7 = 7'd0;
				rs1 = 5'd0;
				rs2 = 5'd0;
				funct3 = 3'd0;
				rd = 5'd0;
			end
		endcase
	end
endmodule
