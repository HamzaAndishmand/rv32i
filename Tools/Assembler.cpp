#include <iostream>
#include <string>
#include <map>
using namespace std;

struct RTypeCode {
    string funct7;
    string funct3;
};

map<string, RTypeCode> instructionTable = {
    {"add",  {"0000000", "000"}},
    {"sub",  {"0100000", "000"}},
    {"sll",  {"0000000", "001"}},
    {"slt",  {"0000000", "010"}},
    {"sltu", {"0000000", "011"}},
    {"xor",  {"0000000", "100"}},
    {"srl",  {"0000000", "101"}},
    {"sra",  {"0100000", "101"}},
    {"or",   {"0000000", "110"}},
    {"and",  {"0000000", "111"}}
};

