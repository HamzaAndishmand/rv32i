module ALU_Control(
	input [6:0] opcode, funct7, 
	input [2:0] funct3,
	output reg [3:0] ALU_op);
		
	always @ (*) begin
		case(opcode)
			7'b0110011:
				case(funct3)
					3'b000: begin
						if (funct7 == 7'd0) begin
							ALU_op = 4'b1100;
						end
						else begin
							ALU_op = 4'b1011;
						end
					end
					3'b001: begin
						ALU_op = 4'b0100;
					end
					3'b010: begin
					end
					3'b011: begin
					end 
					3'b100: begin
					end 
					4'b101: begin
					end
				endcase
		endcase
	end
endmodule	
