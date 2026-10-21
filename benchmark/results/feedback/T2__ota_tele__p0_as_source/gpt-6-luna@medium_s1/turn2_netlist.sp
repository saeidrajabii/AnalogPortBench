.subckt dut iref inp inn out
XMREF  iref  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XMBIAS pbi   iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XMPREF pbi   pbi   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=40 L=1.5 nf=1 m=1

XTAIL  tail  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=4
XMINP  dpa   inp   tail 0    sky130_fd_pr__nfet_01v8_lvt W=80 L=1.5 nf=1 m=1
XMINN  dpb   inn   tail 0    sky130_fd_pr__nfet_01v8_lvt W=80 L=1.5 nf=1 m=1

XMPD   dpb   dpb   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XMPM   dpa   dpb   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=40 L=1.5 nf=1 m=1

XM2    out   dpa   0    0    sky130_fd_pr__nfet_01v8_lvt W=240 L=1.5 nf=1 m=1
XMP2   out   pbi   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=160 L=1.5 nf=1 m=1

CCOMP  dpa   ncomp 1.1p
RCOMP  ncomp out   1k
.ends dut
