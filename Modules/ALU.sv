import defs_pkg::*;
module ALU(input [31:0] A, B,
					input [3:0] control,
					output logic [31:0] result,
					output logic [3:0] status);
	always_comb begin

		case(control)
			AND:
				result = A & B; 
			OR:
				result = A | B; 
			XOR:
				result = A ^ B; 
			SLL:
				result = A << B[4:0]; 
			SRL:
				result = A >> B[4:0]; 
			SRA:
				result = $signed(A) >>> B[4:0]; 
			SLTU:
				result = (A < B) ? 32'd1 : 32'd0; 
			ADD:
				result = A + B; 
			SUB:
				result = A - B; 
			SLT:
				result = ($signed(A) < $signed(B)) ? 32'd1 : 32'd0; 
			default result = 32'd0;
		endcase
		status = 4'b0000;
	end
endmodule
		
