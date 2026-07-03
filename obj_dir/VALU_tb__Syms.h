// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VALU_TB__SYMS_H_
#define VERILATED_VALU_TB__SYMS_H_  // guard

#include "verilated.h"

// INCLUDE MODEL CLASS

#include "VALU_tb.h"

// INCLUDE MODULE CLASSES
#include "VALU_tb___024root.h"

// SYMS CLASS (contains all model state)
class alignas(VL_CACHE_LINE_BYTES) VALU_tb__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    VALU_tb* const __Vm_modelp;
    VlDeleter __Vm_deleter;
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    VALU_tb___024root              TOP;

    // CONSTRUCTORS
    VALU_tb__Syms(VerilatedContext* contextp, const char* namep, VALU_tb* modelp);
    ~VALU_tb__Syms();

    // METHODS
    const char* name() const { return TOP.vlNamep; }
};

#endif  // guard
