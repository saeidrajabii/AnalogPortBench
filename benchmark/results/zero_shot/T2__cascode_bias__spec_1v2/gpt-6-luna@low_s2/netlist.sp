.subckt dut iin out vb1 vb2 vb3 vb4
* Reference NMOS: the reference current enters the drain/gate node.
XMNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* NMOS cascode bias stack, weakly fed from VDD.
RNB vdd vb3 10k
XMNB vb3 vb3 vb4 vb4 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMNCAS vb4 iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* PMOS bias stack, weakly fed toward ground.
RPB vb1 0 10k
XMPB vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XMPCAS vb2 vb1 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1

* Cascode output sink and source.
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMP1 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XMP0 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
.ends dut
