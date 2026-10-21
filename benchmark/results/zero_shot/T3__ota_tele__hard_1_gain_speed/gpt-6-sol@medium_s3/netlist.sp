.subckt dut iref inp inn out
* Reference-current mirror
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XOUTBIAS out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=56 L=2 nf=1 m=1

* NMOS cascode-bias generator
XBIASSINK pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
XBIASSOURCE vcn pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1 nf=1 m=1
XBN1 nb nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XBN2 vcn vcn nb 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* Cascoded differential first stage
XINP xn1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XINN xn2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XNC1 pd vcn xn1 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XNC2 n1 vcn xn2 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XPL1 pt pt vdd vdd sky130_fd_pr__pfet_01v8_lvt W=150 L=1.5 nf=1 m=1
XPL2 pd pd pt vdd sky130_fd_pr__pfet_01v8_lvt W=150 L=1.5 nf=1 m=1
XPR1 pr pt vdd vdd sky130_fd_pr__pfet_01v8_lvt W=150 L=1.5 nf=1 m=1
XPR2 n1 pd pr vdd sky130_fd_pr__pfet_01v8_lvt W=150 L=1.5 nf=1 m=1

* Common-source output stage and Miller compensation
XPOUT out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=2 nf=1 m=1
RZERO n1 cz 2.5k
CCOMP cz out 0.65p
.ends dut
