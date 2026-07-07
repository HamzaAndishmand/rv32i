module ALU(input [31:0] A, B,
					input [3:0] control,
					output logic [31:0] result,
					output logic [3:0] status);
	always_comb begin
		status = 4'b0000;

		case(control)
			4'b0000:
				result = A & B; //AND
			4'b0001:
				result = A | B; //OR
			4'b0010:
				result = A ^ B; //XOR
			4'b0011:
				result = ~A; //NOT
			4'b0100:
				result = A << B; //SLL
			4'b0101:
				result = A >> B; //SRL
			4'b0110:
				result = A >>> B; //SRA
			4'b0111:
				result = ~(A & B); //NAND
			4'b1000:
				result = ~(A ^ B); //XNOR
			4'b1001:
				result = (A < B) ? 32'd1 : 32'd0; //SLTU
			4'b1010:
				result = (A == B) ? 32'd1 : 32'd0; //Compare
			4'b1011:
				result = A + B; //ADD
			4'b1100:
				result = A - B; //SUB
			4'b1101:
				result = A * B; //Mult
			4'b1110:
				result = A / B; //Dev
			4'b1111:
				result = ($signed(A) < $signed(B)) ? 32'd1 : 32'd0; //SLT
			default result = 32'd0;
		endcase
	end
endmodule
		
