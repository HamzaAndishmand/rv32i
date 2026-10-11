import defs_pkg::*;
module ALU_Control(
	input [6:0] opcode, funct7, 
	input [2:0] funct3,
	output logic [3:0] ALU_op
	);
		
	always_comb begin 
		case(opcode)
			7'b0110011:
				case(funct3) 
					3'b000: begin
						if (funct7 == 7'b0000000) begin 
							ALU_op = ADD;
						end
						else begin
							ALU_op = SUB;
						end
					end
					3'b001: begin
						ALU_op = SLL; 
					end
					3'b010: begin
						ALU_op = SLT; 
					end
					3'b011: begin
						ALU_op = SLTU; 
					end 
					3'b100: begin
						ALU_op = XOR; 
					end 
					3'b101: begin
						if (funct7 == 7'b0000000) begin
							ALU_op = SRL; 
						end 
						else begin
							ALU_op = SRA; 
						end 
					end
					3'b110: begin
						ALU_op = OR; 
					end
					3'b111: begin
						ALU_op = AND; 
					end
				endcase
			7'b0010011:
				case(funct3)
					3'b000: begin
						ALU_op = ADD; 
					end 
					3'b001: begin
						ALU_op = SLL;
					end 
					3'b010: begin
						ALU_op = SLT;
					end 
					3'b011: begin 
						ALU_op = SLTU;
					end 
					3'b100: begin
						ALU_op = XOR;
					end 
					3'b101: begin
						if(funct7[5] == 1) begin
							ALU_op = SRA;
						end 
						else begin
							ALU_op = SRL;
						end
					end 
					3'b110: begin
						ALU_op = OR;
					end 
					3'b111: begin
						ALU_op = AND;
					end 
				endcase
			7'b0000011:
				case(funct3)
					3'b000, 3'b001, 3'b010, 3'b100, 3'b101: begin
						ALU_op = ADD;
					end
					default:
						ALU_op = ADD;
				endcase
			7'b0100011:
				case(funct3)
					3'b000, 3'b001, 3'b010: begin
						ALU_op = ADD;
					end
					default:
						ALU_op = ADD;
				endcase
			7'b1100111:
				ALU_op = ADD;
			7'b1100011:
				case(funct3)
					3'b000, 3'b001, 3'b101, 3'b111: begin
						ALU_op = SUB;
					end
					3'b100: begin
						ALU_op = SLT;
					end
					3'b110: begin 
						ALU_op = SLTU;
					end
					default:
						ALU_op = SUB;
				endcase
			7'b0110111:
				ALU_op = ADD;
			7'b0010111:
				ALU_op = ADD;
			7'b1101111:
				ALU_op = ADD;
			default:
				ALU_op = ADD;
		endcase
	end
endmodule
