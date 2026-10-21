.subckt dut iref inp inn out
* 20 uA reference sink and PMOS mirror-bias generator
XNREF  iref  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=10 L=1.0 nf=1 m=1
XNBIAS pbias iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=10 L=1.0 nf=1 m=1
XPBIAS pbias pbias vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=10 L=1.0 nf=1 m=1

* Input differential pair with PMOS current-mirror load
XNTAIL ns    iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=60 L=1.5 nf=1 m=1
XNINP  n1    inp   ns   0    sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XNINN  nx    inn   ns   0    sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XPLOADD nx    nx    vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XPLOADM n1    nx    vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1

* Second gain stage and its PMOS current-source load
XNSTAGE out   n1    0    0    sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XPSTAGE out   pbias vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=25 L=2.0 nf=1 m=1

* Miller compensation
RCOMP n1 ncomp 1k
CCOMP ncomp out 1.2p

* Weak output common-mode reference for the open-loop operating point
RCM1 vdd vcmref 1meg
RCM2 vcmref 0 1meg
ROUTCM out vcmref 1G
.ends dut
