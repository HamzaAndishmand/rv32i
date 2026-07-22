package defs_pkg;
	parameter logic [3:0] AND = 4'b0000;
	parameter logic [3:0] OR = 4'b0001;
	parameter logic [3:0] XOR = 4'b0010;
	parameter logic [3:0] NOT = 4'b0011;
	parameter logic [3:0] SLL = 4'b0100;
	parameter logic [3:0] SRL = 4'b0101;
	parameter logic [3:0] SRA = 4'b0110;
	parameter logic [3:0] NAND = 4'b0111;
	parameter logic [3:0] XNOR = 4'b1000;
	parameter logic [3:0] SLTU = 4'b1001;
	parameter logic [3:0] SEQ= 4'b1010;
	parameter logic [3:0] ADD = 4'b1011;
	parameter logic [3:0] SUB = 4'b1100;
	parameter logic [3:0] MULT = 4'b1101;
	parameter logic [3:0] DEV = 4'b1110;
	parameter logic [3:0] NOP = 4'b1111;
endpackage
