.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference stack; the input reference current flows through this branch.
RREF iin vb3 1
XMNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=2 nf=1 m=1
XMNCASREF vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=2 nf=1 m=1

* NMOS output cascode sink.
XMNSINK nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=2 nf=1 m=1
XMNCASOUT out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=2 nf=1 m=1

* PMOS reference stack, biased by an NMOS mirror of the reference current.
XMNPSINK vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=2 nf=1 m=1
XMPREFCAS vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=2 nf=1 m=1
XMPREF vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=2 nf=1 m=1

* PMOS output cascode source.
XMPCASOUT psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=2 nf=1 m=1
XMPSOURCE out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=2 nf=1 m=1
.ends dut
