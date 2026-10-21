.subckt dut iref inp inn out
  * NMOS reference and mirrored tail current
  XNREF  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
  XNTAIL tail nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=2

  * PMOS reference branch and mirror bias
  XNPSINK pbias nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
  XPREF  pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=2 nf=1 m=1

  * Differential input stage with PMOS mirror load
  XMINN  nl inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
  XMINP  x inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
  XPLOADL nl nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=2 nf=1 m=1
  XPLOADR x nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=2 nf=1 m=1

  * Second gain stage
  XMN2   out x 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=2 nf=1 m=1
  XPOUT  out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1

  * Miller compensation
  RZ x ncomp 1k
  CC ncomp out 700f
.ends dut
