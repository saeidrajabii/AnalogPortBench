.subckt dut iin out vb1 vb2 vb3 vb4
* The reference current flows through the NMOS cascode reference branch.
RNB iin vb3 1
RN1 vb3 vb4 300meg
RN2 vb4 0 900meg
XNREFC vb3 vb3 nref 0 sky130_fd_pr__nfet_01v8_lvt W=300 L=2 nf=1 m=1
XNREFB nref vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=300 L=3 nf=1 m=1

* A second NMOS branch establishes the PMOS reference current.
XNPC vb1 vb3 npmid 0 sky130_fd_pr__nfet_01v8_lvt W=300 L=2 nf=1 m=1
XNPB npmid vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=300 L=3 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1200 L=3 nf=1 m=1
RP1 vb1 vb2 300meg
RP2 vb2 0 1700meg

* Cascode current sink and source meet at out.
XNS out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=300 L=2 nf=1 m=1
XNB nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=300 L=3 nf=1 m=1
XPS out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=350 L=1 nf=1 m=1
XPB psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1200 L=3 nf=1 m=1
.ends dut
