VERILATOR  = verilator
SV_SOURCES = isa_defs_pkg/defs_pkg.sv Modules/ALU.sv 
OBJ_DIR = obj_dir

.PHONY: sim_verilator clean

sim_verilator:
	mkdir -p $(OBJ_DIR)/sv_only
	$(VERILATOR) --binary --timing --sv \
		--top-module ALU_tb \
		$(SV_SOURCES) Testbench/ALU_tb.sv \
		--Mdir $(OBJ_DIR)/sv_only
	./$(OBJ_DIR)/sv_only/VALU_tb
clean:
	rm -rf $(OBJ_DIR)
