module Control_Unit(
	input logic [6:0] op,
	output logic reg_write
	);

	always_comb begin
		case(op)
			7'b110011:
				reg_write = 1;
			7'b0010011:
				reg_write = 1;
		endcase
	end 
endmodule
