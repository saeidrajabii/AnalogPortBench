.subckt dut iref inp inn out
* Reference and bias current mirrors
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1.5 nf=1 m=1
XNPREF vb_p iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1.5 nf=1 m=1
XPPREF vb_p vb_p vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=1.5 nf=1 m=1

* Differential input stage; nominal tail current is 100 uA
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1.5 nf=1 m=5
XINN n1 inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XINP n2 inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XPLOAD1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.5 L=1.5 nf=1 m=1
XPLOAD2 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.5 L=1.5 nf=1 m=1

* Second stage and output current sink
XPOUT out n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XNSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1.5 nf=1 m=4

* Miller compensation
RZ n2 ncomp 1.5k
CC ncomp out 1p
.ends dut
