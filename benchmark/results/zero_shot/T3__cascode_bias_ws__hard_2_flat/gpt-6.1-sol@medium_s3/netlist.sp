.subckt dut iin out vb1 vb2 vb3 vb4

* Low-overdrive, long-channel wide-swing cascode mirrors.
* Bias dividers draw negligible current compared with the 20 uA reference.

RIN iin vb4 1m
RNBH vdd vb3 12T
RNBL vb3 vb4 1T
RPBH vb1 vb2 1T
RPBL vb2 0 12T

* NMOS reference branch: reference current enters a drain.
XNR1 iin vb3 nref 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=4 nf=1 m=1000
XNR0 nref vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=4 nf=1 m=1000

* Mirrored reference current establishes the PMOS bias.
XNB1 vb1 vb3 nbias 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=4 nf=1 m=1000
XNB0 nbias vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=4 nf=1 m=1000

* PMOS reference cascode branch.
XPR0 pref vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=4 nf=1 m=1000
XPR1 vb1 vb2 pref vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=4 nf=1 m=1000

* Output NMOS cascode sink.
XNO0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=4 nf=1 m=1000
XNO1 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=4 nf=1 m=1000

* Output PMOS cascode source.
XPO0 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=4 nf=1 m=1000
XPO1 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=4 nf=1 m=1000

.ends dut
