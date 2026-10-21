.subckt Bias_Gen iref vb_n vb_p
  XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.2 nf=1 m=1
  XNSINK vb_p iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.2 nf=1 m=1
  XPREF vb_p vb_p vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.2 nf=1 m=1
.ends Bias_Gen

.subckt Opamp_2stg vb_n vb_p inp inn out
  * NMOS differential pair with PMOS current-mirror load
  XTAIL ntail vb_n 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.2 nf=1 m=1
  XMN_L nl inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.2 nf=1 m=1
  XMN_R n1 inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.2 nf=1 m=1
  XMP_L nl nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.2 nf=1 m=1
  XMP_R n1 nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.2 nf=1 m=1

  * Common-source second stage
  XMN2 out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1.2 nf=1 m=1
  XMP2 out vb_p vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.2 nf=1 m=1

  * Miller compensation
  RZ n1 nc 2k
  CC nc out 600f
.ends Opamp_2stg

.subckt dut iref inp inn out
  XBIAS iref vb_n vb_p Bias_Gen
  XAMP vb_n vb_p inp inn out Opamp_2stg
.ends dut
