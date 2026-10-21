.subckt dut iref inp inn out
* ---- Bias: reference sink and PMOS current generator ----
* 20 uA reference through diode-connected NMOS (current enters drain, not source)
XMNr iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
* 10 uA sink (ratio 0.5) feeding the diode-connected PMOS
XMNa vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=1 nf=1 m=1
XMPd vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1

* ---- Tail current source: 10 uA ----
XMPt tail vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1

* ---- Stage 1: PMOS differential pair, NMOS mirror load ----
* inp drives the direct branch (output o1), so out is non-inverting w.r.t. inp
XMP1 o1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMP2 d1 inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMNm1 d1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMNm2 o1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1

* ---- Stage 2: NMOS common source with 14 uA PMOS load ----
XMNcs out o1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMPo out vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5.6 L=1 nf=1 m=1

* ---- Miller compensation with nulling resistor ----
RZ o1 zc 10k
CC zc out 0.8p
.ends dut
