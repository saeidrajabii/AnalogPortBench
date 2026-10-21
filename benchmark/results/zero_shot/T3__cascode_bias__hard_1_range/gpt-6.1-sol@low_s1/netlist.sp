.subckt dut iin out vb1 vb2 vb3 vb4

* Primary NMOS reference.
RIN iin vb4 1m
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10000 L=100 nf=1 m=10

* Mirrored reference establishes the PMOS bias.
XNTRANSFER vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10000 L=100 nf=1 m=10
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10000 L=100 nf=1 m=30

* NMOS cascode replica, with nominal source voltage of 0.18 V.
XPBIASN vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10000 L=100 nf=1 m=30
XNREPC vb3 vb3 nrep 0 sky130_fd_pr__nfet_01v8_lvt W=10000 L=100 nf=1 m=1000
RNREP nrep 0 9k

* PMOS cascode replica, with nominal source voltage of 1.02 V.
XNBIASP vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10000 L=100 nf=1 m=10
XPREPC vb2 vb2 prep vdd sky130_fd_pr__pfet_01v8_lvt W=10000 L=100 nf=1 m=3000
RPREP vdd prep 9k

* Output cascode current sink.
XNSINK nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10000 L=100 nf=1 m=10
XNCASC out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=10000 L=100 nf=1 m=1000

* Output cascode current source.
XPSOURCE psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10000 L=100 nf=1 m=30
XPCASC out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=10000 L=100 nf=1 m=3000

.ends dut
