.subckt dut iin out vb1 vb2 vb3 vb4

* NMOS reference and low-headroom cascode bias.
RNB iin vb4 4k
XNR vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8000 L=4 nf=1 m=1
RNG iin vb3 1k

* Mirrored reference drives the PMOS reference branch.
XNT nref vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8000 L=4 nf=1 m=1
XNC vb2 vb3 nref 0 sky130_fd_pr__nfet_01v8_lvt W=8000 L=4 nf=1 m=1
RPB vb1 vb2 4k
XPR vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16000 L=4 nf=1 m=1

* NMOS cascode current sink.
XN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8000 L=4 nf=1 m=1
XN1 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=8000 L=4 nf=1 m=1

* PMOS cascode current source.
XP0 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16000 L=4 nf=1 m=1
XP1 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=16000 L=4 nf=1 m=1

.ends dut
