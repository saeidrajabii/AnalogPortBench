.subckt dut iin out vb1 vb2 vb3 vb4
* NMOS reference stack; the reference current enters through the drains.
RREF iin vb3 1
XNREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=20
XNCREF vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=20

* PMOS cascode-bias stack, with an NMOS mirror setting its current.
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=1 nf=1 m=20
XPCREF vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=1 nf=1 m=20
XNPMIR vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=20

* NMOS cascode sink.
XNL nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=20
XNU out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=20

* PMOS cascode source.
XPL psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=1 nf=1 m=20
XPU out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=1 nf=1 m=20
.ends dut
