.subckt dut iin out vb1 vb2 vb3 vb4

RNBIAS3 iin vb3 1
RNBIAS4 iin vb4 1
RPBIAS2 vb1 vb2 1

* NMOS reference branch.
XNREF_LO nref vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=8 nf=1 m=1000
XNREF_HI iin vb3 nref 0 sky130_fd_pr__nfet_01v8_lvt W=44 L=8 nf=1 m=1000

* Mirrored NMOS branch supplies the PMOS reference.
XNTRANSFER_LO ntransfer vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=8 nf=1 m=1000
XNTRANSFER_HI vb1 vb3 ntransfer 0 sky130_fd_pr__nfet_01v8_lvt W=44 L=8 nf=1 m=1000

* PMOS reference branch.
XPREF_LO pref vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=8 nf=1 m=1000
XPREF_HI vb1 vb2 pref vdd sky130_fd_pr__pfet_01v8_lvt W=44 L=8 nf=1 m=4000

* NMOS output current sink, scaled to correct measured current error.
XNOUT_LO nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=8 nf=1 m=991
XNOUT_HI out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=44 L=8 nf=1 m=991

* PMOS output current source, scaled to correct measured current error.
XPOUT_LO psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=8 nf=1 m=991
XPOUT_HI out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=44 L=8 nf=1 m=3964

.ends dut
