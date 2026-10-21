.subckt dut iref inp inn out
* NMOS reference and mirrored tail/output-stage sink currents
XMNREF   iref   iref   0      0      sky130_fd_pr__nfet_01v8_lvt W=5  L=1   nf=1 m=1
XMNTail  tail   iref   0      0      sky130_fd_pr__nfet_01v8_lvt W=10 L=1   nf=1 m=1
XMNBIAS  nbias  iref   0      0      sky130_fd_pr__nfet_01v8_lvt W=5  L=1   nf=1 m=1
XMNOUT   out    n1     0      0      sky130_fd_pr__nfet_01v8_lvt W=30 L=1   nf=1 m=1

* Differential input pair and PMOS current-mirror load
XMN1     n1     inp    tail   0      sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XMN2     n2     inn    tail   0      sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XMP1     n1     n2     vdd    vdd    sky130_fd_pr__pfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XMP2     n2     n2     vdd    vdd    sky130_fd_pr__pfet_01v8_lvt W=40 L=1.5 nf=1 m=1

* PMOS bias reference and second-stage load
XMPBIAS  pbias  pbias  vdd    vdd    sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XMPLOAD  out    pbias  vdd    vdd    sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1

* Miller compensation
CCOMP    n1     out    0.8p

.ends dut
