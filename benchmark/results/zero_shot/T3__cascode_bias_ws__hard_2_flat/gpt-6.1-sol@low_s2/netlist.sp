.subckt dut iin out vb1 vb2 vb3 vb4

* NMOS reference and mirror gate.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=100 nf=1 m=50
RNGATE iin vb4 1

* Transfer the reference current to the PMOS mirror.
XNTRANSFER vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=100 nf=1 m=50
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=600 L=100 nf=1 m=50

* NMOS wide-swing cascode bias.
XP NBIAS vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=600 L=100 nf=1 m=50
RNBIAS NBIAS vb3 1
XNCBIAS vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=100 nf=1 m=50

* PMOS wide-swing cascode bias.
XNBTRANSFER vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=100 nf=1 m=50
XPCBIAS vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=150 L=100 nf=1 m=50

* Cascoded current sink.
XNSINK nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=100 nf=1 m=50
XNCAS out vb3 nsrc nsrc sky130_fd_pr__nfet_01v8_lvt W=200 L=100 nf=1 m=50

* Cascoded current source.
XPSOURCE psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=600 L=100 nf=1 m=50
XPCAS out vb2 psrc psrc sky130_fd_pr__pfet_01v8_lvt W=600 L=100 nf=1 m=50

.ends dut
