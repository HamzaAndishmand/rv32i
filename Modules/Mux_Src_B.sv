module Mux_Src_B (
	input logic [1:0] sel,
	input logic [31:0] imm,
	input logic [31:0] rs2_data,
	input logic [4:0] shamt,
	output logic [31:0] srcB);
	
	always_comb begin 
		case(sel)
			2'b00:
				srcB = rs2_data;
			2'b01:
				srcB = imm;
			2'b10:
				srcB = {{27{sel[1]}}, shamt[4:0]};
			2'b11:
				srcB = 32'h00000000;
			default:
				srcB = rs2_data;
		endcase
	end 
endmodule 

