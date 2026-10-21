.subckt dut iin out vb1 vb2 vb3 vb4

* Reference-current sensing and NMOS wide-swing cascode bias.
RIN iin vb3 1
RNBIAS vb3 vb4 8k
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=4 nf=1 m=1

* Mirrored reference branch and PMOS wide-swing cascode bias.
XNBIAS nref vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=4 nf=1 m=1
XNCBIAS vb2 vb3 nref 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=4 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3000 L=4 nf=1 m=1
RPBIAS vb1 vb2 8k

* NMOS cascode current sink.
XNOUT nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=4 nf=1 m=1
XNCOUT out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=4 nf=1 m=1

* PMOS cascode current source.
XPOUT psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3000 L=4 nf=1 m=1
XPCOUT out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=3000 L=4 nf=1 m=1

.ends dut
