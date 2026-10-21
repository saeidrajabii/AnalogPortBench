.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference mirror and cascode-bias branch.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XNBIAS_B nmid iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XNBIAS_C vb3 vb3 nmid 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.35 nf=1 m=1

* PMOS reference stack, supplied by an NMOS current-mirror branch.
XNLOAD vb2 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XPBIAS_B vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XPBIAS_C vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.35 nf=1 m=1

* Output current sink and source.
XNOUT_B nsrc iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XNOUT_C out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.35 nf=1 m=1
XPOUT_B psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XPOUT_C out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.35 nf=1 m=1

* Fourth bias output: the NMOS reference gate voltage.
RVB4 vb4 iin 1
.ends dut
