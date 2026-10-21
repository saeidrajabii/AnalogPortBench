.subckt dut iin out vb1 vb2 vb3 vb4
* Reference current flows into the diode-connected NMOS.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=3000 L=100 nf=1 m=1
RNB1 iin vb3 1
RNB2 vb3 vb4 1

* Mirror the reference current into a diode-connected PMOS.
XNBIAS vb1 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=3000 L=100 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3000 L=100 nf=1 m=1
RPB vb1 vb2 1

* Matched PMOS source and NMOS sink at out.
XPSRC out vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3000 L=100 nf=1 m=1
XNSINK out vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=3000 L=100 nf=1 m=1
.ends dut
