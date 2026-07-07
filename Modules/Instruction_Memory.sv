module Instruction_Memory #(
	parameter string MEMORY_FILE = ""
	)
	( input [31:0] pc,
		input logic [31:0] instruction 
	);

	logic [31:0] memory [0:255];
	initial begin
		for (int i = 0; i < 256; i++) begin //NOP
			memory[i] = 32'b00000000000000000000000000010011; 
		end

	end 

endmodule
