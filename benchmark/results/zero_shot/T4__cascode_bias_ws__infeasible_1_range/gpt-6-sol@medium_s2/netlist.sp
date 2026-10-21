.subckt dut iin out vb1 vb2 vb3 vb4
* The input current establishes the NMOS mirror bias.
XNREF iin iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=4 nf=1 m=100
XNBIAS pg iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=4 nf=1 m=100
XNSINK out iin 0 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=4 nf=1 m=100

* The mirrored current establishes the PMOS mirror bias.
XPREF pg pg vdd vdd sky130_fd_pr__pfet_01v8_lvt W=96 L=4 nf=1 m=100
XPSOURCE out pg vdd vdd sky130_fd_pr__pfet_01v8_lvt W=96 L=4 nf=1 m=100

RVB1 vb1 pg 1m
RVB2 vb2 pg 1m
RVB3 vb3 iin 1m
RVB4 vb4 iin 1m
.ends dut
