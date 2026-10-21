.subckt dut iref inp inn out
* Reference sink and NMOS current mirrors
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMNBIAS nbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* PMOS bias reference, driven by a mirrored reference current
XMNSINK pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* NMOS differential input pair with PMOS current-mirror load
XMNTAIL ntail nbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMND1 nleft inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMND2 nfirst inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMPD1 nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMPD2 nfirst nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Second gain stage and Miller compensation
XMNG out nfirst 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMPG out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=3
RZ nfirst ncomp 3k
CC ncomp out 500f
.ends dut
