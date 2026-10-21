.subckt dut iref inp inn out
* NMOS reference and current mirrors
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XNTB vb_n vb_n 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XNBS vb_n vb_n 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1

* PMOS bias reference, sunk by the reference NMOS
XPBIAS vb_p vb_p vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XNPS vb_p vb_n 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1

* Differential input stage with PMOS current-mirror load
XTAIL tail vb_n 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XINP x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XINN x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XPL1 x1 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XPL2 x2 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1

* Second gain stage and output bias load
XNS2 out x2 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XPS2 out vb_p vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1

* Miller compensation
CCOMP x2 out 2p
.ends dut
