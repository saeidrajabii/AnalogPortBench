.subckt dut iref inp inn out
* Reference-current sink and scaled NMOS bias mirrors
XREF  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XOUTN out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1

* Differential input stage; the input assignment gives positive overall polarity
XMN1 na inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XMN2 nb inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XMP1 na na vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1.5 nf=1 m=1
XMP2 nb na vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1.5 nf=1 m=1

* Second gain stage and Miller compensation
XMPO out nb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1.5 nf=1 m=1
RCOMP nb ncomp 2k
CCOMP ncomp out 0.3p
.ends dut
