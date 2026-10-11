module Mux_Src_A(
	input logic sel,
	input logic [31:0] rs1_data,
	input logic [31:0] PC,
	output logic [31:0] srcA
	);
	
	always_comb begin 
		case(sel)
			1'b0: begin
				srcA = rs1_data;
			end
			1'b1: begin
				srcA = PC;
			end
			default:
				srcA = rs1_data;
		endcase
	end 
endmodule 
