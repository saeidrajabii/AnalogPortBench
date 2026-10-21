.subckt dut iin out vb1 vb2 vb3 vb4
* Reference current enters the drain of a diode-connected NMOS.
RREF iin vb4 1
XNREF iin vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

* Generate the PMOS mirror bias.
XNBIAS1 vb1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XPBIAS1 vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1

* Offset the cascode biases to leave output headroom.
RPBIAS vdd pdiode_src 7.5k
XPBIAS2 vb2 vb2 pdiode_src vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XNBIAS2 vb2 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

XPBIAS3 vb3 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XNBIAS3 vb3 vb3 ndiode_src 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
RNBIAS ndiode_src 0 7.5k

* Cascoded current sink and source.
XNOUT0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XNOUT1 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XPOUT0 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XPOUT1 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
.ends dut
