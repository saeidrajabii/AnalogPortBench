.subckt dut iref inp inn out
* Reference-current NMOS and mirrored bias branches
XMREF   iref iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMNBIAS pbi  iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMPREF  pbi  pbi  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1

* NMOS differential pair and PMOS mirror load
XMTAIL  ntail iref 0     0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMINP   n1    inp  ntail 0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMINN   n2    inn  ntail 0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMPD    n1    n1   vdd   vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XMPM    n2    n1   vdd   vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1

* Second gain stage
XMPOUT  out   pbi  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=1 nf=1 m=1
XMOUT   out   n2   0   0   sky130_fd_pr__nfet_01v8_lvt W=2.5 L=1 nf=1 m=1

* Miller compensation with series nulling resistor
RZ      n2    ncomp 10k
CC      ncomp out   700f
.ends dut
