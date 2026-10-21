.subckt dut iref inp inn out
* 20 uA reference and scaled NMOS sink for the PMOS bias diode
XREF   iref  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XBIASN vb_p  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=2 L=1.5 nf=1 m=1
XBIASP vb_p  vb_p  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1

* PMOS differential pair and NMOS mirror load
XTAIL  tail  vb_p  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMP1   nd1   inn   tail vdd  sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMP2   nd2   inp   tail vdd  sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMN1   nd1   nd1   0    0    sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XMN2   nd2   nd1   0    0    sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1

* Second gain stage
XMN3   out   nd2   0    0    sky130_fd_pr__nfet_01v8_lvt W=5 L=1.5 nf=1 m=1
XMP3   out   vb_p  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1

* Miller compensation
RZ     nd2   ncomp 20k
CC     ncomp out   400f

* Weak DC bias for the first-stage output
RBIASH nd2   vdd   1G
RBIASL nd2   0     1G
.ends dut
