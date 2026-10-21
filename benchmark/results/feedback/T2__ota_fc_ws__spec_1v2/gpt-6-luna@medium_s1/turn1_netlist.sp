.subckt dut iref inp inn out
* NMOS reference and mirrored tail/bias currents
XMNREF  iref iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=8  L=1.2 nf=1 m=1
XMNBIAS vbp  iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=8  L=1.2 nf=1 m=1
XMTAIL  ns   iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=24 L=1.2 nf=1 m=1

* PMOS current reference and first-stage active load
XMPREF  vbp  vbp  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=8  L=1.2 nf=1 m=1
XMPD    dref dref vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=12 L=0.6 nf=1 m=1
XMPM    x    dref vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=12 L=0.6 nf=1 m=1

* NMOS input pair; input polarity is arranged for non-inverting response
XMNINN  dref inn  ns   0    sky130_fd_pr__nfet_01v8_lvt W=24 L=0.6 nf=1 m=1
XMNINP  x    inp  ns   0    sky130_fd_pr__nfet_01v8_lvt W=24 L=0.6 nf=1 m=1

* Second gain stage and its mirrored PMOS load
XMPOUT  out  vbp  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=12 L=1.2 nf=1 m=1
XMNSOUT out  x    0    0    sky130_fd_pr__nfet_01v8_lvt W=60 L=0.6 nf=1 m=1

* Miller compensation
RCOMP x xcomp 1k
CCOMP xcomp out 1.5p
.ends dut
