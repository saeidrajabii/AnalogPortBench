.subckt dut iref inp inn out
* Reference-current sink and PMOS bias mirror
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.6 nf=1 m=1
XMNPBIAS pbi iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.6 nf=1 m=1
XMPBIAS pbi pbi vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.6 nf=1 m=1

* NMOS differential pair with PMOS current-mirror load
XMNT nsrc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.6 nf=1 m=1
XMNINL nl inn nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.6 nf=1 m=1
XMNINR n1 inp nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.6 nf=1 m=1
XMPD nl nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.6 nf=1 m=1
XMPM n1 nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.6 nf=1 m=1

* Second gain stage and PMOS bias load
XMNS2 out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.2 L=0.6 nf=1 m=1
XMPS2 out pbi vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.6 nf=1 m=1

* Miller compensation
RZ n1 ncomp 10k
CC ncomp out 1.8p
.ends dut
