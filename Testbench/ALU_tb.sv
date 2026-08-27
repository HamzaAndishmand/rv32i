import defs_pkg::*;
module ALU_tb();
	logic [31:0] srcA, srcB;
	logic [3:0] control;
	logic [31:0] result;
	logic [31:0] expected;
	
	ALU dut(
		.A(srcA),
		.B(srcB),
		.control(control),
		.result(result)
		);

	int pass = 0;
	int fail = 0;
	
	task automatic reset_tally();
		pass = 0;
		fail = 0;
		#10;
	endtask

	logic [31:0] corner_cases[18] = '{
		32'h00000000, 32'hFFFFFFFF, 32'h11111111,
		32'h55555555, 32'h11110000, 32'h80000000, 
		32'h7FFFFFFF, 32'h00000001, 32'hFFFFFFFE, 
		32'hAAAAAAAA, 32'h00000002, 32'h0000000F, 
		32'h0000001F, 32'h00000020, 32'h00000021, 
		32'h0000FFFF, 32'hFFFF0000, 32'h80000001
		};

	logic [3:0] enum_cases[10] = '{
			AND, OR, XOR, SLL, SRL, SRA, SLTU, ADD, SUB, SLT
	};

	function automatic string op(input logic [3:0] c);
		case(c)
			AND: return "AND"; OR: return "OR"; XOR: return "XOR"; SLL: return "SLL"; 
			SRL: return "SRL"; SRA: return "SRA"; SLTU: return "SLTU"; 
			ADD: return "ADD"; SUB: return "SUB"; SLT: return "SLT"; default: return "Null";
		endcase
	endfunction

	task automatic check_corners();
		foreach(enum_cases[k])
			foreach(corner_cases[j]) 
				foreach(corner_cases[i]) begin
					expected = alu_oracle(enum_cases[k], corner_cases[i], corner_cases[j]);	
					srcA = corner_cases[i];
					srcB = corner_cases[j];
					control = enum_cases[k];
					#10;
					if(expected !== result) begin
						$display("Case %d: Expected: %d answer: %d", op(enum_cases[k]), expected, result);
						fail = fail + 1;
					end
					else begin
						if(expected === 32'b?) begin
							$display("Warning! @ Case %d: Expected: %d", op(enum_cases[k]), expected);
						end
						pass = pass + 1;
					end
				end
		$display("Total tests passed: %d", pass);
		$display("Total tests failed: %d", fail);
		$display("check_corners done");
	endtask
	
	task automatic random_num();
		int count = 1000;
		while (count > 0) begin
			for (byte i = 0; i < 10; i++) begin 
		
				control = i[3:0];
				srcA = $random;
				srcB = $random;
				#10;

				expected = alu_oracle(control, srcA, srcB);
				#10;

				if (expected !== result) begin
					$display("Case %d: Expected: %d answer: %d", op(control), expected, result);
					fail = fail + 1;
					count = count -1;
					break;
				end
				else begin
					if(expected === 32'b?) begin
						$display("Warning! @ Case %d: Expected: %d", op(control) ,expected);
					end
					pass = pass + 1;
					count = count - 1;
				end
			end
		end 
		$display("Total tests passed: %d", pass);
		$display("Total tests failed: %d", fail);
		$display("random_num done");
	endtask
	

	function automatic logic [32:0] ripple_carry_adder(logic [31:0] a, logic [31:0] b, logic c_in);
		logic [31:0] sum;
		logic c_out;
		c_out = c_in;
		for(int i = 0; i < 32; i++) begin
			sum[i] = 
				alu_oracle(XOR, 
				alu_oracle(XOR, {{31{1'b0}}, {a[i]}}, {{31{1'b0}}, {b[i]}}), {{31{1'b0}}, {c_out}})[0];
			c_out = 
				alu_oracle(OR, 
				alu_oracle(OR, 
				alu_oracle(AND, {{31{1'b0}}, {a[i]}}, {{31{1'b0}}, {b[i]}}), 
				alu_oracle(AND, {{31{1'b0}}, {a[i]}}, {{31{1'b0}}, {c_out}})), 
				alu_oracle(AND, {{31{1'b0}}, {b[i]}}, {{31{1'b0}}, {c_out}}))[0];
		end
		return {c_out, sum};
	endfunction 

	function automatic logic [31:0] alu_oracle(logic [3:0] c, logic [31:0] a, logic [31:0] b);

		int shamt_int = int'(b[4:0]);
		logic [62:0] sign_sra = { {31{a[31]}}, a};

		case(c)
			AND: 
				for(int i = 0; i < 32; i++) begin
					if(a[i] == 0) begin
						expected[i] = 0;
					end
					else if(b[i] == 0) begin
						expected[i] = 0;
					end
					else begin
						expected[i] = 1;
					end
				end
			OR:
				for(int i = 0; i < 32; i++) begin
					if(a[i] == 1) begin
						expected[i] = 1;
					end
					else if(b[i] == 1) begin
						expected[i] = 1;
					end
					else begin
						expected[i] = 0;
					end
				end
			XOR:
				for(int i = 0; i < 32; i++) begin
					if(a[i] == b[i]) begin 
						expected[i] = 0;
					end
					else begin
						expected[i] = 1;
					end 
				end 
			SLL:
				for(int i = 0; i < 32; i++) begin
					if(i >= shamt_int) begin
						expected[i] = a[i - shamt_int];
					end
					else begin
						expected[i] = 0;
					end 
				end
			SRL: 
				for(int i = 0; i < 32; i++) begin
					if((i + shamt_int) < 32) begin
						expected[i] = a[i + shamt_int];
					end
					else begin
						expected[i] = 0;
					end
				end
			SRA:
				expected = sign_sra[shamt_int +: 32];
			SLTU:
				if (a < b) begin
					expected = 1;
				end 
				else begin
					expected = 0;
				end 
			SLT:
				if ($signed(a) < $signed(b)) begin
					expected = 1;
				end 
				else begin
					expected = 0;
				end
			ADD:
				expected = ripple_carry_adder(a, b, 0)[31:0];
			SUB:
				expected = a - b;
			default: 
				expected = 32'd0;
		endcase 
		return expected;
	endfunction

	initial begin
		random_num();
		reset_tally();
		check_corners();
		$finish;
	end
endmodule
