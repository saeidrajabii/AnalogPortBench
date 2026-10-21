.subckt dut iref inp inn out
* Reference-current diode and NMOS bias mirrors
XMNREF nbias nbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* Differential input pair and PMOS current-mirror load
XMNT inp nbias ntail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMN1 x inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMN2 a inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMPT x x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
XMP1 a x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1

* Second stage
XMP2 out a vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1 nf=1 m=1
XMN3 out nbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1

* Miller compensation
RCC a ncc 3k
CCC ncc out 500f
.ends dut
