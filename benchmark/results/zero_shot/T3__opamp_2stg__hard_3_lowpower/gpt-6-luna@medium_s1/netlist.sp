.subckt dut iref inp inn out
  * Reference-current mirrors
  XPREF  iref iref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
  XPBIAS nref iref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
  XMNREF nref nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

  * NMOS differential input stage with PMOS current-mirror load
  XMTAIL tail nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
  XMINN  nl inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1
  XMINP  x inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1
  XPLOADL nl nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=1.5 nf=1 m=1
  XPLOADR x nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=1.5 nf=1 m=1

  * Second gain stage
  XMN2 out x 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=1
  XPOUT out iref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1.5 nf=1 m=1

  * Miller compensation
  RZ x ncomp 1k
  CC ncomp out 500f
.ends dut
