.subckt dut iref inp inn out
* Reference-current mirror and bias generation
XREF  iref  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XTAIL ns    iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=3 L=1.5 nf=1 m=1
XBN   vb_p  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=2 L=1.5 nf=1 m=1
XBP   vb_p  vb_p  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=8 L=1.5 nf=1 m=1

* NMOS differential input pair with PMOS current-mirror load
XMN1 nd1   inn   ns   0    sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1
XMN2 nd2   inp   ns   0    sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1
XMP1 nd1   nd1   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XMP2 nd2   nd1   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1

* Second gain stage
XMN3 out   nd2   0    0    sky130_fd_pr__nfet_01v8_lvt W=3 L=1.5 nf=1 m=1
XMP3 out   vb_p  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1

* Miller compensation
RZ nd2 ncomp 6k
CC ncomp out 500f

* Weak DC references for the high-impedance nodes
RBIAS nd2 vref 100Meg
RLOAD out vref 1Meg
RVT vdd vref 10Meg
RVB vref 0 10Meg
.ends dut
