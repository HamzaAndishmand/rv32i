module ALU_Control(
	input [6:0] opcode, funct7, 
	input [2:0] funct3,
	input [11:0] imm,
	output logic [3:0] ALU_op);
		
	always_comb begin 
		case(opcode)
			7'b0110011: //R-Type Instructions
				case(funct3) 
					3'b000: begin
						if (funct7 == 7'b0000000) begin 
							ALU_op = 4'b1011; //SUB
						end
						else begin
							ALU_op = 4'b1100; //ADD
						end
					end
					3'b001: begin
						ALU_op = 4'b0100; //SLL
					end
					3'b010: begin
						ALU_op = 4'b1111; //SLT
					end
					3'b011: begin
						ALU_op = 4'b1001; //SLTU
					end 
					3'b100: begin
						ALU_op = 4'b0010; //XOR
					end 
					3'b101: begin
						if (funct7 == 7'b0000000) begin
							ALU_op = 4'b0101; //SRL
						end 
						else begin
							ALU_op = 4'b0110; //SRA
						end 
					end
					3'b110: begin
						ALU_op = 4'b0001; //OR 
					end
					3'b111: begin
						ALU_op = 4'b0000; //AND
					end
				endcase

			7'b0010011: //I-Type Instructions
				case(funct3)
					3'b000: begin
						ALU_op = 4'b1011; //ADDI
					end 
					3'b001: begin
						ALU_op = 4'b0100;
					end 
					3'b010: begin
						ALU_op = 4'b1111;
					end 
					3'b011: begin 
						ALU_op = 4'b1001;
					end 
					3'b100: begin
						ALU_op = 4'b0010;
					end 
					3'b101: begin
						if(imm[10] == 1) begin
							ALU_op = 4'b0110;
						end 
						else begin
							ALU_op = 4'b0101;
						end
					end 
					3'b110: begin
						ALU_op = 4'b0001;
					end 
					3'b111: begin
						ALU_op = 4'b0000;
					end 
				endcase
		endcase
	end
endmodule	
