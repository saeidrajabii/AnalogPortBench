.subckt Bias_Generator iref vbiasn
RREF iref nref 1
XMREF nref nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMTAIL ntail vbiasn 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
.ends Bias_Generator

.subckt OTA_5T vbiasn inp inn out
XM1 out inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XM2 nx inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XMT ntail vbiasn 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMP1 out nx vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.5 nf=1 m=1
XMP2 nx nx vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.5 nf=1 m=1
.ends OTA_5T

.subckt dut iref inp inn out
XBIAS iref vbiasn Bias_Generator
XOTA vbiasn inp inn out OTA_5T
.ends dut
