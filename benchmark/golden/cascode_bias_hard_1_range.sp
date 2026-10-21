* cascode_bias, hard spec point hard_1_range (circuits/cascode_bias/profiles/hard_1_range.yaml), VDD = 1.2 V
* Topology: same as cascode_bias_1v2.sp (wide-swing / low-voltage cascode bias on both sides): self-biased NMOS
* LV-cascode reference (R1: vb3 cascode gate, vb4 source gate), cascoded NMOS copy feeding a self-biased PMOS LV-cascode
* reference (R2: vb1 source gate, vb2 cascode gate), NMOS LV-cascode sink and PMOS LV-cascode source.
* Why (widest matched range): the range ends where a stack loses 5 % of its current. For a weak-inversion stack with
* fixed gates I(V)/Isat = 1 - exp(-V/Vt) whatever the cascode bias, so the ends approach Vt*ln(20) = 78 mV from each rail
* only if (a) all devices are in deep weak inversion and (b) there is no DIBL. Changes vs the 1v2 golden:
*   NMOS W/L 50 -> 800 (W=100 L=2 m=16; Vdsat 0.054 -> 0.039 V): low end 0.10 -> 0.08 V (0.92 uA at 0.08 V, the
*     ideal-WI value is 0.90 uA, so the NMOS side is at the physical limit);
*   PMOS W/L 400 -> 800 at L = 8 (W=100 L=8 m=64): the PMOS high end was DIBL-limited (5.4 % low at Vsd 0.10 V with
*     L = 2-4); L = 8 cuts DIBL, high end 1.06 -> 1.10 V;
*   R1 7.5k -> 6.4k, R2 9.5k -> 7.5k: bottom devices at Vds 0.11-0.12 V (69-76 mV saturation margin) so their Vds
*     moves less when the cascode drops out (less DIBL change).
* Cost: Isink error +0.32 % (bottoms close to the WI saturation edge: a 5 mV reference/output Vds difference matters),
* gate area 224,000 um^2 (PMOS dominates; 70 % of it buys the last 0.01-0.02 V of range).
* Distance to the physical bound: 1.2 - 2*Vt*ln(20) = 1.045 V; this design 1.02 V (|i| at 0.08 V: 0.92 uA, at
* 1.11 V: 1.09 uA, so 1.03 V would need both ends within 2.0 uA in total; they sum to 2.01 uA).
* Results (tt ff ss sf fs): range 0.08-1.10 V = 1.02 V at every corner (limit 0.97); mismatch at 0.9 V -33.2 / -21.2 /
* -44.6 / -52.6 / -10.0 nA (limit 60); Isink +0.32 / +0.34 / +0.30 / +0.34 / +0.30 %, Isource +0.15 / +0.23 / +0.08 /
* +0.08 / +0.25 % (limit 0.4); no device in triode; min saturation margin 69 / 68 / 69 / 69 / 66 mV.
* TT margins: range +5.2 %, mismatch +45 %, Isink +20 %.
.subckt dut iin out vb1 vb2 vb3 vb4
R0 iin vb3 1
R1 vb3 vb4 6.4k
XN3 vb4 vb3 n1 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=16
XN1 n1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=16
XN5 vb2 vb3 n2 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=16
XN4 n2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=16
R2 vb1 vb2 7.5k
XP3 vb1 vb2 p1 vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=8 nf=1 m=64
XP1 p1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=8 nf=1 m=64
XN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=16
XN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=16
XP1O psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=8 nf=1 m=64
XP0O out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=8 nf=1 m=64
.ends dut
