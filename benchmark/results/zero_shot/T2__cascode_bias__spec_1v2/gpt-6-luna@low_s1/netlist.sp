.subckt dut iin out vb1 vb2 vb3 vb4

* Reference sink: the reference current reaches the diode-connected NMOS
* through a resistor; it does not flow directly into a transistor source.
RREF iin vb4 1
XMREF vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1

* NMOS cascode-bias branch and output sink.
RNB vdd vb3 30k
XMNB vb3 vb3 vb4 vb4 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XMN0 nsrc vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XMN2 out vb3 nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1

* PMOS cascode-bias branch and output source.
RBP vdd vb1 30k
XMPB vb1 vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=0.5 nf=1 m=1
XMPBC vb2 vb2 vb1 vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=0.5 nf=1 m=1
XMP0 psrc vb1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=0.5 nf=1 m=1
XMP2 out vb2 psrc vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=0.5 nf=1 m=1

.ends dut
