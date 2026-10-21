* opamp_2stg, VDD = 1.8 V
* Verified with benchmark/evaluate.py at all five corners tt ff ss sf fs (27 C, unity-gain follower, VCM = 0.9 V,
* Iref = 20 uA, CL = 1 pF) and with benchmark/golden/audit_golden.py.
* Topology (rev 2, topology change vs the 180 nm source and vs rev 1): PMOS-input telescopic first stage
* (PMOS pair with bulk = tail, PMOS cascodes on vnb) with an NMOS low-voltage cascode mirror load, then an
* NMOS common-source second stage with a PMOS current-source load; Miller Cc = 380 fF with Rz = 3 kOhm.
* Why: rev 1 (NMOS telescopic + PMOS LV-cascode load + PMOS CS stage 2) failed 3/5 corners. Its PMOS LV-cascode
* load needs Vsg(load) >= Vdsat(load) + Vdsat(cascode) + 100 mV, but Sky130 PMOS Vdsat is 0.19-0.24 V, and the
* PMOS CS device (L = 0.5) sat ~0.15 V lower in Vsg than the L = 1 load, which pushed the o1-side cascode into
* triode at ff/fs (gain 61-68 dB) and its cascode tail sat at Vds 0.05-0.09 V. With the polarities flipped the
* mirror is NMOS (Vdsat ~0.09 V, ample room in Vgs ~0.55 V), stage 2 is the faster NMOS, and every device has
* >= 149 mV of saturation margin at every corner.
* Bias: Iref -> NMOS LV-cascode reference (vnb, vnc); a cascoded NMOS copy at Iref/4 -> PMOS diode vpb.
* Currents: tail 25 uA (12.5 uA per side, input pair in weak inversion), stage 2 95 uA; I2 > Itail*(1 + CL/Cc)
* keeps stage 2 out of slewing on the rising edge (rev 1 overshoot 23 %).
* Corners (tt/ff/ss/sf/fs): gain 80.7/79.8/81.2/81.7/77.8 dB (>= 72.71), UGF 76-81 MHz (>= 66.6), PM 68 deg,
* GM 11.9-12.7 dB, power 262-273 uW (<= 296.4), rise/fall settle <= 8.5/8.9 ns (<= 12.24/26.73), overshoot <= 3.7 %.
* Worst margin: dc gain +7.0 % at fs. Gate area ~590 um^2 (rev 1: 1,545).
.subckt dut iref inp inn out
* --- bias: NMOS low-voltage cascode reference (Iref enters vnc): vnb = NMOS source gate, vnc = NMOS cascode gate
R0 iref vnc 1
Rn vnc vnb 15k
XNR3 vnb vnc nr1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XNR1 nr1 vnb 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
* --- bias: cascoded NMOS copy (Iref/4) into the PMOS reference diode vpb
XNS3 vpb vnc ns1 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XNS1 ns1 vnb 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XPR1 vpb vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
* --- stage 1: PMOS tail, PMOS input pair (bulk = tail), PMOS cascodes (gate vnb), NMOS LV-cascode mirror load
XPT tail vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=5
XPI1 ia inp tail tail sky130_fd_pr__pfet_01v8_lvt W=160 L=0.5 nf=1 m=1
XPI2 ib inn tail tail sky130_fd_pr__pfet_01v8_lvt W=160 L=0.5 nf=1 m=1
XPC1 o1 vnb ia ia sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XPC2 d1 vnb ib ib sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XNL3 d1 vnc nl1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XNL1 nl1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XNL4 o1 vnc nl2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XNL2 nl2 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* --- stage 2: NMOS common source + PMOS current-source load; Miller compensation
XN6 out o1 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XP7 out vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=19
Rz o1 cz 3k
Cc cz out 380f
.ends dut
