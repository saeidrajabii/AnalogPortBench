* Wide-swing cascoded mirrors with matched reference/output stacks.
* Candidate port: verification against the supplied SKY130 models is required.
* W and L are in micrometres.

.subckt dut iin out vb1 vb2 vb3 vb4

* NMOS reference stack: the reference current enters a drain.
RNG iin vb4 1
XNR0 nref vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=80000 L=1000 nf=1 m=1
XNR1 iin vb3 nref 0 sky130_fd_pr__nfet_01v8_lvt W=80000 L=1000 nf=1 m=1

* PMOS reference stack, driven by a cascoded NMOS mirror.
XPR0 pref vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=240000 L=1000 nf=1 m=1
XPR1 vb1 vb2 pref vdd sky130_fd_pr__pfet_01v8_lvt W=240000 L=1000 nf=1 m=1
XNP0 npref vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=80000 L=1000 nf=1 m=1
XNP1 vb1 vb3 npref 0 sky130_fd_pr__nfet_01v8_lvt W=80000 L=1000 nf=1 m=1

* NMOS cascode bias, supplied by a cascoded PMOS mirror.
XPBN0 pbn vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=240000 L=1000 nf=1 m=1
XPBN1 vb3 vb2 pbn vdd sky130_fd_pr__pfet_01v8_lvt W=240000 L=1000 nf=1 m=1
XNBIAS vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=8888.888889 L=1000 nf=1 m=1

* PMOS cascode bias, loaded by a cascoded NMOS mirror.
XPBIAS vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=26666.666667 L=1000 nf=1 m=1
XNBP0 nbp vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=80000 L=1000 nf=1 m=1
XNBP1 vb2 vb3 nbp 0 sky130_fd_pr__nfet_01v8_lvt W=80000 L=1000 nf=1 m=1

* Weak startup paths for the coupled cascode-bias generators.
RSN vdd vb3 1T
RSP vb2 0 1T

* Output NMOS cascode current sink.
XNO0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=80000 L=1000 nf=1 m=1
XNO1 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=80000 L=1000 nf=1 m=1

* Output PMOS cascode current source.
XPO0 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=240000 L=1000 nf=1 m=1
XPO1 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=240000 L=1000 nf=1 m=1

.ends dut
