.subckt Bias_Gen iref vbias
XMREF vbias vbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
.ends Bias_Gen

.subckt OTA_5T vbias vm vp vout
XMTAIL ntail vbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMVP nload vp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XMVU041C vout vm ntail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XMPD nload nload vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XMPM vout nload vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1
.ends OTA_5T

.subckt dut iref inp inn out
XBIAS iref vbias Bias_Gen
XOTA vbias inn inp out OTA_5T
.ends dut
