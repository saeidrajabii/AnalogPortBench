.subckt dut iin out vb1 vb2 vb3 vb4

* Reference-current sensing and NMOS mirror gate.
XNR iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=400000 L=100 nf=1 m=1
RGN iin vb4 1

* Complementary reference-current mirror.
XNT vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=400000 L=100 nf=1 m=1
XPR vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400000 L=100 nf=1 m=1

* NMOS cascode bias: isolated replica with resistive level shift.
XPNB vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400000 L=100 nf=1 m=1
RNSHIFT vb3 nrep 2.5k
XNRB nrep nrep 0 0 sky130_fd_pr__nfet_01v8_lvt W=400000 L=100 nf=1 m=1

* PMOS cascode bias: isolated replica with resistive level shift.
XNPB vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=400000 L=100 nf=1 m=1
RPSHIFT prep vb2 2.5k
XPRB prep prep vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400000 L=100 nf=1 m=1

* Cascoded output current sink.
XNMAIN nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=400000 L=100 nf=1 m=1
XNCAS out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=40000 L=10 nf=1 m=1

* Cascoded output current source.
XPMAIN psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400000 L=100 nf=1 m=1
XPCAS out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=40000 L=10 nf=1 m=1

.ends dut
