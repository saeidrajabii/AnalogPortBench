.subckt dut iref inp inn out
* Bias: NMOS diode reference at iref (20 uA).
* Tail mirror 3x (60 uA). Bias sink (20 uA) drives a PMOS diode at vbp.
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=3
XMbn vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMbp vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1

* Stage 1: NMOS pair (30 uA per side) with PMOS diode mirror load.
* Wide mirror devices keep nd1 and n1 high enough for the pair to stay saturated.
XM1 nd1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM2 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMp3 nd1 nd1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1
XMp4 n1 nd1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1

* Stage 2: NMOS common source (gate n1) with NMOS cascode, loaded by a PMOS
* current source (240 uA) biased from vbp. The output sits at 0.9 V, so the
* PMOS source is kept near its saturation edge with a wide device.
XMcs x n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XMc out vdd x 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XMpsrc out vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1 nf=1 m=1

* Miller compensation with nulling resistor (Cc from out to n1 via Rz).
Rz n1 cz 2.6k
Cc cz out 0.25p
.ends dut
