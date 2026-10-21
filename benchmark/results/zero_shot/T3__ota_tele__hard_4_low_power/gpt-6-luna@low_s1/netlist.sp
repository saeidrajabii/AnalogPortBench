.subckt dut iref inp inn out
* Reference sink and scaled NMOS current mirrors
XREF   iref   iref   0      0      sky130_fd_pr__nfet_01v8_lvt W=2    L=0.5 nf=1 m=1
XTAIL  tail   iref   0      0      sky130_fd_pr__nfet_01v8_lvt W=1    L=0.5 nf=1 m=1

* PMOS bias branch; its current is set by a scaled reference mirror
XNB    vbp    iref   0      0      sky130_fd_pr__nfet_01v8_lvt W=0.2  L=0.5 nf=1 m=1
XPBD   vbp    vbp    vdd    vdd    sky130_fd_pr__pfet_01v8_lvt W=0.42 L=0.7 nf=1 m=1

* Differential input pair and PMOS mirror load
XINP   d1     inp    tail   0      sky130_fd_pr__nfet_01v8_lvt W=6    L=0.5 nf=1 m=1
XINN   n1     inn    tail   0      sky130_fd_pr__nfet_01v8_lvt W=6    L=0.5 nf=1 m=1
XPLD   d1     d1     vdd    vdd    sky130_fd_pr__pfet_01v8_lvt W=4    L=0.7 nf=1 m=1
XPLM   n1     d1     vdd    vdd    sky130_fd_pr__pfet_01v8_lvt W=4    L=0.7 nf=1 m=1

* Second gain stage
XOUTN  out    n1     0      0      sky130_fd_pr__nfet_01v8_lvt W=12   L=0.5 nf=1 m=1
XOUTP  out    vbp    vdd    vdd    sky130_fd_pr__pfet_01v8_lvt W=0.42 L=0.7 nf=1 m=1

* Miller compensation
CCOMP  n1     out    2p
.ends dut
