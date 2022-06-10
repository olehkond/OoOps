

TARGETS = addi_instr_only.mem \
          alu_instr_only.mem \
		  one_of_every_instr.mem \
		  reg_reg_instr.mem \
		  basic_branch_test.mem \
		  interweave_instr_types.mem \
		  for_loop.mem \
		  basic_for_loop.mem \
		  bubble_sort.mem \
          alu_instr_OOO_test_1.mem \
          alu_instr_OOO_test_2.mem \
          alu_instr_OOO_test_3.mem \
		  shift_loop.mem \
		  fibonacci.mem


all: $(TARGETS)

addi_instr_only.mem: asm_gen/addi_instr_only.txt
	python3 ./asm_gen/convert_asm_file.py -i asm_gen/addi_instr_only.txt -o $@


alu_instr_only.mem: asm_gen/alu_instr_only.txt
	python3 ./asm_gen/convert_asm_file.py -i asm_gen/alu_instr_only.txt -o $@

alu_instr_OOO_test_1.mem: asm_gen/alu_instr_OOO_test_1.txt
	python3 ./asm_gen/convert_asm_file.py -i asm_gen/alu_instr_OOO_test_1.txt -o $@

alu_instr_OOO_test_2.mem: asm_gen/alu_instr_OOO_test_2.txt
	python3 ./asm_gen/convert_asm_file.py -i asm_gen/alu_instr_OOO_test_2.txt -o $@

alu_instr_OOO_test_3.mem: asm_gen/alu_instr_OOO_test_3.txt
	python3 ./asm_gen/convert_asm_file.py -i asm_gen/alu_instr_OOO_test_3.txt -o $@

one_of_every_instr.mem: asm_gen/one_of_every_instr.txt
	python3 ./asm_gen/convert_asm_file.py -i asm_gen/one_of_every_instr.txt -o $@

reg_reg_instr.mem: asm_gen/reg_reg_instr.txt
	python3 ./asm_gen/convert_asm_file.py -i asm_gen/reg_reg_instr.txt -o $@

interweave_instr_types.mem: asm_gen/interweave_instr_types.txt
	python3 ./asm_gen/convert_asm_file.py -i asm_gen/interweave_instr_types.txt -o $@

shift_loop.mem: asm_gen/shift_loop.txt
	python3 ./asm_gen/convert_asm_file.py -i asm_gen/shift_loop.txt -o $@

basic_branch_test.mem: asm_gen/basic_branch_test.txt
	python3 ./asm_gen/convert_asm_file.py -i asm_gen/basic_branch_test.txt -o $@

for_loop.mem: asm_gen/for_loop.txt
	python3 ./asm_gen/convert_asm_file.py -i asm_gen/for_loop.txt -o $@

basic_for_loop.mem: asm_gen/basic_for_loop.txt
	python3 ./asm_gen/convert_asm_file.py -i asm_gen/basic_for_loop.txt -o $@

bubble_sort.mem: asm_gen/bubble_sort.txt
	python3 ./asm_gen/convert_asm_file.py -i asm_gen/bubble_sort.txt -o $@

fibonacci.mem: asm_gen/fibonacci.txt
	python3 ./asm_gen/convert_asm_file.py -i asm_gen/fibonacci.txt -o $@

.PHONY: clean

clean:
	rm *.mem
