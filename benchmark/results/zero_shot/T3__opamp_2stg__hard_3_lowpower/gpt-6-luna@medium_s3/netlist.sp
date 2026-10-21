.subckt dut iref inp inn out
  * Reference-current mirrors
  XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
  XNPBIAS npbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
  XPBIAS npbias npbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=1

  * Input-stage tail current
  XNTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1 nf=1 m=1

  * Differential input pair; inn is on the diode-connected load side
  XNINN n1 inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
  XNINP n2 inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
  XPMLOAD1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=1 nf=1 m=1
  XPMLOAD2 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=1 nf=1 m=1

  * Second stage
  XNOUT out n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
  XPOUT out npbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1 nf=1 m=1

  * Miller compensation
  RZ n2 ncomp 2.2k
  CC ncomp out 700f
  RLEAK ncomp out 1G
.ends dut
