module Instruction_Decoder(
		input [31:0] Intstruction,
		output reg [6:0] op,
		output reg [6:0] funct7,
		output reg [2:0] funct3,
		output reg [4:0] rs1,
		output reg [4:0] rs2,
		output reg [4:0] rd
	);

	always @(*) begin
		op = Intstruction[6:0];
		funct7 = Intstruction[31:25];
		funct3 = Intstruction[14:12];
		rs1 = Intstruction[19:15];
		rs2 = Intstruction[24:20];
		rd = Intstruction[11:7];
	end 

endmodule
