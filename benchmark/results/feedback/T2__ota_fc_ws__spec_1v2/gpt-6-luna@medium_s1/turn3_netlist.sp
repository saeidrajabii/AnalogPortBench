.subckt dut iref inp inn out
* Reference and PMOS bias mirror
XMNREF  iref  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=24 L=1.2 nf=1 m=1
XMNSINK vbias iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=24 L=1.2 nf=1 m=1
XMPREF  vbias vbias vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=24 L=1.2 nf=1 m=1

* Differential input stage
XMTAIL  ns    iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=40 L=1.2 nf=1 m=1
XMNINN  dref  inn   ns   0    sky130_fd_pr__nfet_01v8_lvt W=60 L=1.2 nf=1 m=1
XMNINP  x     inp   ns   0    sky130_fd_pr__nfet_01v8_lvt W=60 L=1.2 nf=1 m=1

* Long-channel PMOS mirror load
XMPD    dref  dref  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=30 L=2.4 nf=1 m=1
XMPM    x     dref  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=30 L=2.4 nf=1 m=1

* Output stage, with reduced load current and increased pull-down strength
XMNSOUT out   x     0    0    sky130_fd_pr__nfet_01v8_lvt W=60 L=1.2 nf=1 m=1
XMPOUT  out   vbias vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=12 L=1.2 nf=1 m=1

* Compensation
RCOMP x xcomp 1k
CCOMP xcomp out 0.8p
.ends dut
