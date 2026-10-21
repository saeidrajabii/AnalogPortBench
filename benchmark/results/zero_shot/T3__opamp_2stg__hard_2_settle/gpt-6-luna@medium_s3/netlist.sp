.subckt Bias_Gen iref vbN vbP
  XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
  XNPSINK vbP iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
  XPREF vbP vbP vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=2 nf=1 m=1
.ends Bias_Gen

.subckt Opamp_2stg vbN vbP inp inn out
  XNTAIL ntail vbN 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=2 nf=1 m=1
  XNLEFT nleft inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=2 nf=1 m=1
  XNRIGHT nfirst inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=2 nf=1 m=1

  XPLEFT nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=9 L=2 nf=1 m=1
  XPRIGHT nfirst nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=9 L=2 nf=1 m=1

  XNOUT out nfirst 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=2 nf=1 m=1
  XPOUT out vbP vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=2 nf=1 m=1

  RCOMP nfirst ncomp 1.2k
  CCOMP ncomp out 700f
.ends Opamp_2stg

.subckt dut iref inp inn out
  XBIAS iref vbN vbP Bias_Gen
  XAMP vbN vbP inp inn out Opamp_2stg
.ends dut
