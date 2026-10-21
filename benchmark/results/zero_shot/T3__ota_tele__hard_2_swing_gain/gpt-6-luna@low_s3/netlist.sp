.subckt dut iref inp inn out
* NMOS reference sink and mirrored bias currents
XREF  iref iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XBP   pb   pb   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XBPB  pb   iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* Differential input pair and PMOS mirror load
XTAIL tail iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XINP  n1   inp  tail 0    sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XINN  n2   inn  tail 0    sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XPL   n2   n2   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XPM  n1   n2   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* Second gain stage and output current source
XOUTN out  n1   0    0    sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XOUTP out  pb   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1

* Miller compensation
CCOMP n1 out 2p
.ends dut
