.subckt dut iref inp inn out
  * NMOS reference and mirrored tail current
  XMREF   iref  iref  0     0 sky130_fd_pr__nfet_01v8_lvt W=10  L=2 nf=1 m=1
  XMTAIL  ntail iref  0     0 sky130_fd_pr__nfet_01v8_lvt W=50  L=2 nf=1 m=1

  * PMOS bias reference, set by a matched NMOS sink
  XMNBIAS pbias iref  0     0 sky130_fd_pr__nfet_01v8_lvt W=10  L=2 nf=1 m=1
  XMPBIAS pbias pbias vdd   vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1

  * Differential input pair and NMOS cascodes
  XMNINN  ndn   inn   ntail 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=8 nf=1 m=1
  XMNINP  ndp   inp   ntail 0 sky130_fd_pr__nfet_01v8_lvt W=400 L=8 nf=1 m=1
  XMNCASN n1    vbcas ndn   0 sky130_fd_pr__nfet_01v8_lvt W=400 L=8 nf=1 m=1
  XMNCASP n2    vbcas ndp   0 sky130_fd_pr__nfet_01v8_lvt W=400 L=8 nf=1 m=1

  * PMOS mirror load
  XMPLOAD1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=8 nf=1 m=1
  XMPLOAD2 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=8 nf=1 m=1

  * Second gain stage
  XMP2 out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=8 nf=1 m=1
  XMN2 out n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=8 nf=1 m=1

  * Cascode bias and Miller compensation
  RVC1 vdd vbcas 1meg
  RVC2 vbcas 0 2meg
  RZ n2 ncomp 1k
  CC ncomp out 3p
.ends dut
