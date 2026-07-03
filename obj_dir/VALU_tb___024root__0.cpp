// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VALU_tb.h for the primary calling header

#include "VALU_tb__pch.h"

VlCoroutine VALU_tb___024root___eval_initial__TOP__Vtiming__0(VALU_tb___024root* vlSelf);

void VALU_tb___024root___eval_initial(VALU_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VALU_tb___024root___eval_initial\n"); );
    VALU_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    VALU_tb___024root___eval_initial__TOP__Vtiming__0(vlSelf);
}

VlCoroutine VALU_tb___024root___eval_initial__TOP__Vtiming__0(VALU_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VALU_tb___024root___eval_initial__TOP__Vtiming__0\n"); );
    VALU_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*3:0*/ ALU_tb__DOT__control;
    ALU_tb__DOT__control = 0;
    // Body
    vlSelfRef.ALU_tb__DOT__inputA = 0x0000000cU;
    vlSelfRef.ALU_tb__DOT__inputB = 0x0000000aU;
    ALU_tb__DOT__control = 0U;
    co_await vlSelfRef.__VdlySched.delay(5ULL, nullptr, 
                                         "Testbench/ALU_tb.sv", 
                                         20);
    VL_WRITEF_NX("Result: %d\n",1, '#',32,((8U & (IData)(ALU_tb__DOT__control))
                                            ? ((4U 
                                                & (IData)(ALU_tb__DOT__control))
                                                ? (
                                                   (2U 
                                                    & (IData)(ALU_tb__DOT__control))
                                                    ? 
                                                   (VL_DIV_III(32, vlSelfRef.ALU_tb__DOT__inputA, vlSelfRef.ALU_tb__DOT__inputB) 
                                                    & (- (IData)(
                                                                 (1U 
                                                                  & (~ (IData)(ALU_tb__DOT__control))))))
                                                    : 
                                                   ((1U 
                                                     & (IData)(ALU_tb__DOT__control))
                                                     ? 
                                                    (vlSelfRef.ALU_tb__DOT__inputA 
                                                     * vlSelfRef.ALU_tb__DOT__inputB)
                                                     : 
                                                    (vlSelfRef.ALU_tb__DOT__inputA 
                                                     - vlSelfRef.ALU_tb__DOT__inputB)))
                                                : (
                                                   (2U 
                                                    & (IData)(ALU_tb__DOT__control))
                                                    ? 
                                                   ((1U 
                                                     & (IData)(ALU_tb__DOT__control))
                                                     ? 
                                                    (vlSelfRef.ALU_tb__DOT__inputA 
                                                     + vlSelfRef.ALU_tb__DOT__inputB)
                                                     : 
                                                    (1U 
                                                     & (- (IData)(
                                                                  (vlSelfRef.ALU_tb__DOT__inputA 
                                                                   == vlSelfRef.ALU_tb__DOT__inputB)))))
                                                    : 
                                                   ((1U 
                                                     & (IData)(ALU_tb__DOT__control))
                                                     ? 
                                                    (1U 
                                                     & (- (IData)(
                                                                  (vlSelfRef.ALU_tb__DOT__inputA 
                                                                   > vlSelfRef.ALU_tb__DOT__inputB))))
                                                     : 
                                                    (~ vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0))))
                                            : ((4U 
                                                & (IData)(ALU_tb__DOT__control))
                                                ? (
                                                   (2U 
                                                    & (IData)(ALU_tb__DOT__control))
                                                    ? 
                                                   (~ 
                                                    ((1U 
                                                      & (IData)(ALU_tb__DOT__control))
                                                      ? vlSelfRef.__VdfgRegularize_h6e95ff9d_0_1
                                                      : vlSelfRef.__VdfgRegularize_h6e95ff9d_0_2))
                                                    : 
                                                   ((1U 
                                                     & (IData)(ALU_tb__DOT__control))
                                                     ? 
                                                    VL_SHIFTR_III(32,32,32, vlSelfRef.ALU_tb__DOT__inputA, 1U)
                                                     : 
                                                    VL_SHIFTL_III(32,32,32, vlSelfRef.ALU_tb__DOT__inputA, 1U)))
                                                : (
                                                   (2U 
                                                    & (IData)(ALU_tb__DOT__control))
                                                    ? 
                                                   ((1U 
                                                     & (IData)(ALU_tb__DOT__control))
                                                     ? 
                                                    (~ vlSelfRef.ALU_tb__DOT__inputA)
                                                     : vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0)
                                                    : 
                                                   ((1U 
                                                     & (IData)(ALU_tb__DOT__control))
                                                     ? vlSelfRef.__VdfgRegularize_h6e95ff9d_0_2
                                                     : vlSelfRef.__VdfgRegularize_h6e95ff9d_0_1)))));
    VL_FINISH_MT("Testbench/ALU_tb.sv", 23, "");
    co_return;
}

