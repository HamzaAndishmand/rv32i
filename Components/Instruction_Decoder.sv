module Instruction_Decoder(
		input [31:0] Instruction,
		output reg [6:0] op,
		output reg [6:0] funct7,
		output reg [2:0] funct3,
		output reg [4:0] rs1,
		output reg [4:0] rs2,
		output reg [4:0] rd,
		output reg [11:0] imm
	);

	always @(*) begin
		op = Instruction[6:0];
		case(op)
			7'b0110011: begin //R-Type Instructions
				funct7 = Instruction[31:25];
				funct3 = Instruction[14:12];
				rs1 = Instruction[19:15];
				rs2 = Instruction[24:20];
				rd = Instruction[11:7];
			end
			7'b0010011: begin //I-Type Instructions 
				funct7 = 7'd0;
				funct3 = Instruction[14:12];
				rs1 = Instruction[19:15];
				rs2 = 5'd0;
				rd = Instruction[11:7];
				imm = Instruction[31:20];
			end
		endcase
	end
endmodule
