.subckt Bias130 iref vbiasn vbiasp
XNR vbiasn vbiasn 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XNB vbiasp vbiasn 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XPB vbiasp vbiasp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
.ends Bias130

.subckt Opamp130 vbiasn vbiasp inp inn out
* Input differential pair and current-mirror load
XMN1 nleft inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMN2 nright inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNtail ntail vbiasn 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=2
XMP1 nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.7 nf=1 m=1
XMP2 nright nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.7 nf=1 m=1

* Second gain stage
XMN3 out nright 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=2
XMP3 out vbiasp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=0.7 nf=1 m=2

* Miller compensation
RZ nright ncomp 2k
CC ncomp out 1p
.ends Opamp130

.subckt dut iref inp inn out
XBIAS iref vbiasn vbiasp Bias130
XOTA vbiasn vbiasp inp inn out Opamp130
.ends dut
