module Memory (
	input logic [31:0] address,
	input logic [31:0] wd,
	input logic write,
	input logic read,
	output logic [31:0] rd,
	input logic clk
	);

	logic [31:0] memory [0:1023];

	initial begin
		for(int i =0; i < 1024; i++) begin
			memory[i] = 32'h00000000;
		end
	end 
	
	always @(posedge clk) begin
		memory[address[11:2]] <= (write) ? wd : memory[address[11:2]];
	end
	always_comb begin
		rd = (read) ? memory[address[11:2]] : 32'h00000000;
	end

endmodule
