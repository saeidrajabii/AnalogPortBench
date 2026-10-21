.subckt dut iref inp inn out
  * NMOS reference and mirrored tail current
  XNREF   iref   iref   0      0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
  XNTAIL  ntail  iref   0      0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

  * Scaled NMOS sink for the PMOS cascode-bias string
  XNBIAS  nbias  iref   0      0 sky130_fd_pr__nfet_01v8_lvt W=0.5 L=1 nf=1 m=1

  * PMOS diode-connected cascode-bias string
  XPCBIAS pcas   pcas   vdd    vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=1
  XPLBIAS p1     p1     pcas   vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=1
  RNB    p1 nbias 1

  * PMOS-input differential pair
  XMP1   nleft  inn    nsrc   vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
  XMP2   nright inp    nsrc   vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
  XMPT   nsrc   pcas   vdd    vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

  * Cascode PMOS mirror load
  XMPD   nleft  p1     nmid   vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
  XMPCD  nmid   pcas   vdd    vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
  XMPO   out    p1     omid   vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
  XMPCO  omid   pcas   vdd    vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

  * Differential-pair tail connection
  XNT    nsrc   iref   0      0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
  * Output-branch NMOS device
  XMNOUT out    inp    nsrc   0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
.ends dut