void VALU_tb___024root___eval_triggers_vec__act(VALU_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VALU_tb___024root___eval_triggers_vec__act\n"); );
    VALU_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VactTriggered[0U] = (QData)((IData)(vlSelfRef.__VdlySched.awaitingCurrentTime()));
}

bool VALU_tb___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VALU_tb___024root___trigger_anySet__act\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        if (in[n]) {
            return (1U);
        }
        n = ((IData)(1U) + n);
    } while ((1U > n));
    return (0U);
}

void VALU_tb___024root___act_sequent__TOP__0(VALU_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VALU_tb___024root___act_sequent__TOP__0\n"); );
    VALU_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0 = (vlSelfRef.ALU_tb__DOT__inputA 
                                                ^ vlSelfRef.ALU_tb__DOT__inputB);
    vlSelfRef.__VdfgRegularize_h6e95ff9d_0_1 = (vlSelfRef.ALU_tb__DOT__inputA 
                                                & vlSelfRef.ALU_tb__DOT__inputB);
    vlSelfRef.__VdfgRegularize_h6e95ff9d_0_2 = (vlSelfRef.ALU_tb__DOT__inputA 
                                                | vlSelfRef.ALU_tb__DOT__inputB);
}

void VALU_tb___024root___eval_act(VALU_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VALU_tb___024root___eval_act\n"); );
    VALU_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VactTriggered[0U])) {
        vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0 = 
            (vlSelfRef.ALU_tb__DOT__inputA ^ vlSelfRef.ALU_tb__DOT__inputB);
        vlSelfRef.__VdfgRegularize_h6e95ff9d_0_1 = 
            (vlSelfRef.ALU_tb__DOT__inputA & vlSelfRef.ALU_tb__DOT__inputB);
        vlSelfRef.__VdfgRegularize_h6e95ff9d_0_2 = 
            (vlSelfRef.ALU_tb__DOT__inputA | vlSelfRef.ALU_tb__DOT__inputB);
    }
}

void VALU_tb___024root___eval_nba(VALU_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VALU_tb___024root___eval_nba\n"); );
    VALU_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VnbaTriggered[0U])) {
        vlSelfRef.__VdfgRegularize_h6e95ff9d_0_0 = 
            (vlSelfRef.ALU_tb__DOT__inputA ^ vlSelfRef.ALU_tb__DOT__inputB);
        vlSelfRef.__VdfgRegularize_h6e95ff9d_0_1 = 
            (vlSelfRef.ALU_tb__DOT__inputA & vlSelfRef.ALU_tb__DOT__inputB);
        vlSelfRef.__VdfgRegularize_h6e95ff9d_0_2 = 
            (vlSelfRef.ALU_tb__DOT__inputA | vlSelfRef.ALU_tb__DOT__inputB);
    }
}

void VALU_tb___024root___timing_resume(VALU_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VALU_tb___024root___timing_resume\n"); );
    VALU_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    if ((1ULL & vlSelfRef.__VactTriggered[0U])) {
        vlSelfRef.__VdlySched.resume();
    }
}

void VALU_tb___024root___trigger_orInto__act_vec_vec(VlUnpacked<QData/*63:0*/, 1> &out, const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VALU_tb___024root___trigger_orInto__act_vec_vec\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        out[n] = (out[n] | in[n]);
        n = ((IData)(1U) + n);
    } while ((0U >= n));
}

#ifdef VL_DEBUG
VL_ATTR_COLD void VALU_tb___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG

bool VALU_tb___024root___eval_phase__act(VALU_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VALU_tb___024root___eval_phase__act\n"); );
    VALU_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VactExecute;
    // Body
    VALU_tb___024root___eval_triggers_vec__act(vlSelf);
    VALU_tb___024root___trigger_orInto__act_vec_vec(vlSelfRef.__VactTriggered, vlSelfRef.__VactTriggeredAcc);
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        VALU_tb___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
    }
