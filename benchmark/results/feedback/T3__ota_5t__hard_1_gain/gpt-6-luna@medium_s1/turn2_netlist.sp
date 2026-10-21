.subckt dut iref inp inn out
  * 20 uA NMOS reference and matched differential-pair tail mirror
  XNREF   iref  iref  0      0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
  XNTAIL  ntail iref  0      0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1

  * NMOS differential pair. inp is on the diode-load branch so the
  * single-ended output at the inn branch is non-inverting.
  XNINP   nx    inp   ntail  0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
  XNINN   out   inn   ntail  0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1

  * PMOS current-mirror load
  XPDIODE nx    nx    vdd    vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=2 nf=1 m=1
  XPOUT   out   nx    vdd    vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=2 nf=1 m=1
.ends dut
