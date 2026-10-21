.subckt dut iin out vb1 vb2 vb3 vb4
* Reference-current mirror and NMOS cascode sink
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=1
XNBIAS pbias iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=1
XNLOW nsrc iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=1
XNCAS out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=4 nf=1 m=1

* PMOS reference mirror and cascode source
XPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=4 nf=1 m=1
XPTOP psrc pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=4 nf=1 m=1
XPCAS out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=4 nf=1 m=1

* High-resistance cascode-bias divider
R1 vdd vb2 530k
R2 vb2 vb3 140k
R3 vb3 0 530k

* Exposed mirror-gate biases
RVB1 pbias vb1 1
RVB4 iin vb4 1
.ends dut
