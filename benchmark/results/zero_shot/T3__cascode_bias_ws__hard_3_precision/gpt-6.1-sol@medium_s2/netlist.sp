.subckt dut iin out vb1 vb2 vb3 vb4

* Reference-current branch.
* vb4 controls the ground-side NMOS devices.
RBIAS4 iin vb4 1
XNREF0 nref vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=20 nf=1 m=20000
XNREF1 iin vb3 nref nref sky130_fd_pr__nfet_01v8_lvt W=5 L=20 nf=1 m=20000

* Mirrored reference current establishes the PMOS gate bias.
XNTRAN0 ntran vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=20 nf=1 m=20000
XNTRAN1 vb1 vb3 ntran ntran sky130_fd_pr__nfet_01v8_lvt W=5 L=20 nf=1 m=20000
XPREF0 pref vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=20 nf=1 m=20000
XPREF1 vb1 vb2 pref pref sky130_fd_pr__pfet_01v8_lvt W=5 L=20 nf=1 m=20000

* NMOS cascode bias, supplied by a cascoded PMOS mirror.
XPNBIAS0 pnbi vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=20 nf=1 m=20000
XPNBIAS1 vb3 vb2 pnbi pnbi sky130_fd_pr__pfet_01v8_lvt W=5 L=20 nf=1 m=20000
XNBIAS vb3 vb3 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=20 nf=1 m=2500

* PMOS cascode bias, loaded by a cascoded NMOS mirror.
XPBIAS vb2 vb2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=20 nf=1 m=2500
XNPBIAS0 npbi vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=20 nf=1 m=20000
XNPBIAS1 vb2 vb3 npbi npbi sky130_fd_pr__nfet_01v8_lvt W=5 L=20 nf=1 m=20000

* Output cascode current sink and source.
XNOUT0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=20 nf=1 m=20000
XNOUT1 out vb3 nsrc nsrc sky130_fd_pr__nfet_01v8_lvt W=5 L=20 nf=1 m=20000
XPOUT0 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=20 nf=1 m=20000
XPOUT1 out vb2 psrc psrc sky130_fd_pr__pfet_01v8_lvt W=5 L=20 nf=1 m=20000

.ends dut
