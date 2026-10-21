.subckt dut iin out vb1 vb2 vb3 vb4

* Gate connections; these resistors carry no DC gate current.
RNBIAS3 iin vb3 1
RNBIAS4 iin vb4 1
RPBIAS2 vb1 vb2 1

* NMOS reference self-cascode.
* The reference current enters a drain, not a source.
XNREF_LO nref vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=100 nf=1 m=1000
XNREF_HI iin vb3 nref 0 sky130_fd_pr__nfet_01v8_lvt W=550 L=100 nf=1 m=1000

* Mirrored NMOS branch establishes the PMOS reference current.
XNTRANSFER_LO ntransfer vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=100 nf=1 m=1000
XNTRANSFER_HI vb1 vb3 ntransfer 0 sky130_fd_pr__nfet_01v8_lvt W=550 L=100 nf=1 m=1000

* PMOS reference self-cascode.
XPREF_LO pref vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=100 nf=1 m=1000
XPREF_HI vb1 vb2 pref vdd sky130_fd_pr__pfet_01v8_lvt W=2200 L=100 nf=1 m=1000

* NMOS output current sink.
XNOUT_LO nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=100 nf=1 m=1000
XNOUT_HI out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=550 L=100 nf=1 m=1000

* PMOS output current source.
XPOUT_LO psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=100 nf=1 m=1000
XPOUT_HI out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=2200 L=100 nf=1 m=1000

.ends dut
