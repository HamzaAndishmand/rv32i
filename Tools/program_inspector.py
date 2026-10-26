opcode_type = {
    "0110011": "R",
    "0010011": "I",
    "0000011": "I (Load)",
    "1100111": "I (JALR)",
    "0100011": "S",
    "1100011": "B",
    "0110111": "U (LUI)",
    "0010111": "U (AUIPC)",
    "1101111": "J",
}


def bits(instr, upper, lower):
    return instr[31 - upper : 32 - lower]


def main():
    with open("Instructions.txt") as instructions:
        for instr in instructions:
            instr = instr.strip()

            opcode = bits(instr, 6, 0)
            format = opcode_type[opcode]

            if opcode == "0110011":
                funct7 = bits(instr, 31, 25)
                rs2 = bits(instr, 24, 20)
                rs1 = bits(instr, 19, 15)
                funct3 = bits(instr, 14, 12)
                rd = bits(instr, 11, 7)

            print(instr)
            print(f"{format}: {opcode} {rd} {funct3} {rs1} {rs2} {funct7}")
    print(" ")


main()
