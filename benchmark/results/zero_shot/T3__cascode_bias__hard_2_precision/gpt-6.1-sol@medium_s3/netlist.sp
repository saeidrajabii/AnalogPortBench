.subckt dut iin out vb1 vb2 vb3 vb4

* Reference current enters a diode-connected NMOS drain.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000000 L=1000 nf=1 m=1
RVB4 iin vb4 1

* Mirror the reference current into the PMOS reference branch.
XNTRANSFER vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000000 L=1000 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1000000 L=1000 nf=1 m=1

* NMOS cascode bias: replica VGS plus approximately 210 mV.
XPNBIAS vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1000000 L=1000 nf=1 m=1
RNBIAS vb3 nd 10.5k
XNDIODE nd nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=10000000 L=1000 nf=1 m=1

* PMOS cascode bias: replica gate voltage minus approximately 210 mV.
XP DUMMY DUMMY DUMMY DUMMY sky130_fd_pr__pfet_01v8_lvt W=0.42 L=0.35 nf=1 m=1
XPDIODE pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10000000 L=1000 nf=1 m=1
RPBIAS pd vb2 10.5k
XNPBIAS vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000000 L=1000 nf=1 m=1

* Cascoded output sink.
XNSINK nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=1000000 L=1000 nf=1 m=1
XNCAS out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=10000000 L=1000 nf=1 m=1

* Cascoded output source.
XPSOURCE psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1000000 L=1000 nf=1 m=1
XPCAS out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=10000000 L=1000 nf=1 m=1

.ends dut
