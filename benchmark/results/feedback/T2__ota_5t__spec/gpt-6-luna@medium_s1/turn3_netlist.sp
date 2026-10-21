.subckt Bias_Gen iref ntail
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XMTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1
.ends Bias_Gen

.subckt OTA_5T ntail inp inn out
XMN1 nload inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XMN2 out inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XMP1 nload nload vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1.5 nf=1 m=1
XMP2 out nload vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1.5 nf=1 m=1
.ends OTA_5T

.subckt dut iref inp inn out
XBIAS iref ntail Bias_Gen
XOTA ntail inp inn out OTA_5T
.ends dut
