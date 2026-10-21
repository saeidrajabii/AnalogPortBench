.subckt Cascode_Bias Iin Vbias_1 Vbias_2 Vbias_3 Vbias_4
* Reference current enters a diode-connected NMOS drain.
* Resistor drops provide low-headroom cascode gate offsets.
RNBIAS Iin Vbias_4 10k
RVBN Iin Vbias_3 1m

XNREF Vbias_4 Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100000 L=100 nf=1 m=1

* Cascoded reference mirror supplies the PMOS bias branch.
XNLOW nref Vbias_4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100000 L=100 nf=1 m=1
XNCAS Vbias_2 Vbias_3 nref nref sky130_fd_pr__nfet_01v8_lvt W=100000 L=100 nf=1 m=1

XPREF Vbias_1 Vbias_1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100000 L=100 nf=1 m=1
RPBIAS Vbias_1 Vbias_2 10k
.ends Cascode_Bias

.subckt dut iin out vb1 vb2 vb3 vb4
XBIAS iin vb1 vb2 vb3 vb4 Cascode_Bias

XNLOW nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100000 L=100 nf=1 m=1
XNCAS out vb3 nsrc nsrc sky130_fd_pr__nfet_01v8_lvt W=100000 L=100 nf=1 m=1

XPLOW psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100000 L=100 nf=1 m=1
XPCAS out vb2 psrc psrc sky130_fd_pr__pfet_01v8_lvt W=100000 L=100 nf=1 m=1
.ends dut
