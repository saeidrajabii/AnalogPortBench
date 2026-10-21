.subckt dut iref inp inn out
* Reference-current NMOS mirror
XMR0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMR1 nb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMR2 ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMR3 nstage iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* PMOS bias branch and mirrored second-stage load
XMBP pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMBN pb nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMPLOAD out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* Differential input stage with PMOS current-mirror load
XTAIL tail ntail 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XINN n2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XPL1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XPL2 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* Second gain stage and Miller compensation
XOUT nstage n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XCC n2 out 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.42 L=0.15 nf=1 m=1
.ends dut
