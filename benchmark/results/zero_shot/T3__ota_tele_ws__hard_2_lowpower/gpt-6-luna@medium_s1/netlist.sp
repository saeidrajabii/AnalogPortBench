.subckt dut iref inp inn out
* 20 uA reference sink and mirrored NMOS bias branches
XMREF  iref iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMNBIAS pb   iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMPREF  pb   pb   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=1

* NMOS differential input pair, nominal tail current 25 uA
XMTAIL  ntail iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XMINP   n1    inp  ntail 0    sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMINN   n2    inn  ntail 0    sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* PMOS current-mirror load
XMPD    n1    n1   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=1.25 L=1 nf=1 m=1
XMPM    n2    n1   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=1.25 L=1 nf=1 m=1

* Second gain stage and Miller compensation
XMPOUT  out   pb   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=2.5 L=1 nf=1 m=1
XMOUT   out   n2   0    0    sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
RZ      n2    ncomp 4k
CC      ncomp out   900f
.ends dut
