.subckt dut iref inp inn out
* NMOS reference and mirrored bias currents
XMNREF  iref   iref   0      0      sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMNBIAS pbias  iref   0      0      sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMNTAIL tail   iref   0      0      sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1

* PMOS bias reference and its 2:1 output-current mirror
XMPREF  pbias  pbias  vdd    vdd    sky130_fd_pr__pfet_01v8_lvt W=8  L=0.7 nf=1 m=1
XMPLOAD out    pbias  vdd    vdd    sky130_fd_pr__pfet_01v8_lvt W=16 L=0.7 nf=1 m=1

* NMOS differential input pair and PMOS current-mirror load
XMNINP  n2     inp    tail   0      sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMNINN  n1     inn    tail   0      sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMPDIO  n1     n1     vdd    vdd    sky130_fd_pr__pfet_01v8_lvt W=10 L=0.7 nf=1 m=1
XMPMIR  n2     n1     vdd    vdd    sky130_fd_pr__pfet_01v8_lvt W=10 L=0.7 nf=1 m=1

* Common-source output stage
XMNOUT  out    n2     0      0      sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1

* Miller compensation with series nulling resistor
RZ n2 ncomp 3k
CC ncomp out 3f
.ends dut
