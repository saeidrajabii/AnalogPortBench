.subckt dut iref inp inn out

* Reference-current sink and scaled bias-current mirrors
XMREF   iref   iref   0     0     sky130_fd_pr__nfet_01v8_lvt W=4  L=1.0 nf=1 m=1
XMNTAIL tail   iref   0     0     sky130_fd_pr__nfet_01v8_lvt W=8  L=1.0 nf=1 m=1
XMNBIAS nbias  iref   0     0     sky130_fd_pr__nfet_01v8_lvt W=2  L=1.0 nf=1 m=1

* PMOS bias reference
XMPREF pbias  pbias  vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=8  L=1.0 nf=1 m=1
XMNSINK pbias  nbias  0     0     sky130_fd_pr__nfet_01v8_lvt W=2  L=1.0 nf=1 m=1

* NMOS differential input pair with PMOS current-mirror load
XMNINL nl     inp    tail  0     sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNINR nr     inn    tail  0     sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMPLOADL nl   nl     vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=40 L=1.0 nf=1 m=1
XMPLOADR x    nl     vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=40 L=1.0 nf=1 m=1

* Second gain stage
XMNOUT out    x      0     0     sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XMPOUT out   pbias  vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=12 L=1.0 nf=1 m=1

* Miller compensation
RZ x ncomp 2k
CC ncomp out 600f

.ends dut
