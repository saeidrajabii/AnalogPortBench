.subckt dut iin out vb1 vb2 vb3 vb4

* NMOS reference: reference current enters the drain.
RIN iin vb4 1
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=10 nf=1 m=400

* Mirror the reference current to establish the PMOS gate bias.
XNPREF vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=10 nf=1 m=400
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=10 nf=1 m=1200

* Source-degenerated reference branches generate low-headroom
* cascode gate biases. Both branches receive mirrored current.
XPNBIAS vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=10 nf=1 m=1200
XNBIAS vb3 vb3 nref_src 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=10 nf=1 m=400
RNBIAS nref_src 0 1.5k

XNPBIAS vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=10 nf=1 m=400
XPBIAS vb2 vb2 pref_src vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=10 nf=1 m=1200
RPBIAS vdd pref_src 1.5k

* NMOS cascode current sink.
XNSINK nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=10 nf=1 m=400
XNCAS out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=10 nf=1 m=400

* PMOS cascode current source.
XPSOURCE psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=10 nf=1 m=1200
XPCAS out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=10 nf=1 m=1200

.ends dut
