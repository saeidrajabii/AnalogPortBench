.subckt dut iin out vb1 vb2 vb3 vb4

* Reference-current sensing and NMOS mirror gate.
RNG iin vb4 1k
XNREF iin vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=4 nf=1 m=100

* Mirrored reference current establishes the PMOS mirror gate.
XNTRANSFER vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=4 nf=1 m=100
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=4 nf=1 m=300

* NMOS cascode bias: diode-reference voltage plus a current-driven offset.
XPNBIAS vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=4 nf=1 m=300
RNLEVEL vb3 vnref 7.5k
XNDIODE vnref vnref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=4 nf=1 m=100

* PMOS cascode bias: diode-reference voltage minus a current-driven offset.
XPDIODE vpref vpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=4 nf=1 m=300
RPLEVEL vpref vb2 7.5k
XNPBIAS vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=4 nf=1 m=100

* Cascoded output current sink.
XNMAIN nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=4 nf=1 m=100
XNCAS out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=4 nf=1 m=100

* Cascoded output current source.
XPMAIN psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=4 nf=1 m=300
XPCAS out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=4 nf=1 m=300

.ends dut
