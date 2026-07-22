`include "isa_defs_pkg/defs_pkg.sv"
import defs_pkg::*;
module ALU(input [31:0] A, B,
					input [3:0] control,
					output logic [31:0] result,
					output logic [3:0] status);
	always_comb begin
		status = 4'b0000;

		case(control)
			AND:
				result = A & B; 
			OR:
				result = A | B; 
			XOR:
				result = A ^ B; 
			NOT:
				result = ~A; 
			SLL:
				result = A << B; 
			SRL:
				result = A >> B; 
			SRA:
				result = A >>> B; 
			NAND:
				result = ~(A & B); 
			XNOR:
				result = ~(A ^ B);
			SLTU:
				result = (A < B) ? 32'd1 : 32'd0; 
			SEQ:
				result = (A == B) ? 32'd1 : 32'd0; 
			ADD:
				result = A + B; 
			SUB:
				result = A - B; 
			MULT:
				result = A * B; 
			DEV:
				result = A / B; 
			SLT:
				result = ($signed(A) < $signed(B)) ? 32'd1 : 32'd0; 
			default result = 32'd0;
		endcase
	end
endmodule
		
