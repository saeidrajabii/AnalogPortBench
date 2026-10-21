.subckt Cascode_Bias Iin Vbias
  XMREF nref nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
  XMOUT Vbias nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1
.ends Cascode_Bias

.subckt OTA_5T Vbiasn vm vout vp
  XMN2 net9 vp net10 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
  XMN1 vout vm net10 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
  XMNT net10 Vbiasn 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1
  XMP0 vout net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
  XMP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
.ends OTA_5T

.subckt dut iref inp inn out
  XI0 iref vb4 Cascode_Bias
  XI1 vb4 inn out inp OTA_5T
.ends dut
