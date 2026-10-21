.subckt dut iref inp inn out
* NMOS reference and mirrored bias currents
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XNTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1
XNB n_b iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XNSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=2 nf=1 m=1

* PMOS bias reference and differential-stage mirror load
XPBIAS n_b n_b vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1
XPLOADL nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1
XPLOADR nright nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1

* Differential input stage; input polarity gives positive overall gain
XNINN nleft inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XNINP nright inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1

* Common-source output stage
XPOUT out nright vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=2 nf=1 m=1

* Miller compensation with series nulling resistor
RZ nright ncomp 1k
CCOMP ncomp out 4p
.ends dut
