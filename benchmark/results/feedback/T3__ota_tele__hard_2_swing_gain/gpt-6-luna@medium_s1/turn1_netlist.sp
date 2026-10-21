.subckt dut iref inp inn out
XMREF   iref  iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMBIAS  vbias iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XPBIAS  vbias vbias vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XPOUT   out   vbias vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=12.5 L=1 nf=1 m=1

XMTAIL  ntail iref  0     0     sky130_fd_pr__nfet_01v8_lvt W=7.5 L=1 nf=1 m=1
XMINP   d1    inp   ntail 0     sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XMINN   d2    inn   ntail 0     sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XPLOAD1 d1    d1    vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XPLOAD2 d2    d1    vdd   vdd   sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1

XMOUT   out   d1    0     0     sky130_fd_pr__nfet_01v8_lvt W=20 L=0.7 nf=1 m=1

RCOMP   d1    ncomp 3.3k
CCOMP   ncomp out   0.8p
.ends dut
