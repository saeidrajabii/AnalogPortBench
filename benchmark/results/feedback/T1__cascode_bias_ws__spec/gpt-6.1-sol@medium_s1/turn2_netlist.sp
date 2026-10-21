.subckt dut iin out vb1 vb2 vb3 vb4

* Diode-connected NMOS reference.
RIN iin vb4 1
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=8 nf=1 m=200

* Correct the measured PMOS-path current excess.
XNPR vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=8 nf=1 m=168
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=8 nf=1 m=200

* NMOS cascode bias generator.
XPNBIAS vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=8 nf=1 m=200
XNCBIAS vb3 vb3 nshift 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=8 nf=1 m=200
RNSHIFT nshift 0 7.5k

* PMOS cascode bias generator.
XNPBIAS vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=8 nf=1 m=200
XPCBIAS vb2 vb2 pshift vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=8 nf=1 m=200
RPSHIFT vdd pshift 7.5k

* Cascoded NMOS output sink.
XNMAIN nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=8 nf=1 m=200
XNCAS out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=8 nf=1 m=200

* Cascoded PMOS output source.
XPMAIN psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=8 nf=1 m=200
XPCAS out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=8 nf=1 m=200

.ends dut
