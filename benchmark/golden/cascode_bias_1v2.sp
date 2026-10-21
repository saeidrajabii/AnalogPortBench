* cascode_bias, VDD = 1.2 V
* Verified with benchmark/evaluate.py at all five corners tt ff ss sf fs (27 C, Iref = 20 uA, out swept 0..VDD)
* against circuits/cascode_bias/spec_1v2.yaml (matched range >= 0.64 V = 0.96 V x 1.2/1.8), and with audit_golden.py.
* Design (rev 3): wide-swing (low-voltage) cascode bias on BOTH sides, as in the 1.8 V golden: self-biased NMOS
* reference (R1 = 7.5 kOhm: vb3 cascode gate, vb4 source gate) and PMOS reference fed by a cascoded NMOS copy
* (R2 = 9.5 kOhm: vb1 source gate, vb2 cascode gate); NMOS LV-cascode sink and PMOS LV-cascode source.
* Why: rev 1/2 removed the PMOS cascode (single long PMOS, W/L = 1600/16 or /8, 35-61k um^2) to chase the unscaled
* 0.96 V range limit; with the supply-scaled limit (0.64 V) the full cascode fits again. The PMOS cascode makes the
* reference and output bottom devices see the same Vds, so Isource error drops from -1.3 % to <= 0.24 %, and long
* channels are no longer needed (L = 2, gate area 61,056 -> 8,800 um^2).
* Headroom at Vo = 0.9 V: the PMOS pair shares VDD - 0.9 = 0.3 V; R2 splits it 0.151 / 0.149 V (Vdsat 0.066-0.071 V
* at W/L = 400, weak inversion); the NMOS bottoms sit at 0.128-0.132 V (Vdsat 0.054 V).
* Corners (tt ff ss sf fs): range 0.10..1.06 V = 0.96 V everywhere (limit 0.64, +50 %), mismatch at 0.9 V
* -18..-90 nA (<= 1 uA), Isink +0.19..+0.21 %, Isource -0.24..+0.10 % (<= 10 %), no device in triode,
* min saturation margin 74 mV.
.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS low-voltage cascode reference: vb3 = cascode gate, vb4 = source gate
R0 iin vb3 1
R1 vb3 vb4 7.5k
XN3 vb4 vb3 n1 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=2
XN1 n1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=2
* cascoded NMOS copy feeds the PMOS low-voltage cascode reference: vb1 = source gate, vb2 = cascode gate
XN5 vb2 vb3 n2 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=2
XN4 n2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=2
R2 vb1 vb2 9.5k
XP3 vb1 vb2 p1 vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=8
XP1 p1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=8
* outputs: NMOS LV-cascode sink, PMOS LV-cascode source
XN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=2
XN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=2
XP1O psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=8
XP0O out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=8
.ends dut
