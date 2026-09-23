module Load_Store (
	input  logic [31:0] alu_result,
	input  logic [2:0]  funct3,
	input  logic [31:0] mem_rdata,
	input  logic [31:0] rs2_data,
	output logic [31:0] mem_addr,
	output logic [31:0] load_data,
	output logic [31:0] mem_wdata,
	output logic [3:0]  mem_wmask
	);

	logic [7:0]  byte_sel;
	logic [15:0] half_sel;

	assign mem_addr = alu_result;

	always_comb begin
		byte_sel = mem_rdata[8*alu_result[1:0] +: 8];
		half_sel = mem_rdata[16*alu_result[1] +: 16];

		case (funct3)
			3'b000: begin
				load_data = {{24{byte_sel[7]}}, byte_sel};
			end
			3'b001: begin
				load_data = {{16{half_sel[15]}}, half_sel};
			end
			3'b010: begin
				load_data = mem_rdata;
			end
			3'b100: begin
				load_data = {24'd0, byte_sel};
			end
			3'b101: begin
				load_data = {16'd0, half_sel};
			end
			default: begin
				load_data = 32'd0;
			end
		endcase
	end

	always_comb begin
		case (funct3)
			3'b000: begin
				mem_wdata = {4{rs2_data[7:0]}};
				mem_wmask = 4'b0001 << alu_result[1:0];
			end
			3'b001: begin
				mem_wdata = {2{rs2_data[15:0]}};
				mem_wmask = 4'b0011 << {alu_result[1], 1'b0};
			end
			3'b010: begin
				mem_wdata = rs2_data;
				mem_wmask = 4'b1111;
			end
			default: begin
				mem_wdata = 32'd0;
				mem_wmask = 4'b0000;
			end
		endcase
	end
endmodule
