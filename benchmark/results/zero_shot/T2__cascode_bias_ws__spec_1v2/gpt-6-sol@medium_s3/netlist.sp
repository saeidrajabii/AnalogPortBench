.subckt dut iin out vb1 vb2 vb3 vb4
* Establish the NMOS reference gate voltage from the 20 uA input current.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=4 nf=1 m=1
RVB4 iin vb4 1

* Mirror the reference current into a diode-connected PMOS.
XNBIAS vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=4 nf=1 m=1
XPREF vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=320 L=4 nf=1 m=1

* Set the cascode gates slightly beyond the mirror gates.
RNTOP vdd vb3 10meg
RNBOT vb3 vb4 1.5meg
RPTOP vb1 vb2 1.5meg
RPBOT vb2 0 10meg

* Cascoded NMOS sink and PMOS source meet at out.
XNSINK nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=4 nf=1 m=1
XNCAS out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=0.5 nf=1 m=1
XPSOURCE psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=320 L=4 nf=1 m=1
XPCAS out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=0.5 nf=1 m=1
.ends dut
