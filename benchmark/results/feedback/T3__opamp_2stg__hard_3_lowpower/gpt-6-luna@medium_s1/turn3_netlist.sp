.subckt dut iref inp inn out
  * NMOS reference and current mirrors
  XNREF  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
  XNTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
  XNPBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1

  * PMOS bias reference and mirrors
  XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=2.5 nf=1 m=1
  XPLOADL nl nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=2.5 nf=1 m=1
  XPLOADR x nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=2.5 nf=1 m=1
  XPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=2.5 nf=1 m=1

  * Differential input stage; x is the first-stage output
  XMINN nl inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2.5 nf=1 m=1
  XMINP x inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2.5 nf=1 m=1

  * Common-source output stage and Miller compensation
  XMNOUT out x 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1
  RZ x ncomp 2k
  CC ncomp out 200f
.ends dut
