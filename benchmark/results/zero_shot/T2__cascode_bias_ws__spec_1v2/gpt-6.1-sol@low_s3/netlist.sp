.subckt dut iin out vb1 vb2 vb3 vb4

* Reference-current sensing and NMOS mirror bias.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=450 L=3 nf=1 m=1
RB4 iin vb4 1

* Mirrored reference establishes the PMOS mirror bias.
XNTRANSFER vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=450 L=3 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1200 L=3 nf=1 m=1

* Level-shifted NMOS cascode bias.
XPNBIAS vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1200 L=3 nf=1 m=1
XNBIAS vb3 vb3 nbias_src 0 sky130_fd_pr__nfet_01v8_lvt W=450 L=3 nf=1 m=1
RNBIAS nbias_src 0 5k

* Level-shifted PMOS cascode bias.
RPBIAS vdd pbias_src 5k
XPBIAS vb2 vb2 pbias_src vdd sky130_fd_pr__pfet_01v8_lvt W=1200 L=3 nf=1 m=1
XNPBIAS vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=450 L=3 nf=1 m=1

* Cascoded output current sink.
XNSINK nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=450 L=3 nf=1 m=1
XNCAS out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=450 L=3 nf=1 m=1

* Cascoded output current source.
XPSOURCE psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1200 L=3 nf=1 m=1
XPCAS out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=1200 L=3 nf=1 m=1

.ends dut
