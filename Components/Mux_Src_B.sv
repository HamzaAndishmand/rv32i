module Mux_Src_B (
	input logic [1:0] sel,
	input logic [31:0] imm,
	input logic [31:0] rs2_data,
	input logic [4:0] shamt,
	output logic [31:0] srcB);
	
	always_comb begin 
		case(sel)
		endcase
	end 
endmodule 

