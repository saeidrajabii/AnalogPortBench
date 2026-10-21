.subckt dut iref inp inn out
* Reference-current sink and scaled NMOS bias mirrors
XREF   iref   iref   0      0      sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XTAIL  tail   iref   0      0      sky130_fd_pr__nfet_01v8_lvt W=25 L=1.5 nf=1 m=1
XBN    nbias  iref   0      0      sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1

* PMOS bias mirror for the second stage
XPBD   pbias  pbias  vdd    vdd    sky130_fd_pr__pfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XPBS   pbias  iref   0      0      sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1

* NMOS differential input stage with PMOS mirror load
XMN1   n1     inn    tail   0      sky130_fd_pr__nfet_01v8_lvt W=25 L=2.5 nf=1 m=1
XMN2   n2     inp    tail   0      sky130_fd_pr__nfet_01v8_lvt W=25 L=2.5 nf=1 m=1
XMP1   n1     n1     vdd    vdd    sky130_fd_pr__pfet_01v8_lvt W=25 L=2.5 nf=1 m=1
XMP2   n2     n1     vdd    vdd    sky130_fd_pr__pfet_01v8_lvt W=25 L=2.5 nf=1 m=1

* Common-source second stage
XMN3   out    n2     0      0      sky130_fd_pr__nfet_01v8_lvt W=20 L=2.5 nf=1 m=1
XMP3   out    pbias  vdd    vdd    sky130_fd_pr__pfet_01v8_lvt W=40 L=1.5 nf=1 m=1

* Miller compensation with series nulling resistor
RZ     n2     ncomp  2k
CC     ncomp  out    1.2p
.ends dut
