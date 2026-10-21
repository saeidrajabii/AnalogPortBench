* ota_tele, hard spec point H4 (ultra low power): circuits/ota_tele/profiles/hard_4_low_power.yaml
* Topology: two stages, no separate bias branches (tails and output sink mirror the Iref diode directly).
*   Stage 1 = NMOS input pair with split tail + source-degeneration resistor Rs, PMOS current-mirror load.
*   Stage 2 = PMOS common source with an AC-coupled class-AB NMOS sink (quasi-floating gate: Rb to the Iref diode
*   for the DC current, Cb from o1 for the signal); Miller Rz + Cc.
* Why: at ~23 uA total (plus Iref), settling inside the 50 ns window is the binding limit. Degeneration raises the
*   slew rate per unit UGF, class AB doubles the output-stage gm and gives push-pull slewing at ~14 uA quiescent;
*   NMOS input keeps the tail saturated at the slow-PMOS corners (a PMOS-input version failed there).
*   Revision (Oct 7): input pair 40 -> 52 um (VGS -8 mV) so the split tails keep >= 51 mV at fs; Rz 6k -> 7.5k
*   (PM 65 -> 69 deg) wins back the rising-edge settling the extra input capacitance cost.
* TT: 51.9 uW (incl. 24 uW of Iref), gain 63.2 dB, UGF 12.5 MHz, PM 69.1 deg, GM 13.5 dB, settle 42.6/44.6 ns,
*   swing 0.853 V, overshoot 1.5 %.
* Corners: passes tt ff ss sf fs (27 C); worst-corner margin +2.8 % (rise settling, fs), min saturation margin
*   51 mV, max overshoot 2.5 %.
* Sized by hand (gm/Id, headroom budget, pole placement), one simulation per change; no automated search.
* Sky130 1.8 V LVT devices, VDD = 1.2 V, VCM = 0.6 V, Iref = 20 uA into iref, CL = 1 pF. NMOS bulks at 0.
.subckt dut iref inp inn out
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=2 nf=1 ad=4.64 as=4.64 pd=32.58 ps=32.58 m=4
XMTA ta iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=2 nf=1 ad=4.64 as=4.64 pd=32.58 ps=32.58 m=1
XMTB tb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=2 nf=1 ad=4.64 as=4.64 pd=32.58 ps=32.58 m=1
XM1 x1 inn ta 0 sky130_fd_pr__nfet_01v8_lvt W=52 L=1.5 nf=1 ad=15.08 as=15.08 pd=104.6 ps=104.6 m=1
XM2 o1 inp tb 0 sky130_fd_pr__nfet_01v8_lvt W=52 L=1.5 nf=1 ad=15.08 as=15.08 pd=104.6 ps=104.6 m=1
XM3 x1 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.5 nf=1 ad=6.96 as=6.96 pd=48.58 ps=48.58 m=1
XM4 o1 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.5 nf=1 ad=6.96 as=6.96 pd=48.58 ps=48.58 m=1
XM5 out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=64 L=1 nf=1 ad=18.56 as=18.56 pd=128.58 ps=128.58 m=1
XM6 out g6 0 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1 nf=1 ad=10.44 as=10.44 pd=72.58 ps=72.58 m=1
Rs ta tb 10k
Rb iref g6 2Meg
Cb o1 g6 1p
Rz o1 cz 7.5k
Cc cz out 0.8p
.ends dut
