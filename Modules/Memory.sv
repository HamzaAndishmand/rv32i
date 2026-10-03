module Memory (
	input logic clk,
	input logic [31:0] address,
	input logic [31:0] wd,
	input logic write,
	input logic read,
	input logic [3:0] wm,
	output logic [31:0] rd
	);

	logic [31:0] memory [0:1023];

	initial begin
		for(int i =0; i < 1024; i++) begin
			memory[i] = 32'h00000000;
		end
	end

	always_ff @(posedge clk) begin
		if (write) begin
			if (wm[0]) begin 
				memory[address[11:2]][7:0] <= wd[7:0]; 
			end
			if (wm[1]) begin 
				memory[address[11:2]][15:8]  <= wd[15:8];
			end
			if (wm[2]) begin 
				memory[address[11:2]][23:16] <= wd[23:16];
			end
			if (wm[3]) begin 
				memory[address[11:2]][31:24] <= wd[31:24];
			end
		end
	end

	always_comb begin
		rd = (read) ? memory[address[11:2]] : 32'h00000000;
	end

endmodule
