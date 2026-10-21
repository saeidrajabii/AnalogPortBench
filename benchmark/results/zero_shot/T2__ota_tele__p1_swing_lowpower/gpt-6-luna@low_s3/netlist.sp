.subckt dut iref inp inn out

* Reference-current sink and mirrored tail current
XREF   iref iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XTAIL  tail iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* NMOS differential pair and PMOS current-mirror load
XM1    d1   inp  tail 0    sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM2    d2   inn  tail 0    sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM3    d1   d1   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XM4    d2   d1   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* PMOS bias branch and mirrored second-stage load
XBIASN vb   iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XBIASP vb   vb   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XLOAD  out  vb   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* Second gain stage and Miller compensation
XOUT   out  d2   0    0    sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
CCOMP  d2   out  2p

.ends dut
