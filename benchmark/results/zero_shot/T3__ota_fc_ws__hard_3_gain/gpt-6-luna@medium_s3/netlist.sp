.subckt dut iref inp inn out
* NMOS reference and 2:1 input-pair tail-current mirror
XMREF   iref    iref    0       0       sky130_fd_pr__nfet_01v8_lvt W=100 L=5 nf=1 m=1
XMTAIL  ntail   iref    0       0       sky130_fd_pr__nfet_01v8_lvt W=200 L=5 nf=1 m=1

* PMOS bias reference, sunk by a copy of the NMOS reference current
XMNBIAS vbiasp  iref    0       0       sky130_fd_pr__nfet_01v8_lvt W=100 L=5 nf=1 m=1
XMPBIAS vbiasp  vbiasp  vdd     vdd     sky130_fd_pr__pfet_01v8_lvt W=50 L=5 nf=1 m=1

* NMOS differential input pair with PMOS current-mirror load
XMNINP  nleft   inp     ntail   0       sky130_fd_pr__nfet_01v8_lvt W=50 L=5 nf=1 m=1
XMNINN  nfirst  inn     ntail   0       sky130_fd_pr__nfet_01v8_lvt W=50 L=5 nf=1 m=1
XMPLOADL nleft  nleft   vdd     vdd     sky130_fd_pr__pfet_01v8_lvt W=50 L=5 nf=1 m=1
XMPLOADR nfirst nleft   vdd     vdd     sky130_fd_pr__pfet_01v8_lvt W=50 L=5 nf=1 m=1

* Second gain stage
XMNGM2  out     nfirst  0       0       sky130_fd_pr__nfet_01v8_lvt W=25 L=5 nf=1 m=1
XMPLOAD2 out    vbiasp  vdd     vdd     sky130_fd_pr__pfet_01v8_lvt W=100 L=5 nf=1 m=1

* Miller compensation
CCOMP   nfirst  ncomp   2p
RCOMP   ncomp   out     3k
.ends dut
