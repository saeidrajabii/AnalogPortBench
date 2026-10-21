.subckt dut iref inp inn out
* 20 uA reference branch and PMOS mirror bias
XMNREF  iref  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=8  L=1.2 nf=1 m=1
XMNSINK vbias iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=8  L=1.2 nf=1 m=1
XMPREF  vbias vbias vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=12 L=1.2 nf=1 m=1

* Differential input pair and 100 uA tail-current mirror
XMTAIL  ns    iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=40 L=1.2 nf=1 m=1
XMNINN  dref  inn   ns   0    sky130_fd_pr__nfet_01v8_lvt W=60 L=1.2 nf=1 m=1
XMNINP  x     inp   ns   0    sky130_fd_pr__nfet_01v8_lvt W=60 L=1.2 nf=1 m=1

* First-stage PMOS mirror load
XMPD    dref  dref  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=30 L=1.2 nf=1 m=1
XMPM    x     dref  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=30 L=1.2 nf=1 m=1

* Second gain stage and PMOS current-source load
XMNSOUT out   x     0    0    sky130_fd_pr__nfet_01v8_lvt W=30 L=1.2 nf=1 m=1
XMPOUT  out   vbias vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=30 L=1.2 nf=1 m=1

* Miller compensation with series nulling resistor
RCOMP x xcomp 2k
CCOMP xcomp out 2p
.ends dut
