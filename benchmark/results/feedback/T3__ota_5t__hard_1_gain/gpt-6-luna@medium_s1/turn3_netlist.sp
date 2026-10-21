.subckt dut iref inp inn out
  * Reference and 2.5:1 tail-current mirror
  XNREF  iref  iref  0      0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=1
  XTAIL  ntail iref  0      0 sky130_fd_pr__nfet_01v8_lvt W=250 L=2 nf=1 m=1

  * Differential pair
  XNINP  nx    inp   ntail  0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=10 nf=1 m=1
  XNINN  out   inn   ntail  0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=10 nf=1 m=1

  * PMOS current-mirror load
  XPDIODE nx    nx    vdd    vdd sky130_fd_pr__pfet_01v8_lvt W=625 L=10 nf=1 m=1
  XPOUT   out   nx    vdd    vdd sky130_fd_pr__pfet_01v8_lvt W=625 L=10 nf=1 m=1
.ends dut