#endif
    VALU_tb___024root___trigger_orInto__act_vec_vec(vlSelfRef.__VnbaTriggered, vlSelfRef.__VactTriggered);
    __VactExecute = VALU_tb___024root___trigger_anySet__act(vlSelfRef.__VactTriggered);
    if (__VactExecute) {
        vlSelfRef.__VactTriggeredAcc.fill(0ULL);
        VALU_tb___024root___timing_resume(vlSelf);
        VALU_tb___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool VALU_tb___024root___eval_phase__inact(VALU_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VALU_tb___024root___eval_phase__inact\n"); );
    VALU_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VinactExecute;
    // Body
    __VinactExecute = vlSelfRef.__VdlySched.awaitingZeroDelay();
    if (__VinactExecute) {
        VL_FATAL_MT("Testbench/ALU_tb.sv", 2, "", "ZERODLY: Design Verilated with '--no-sched-zero-delay', but #0 delay executed at runtime");
    }
    return (__VinactExecute);
}

void VALU_tb___024root___trigger_clear__act(VlUnpacked<QData/*63:0*/, 1> &out) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VALU_tb___024root___trigger_clear__act\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        out[n] = 0ULL;
        n = ((IData)(1U) + n);
    } while ((1U > n));
}

bool VALU_tb___024root___eval_phase__nba(VALU_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VALU_tb___024root___eval_phase__nba\n"); );
    VALU_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = VALU_tb___024root___trigger_anySet__act(vlSelfRef.__VnbaTriggered);
    if (__VnbaExecute) {
        VALU_tb___024root___eval_nba(vlSelf);
        VALU_tb___024root___trigger_clear__act(vlSelfRef.__VnbaTriggered);
    }
    return (__VnbaExecute);
}

void VALU_tb___024root___eval(VALU_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VALU_tb___024root___eval\n"); );
    VALU_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __VnbaIterCount;
    // Body
    __VnbaIterCount = 0U;
    do {
        if (VL_UNLIKELY(((0x00002710U < __VnbaIterCount)))) {
#ifdef VL_DEBUG
            VALU_tb___024root___dump_triggers__act(vlSelfRef.__VnbaTriggered, "nba"s);
#endif
            VL_FATAL_MT("Testbench/ALU_tb.sv", 2, "", "DIDNOTCONVERGE: NBA region did not converge after '--converge-limit' of 10000 tries");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        vlSelfRef.__VinactIterCount = 0U;
        do {
            if (VL_UNLIKELY(((0x00002710U < vlSelfRef.__VinactIterCount)))) {
                VL_FATAL_MT("Testbench/ALU_tb.sv", 2, "", "DIDNOTCONVERGE: Inactive region did not converge after '--converge-limit' of 10000 tries");
            }
            vlSelfRef.__VinactIterCount = ((IData)(1U) 
                                           + vlSelfRef.__VinactIterCount);
            vlSelfRef.__VactIterCount = 0U;
            do {
                if (VL_UNLIKELY(((0x00002710U < vlSelfRef.__VactIterCount)))) {
#ifdef VL_DEBUG
                    VALU_tb___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
#endif
                    VL_FATAL_MT("Testbench/ALU_tb.sv", 2, "", "DIDNOTCONVERGE: Active region did not converge after '--converge-limit' of 10000 tries");
                }
                vlSelfRef.__VactIterCount = ((IData)(1U) 
                                             + vlSelfRef.__VactIterCount);
                vlSelfRef.__VactPhaseResult = VALU_tb___024root___eval_phase__act(vlSelf);
            } while (vlSelfRef.__VactPhaseResult);
            vlSelfRef.__VinactPhaseResult = VALU_tb___024root___eval_phase__inact(vlSelf);
        } while (vlSelfRef.__VinactPhaseResult);
        vlSelfRef.__VnbaPhaseResult = VALU_tb___024root___eval_phase__nba(vlSelf);
    } while (vlSelfRef.__VnbaPhaseResult);
}

#ifdef VL_DEBUG
void VALU_tb___024root___eval_debug_assertions(VALU_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    VALU_tb___024root___eval_debug_assertions\n"); );
    VALU_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}
#endif  // VL_DEBUG
