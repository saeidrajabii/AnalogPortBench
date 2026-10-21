.subckt Bias iref vbp
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
XMPREF vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XMNPSINK vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
.ends Bias

.subckt Opamp_2stg vbn vbp vm vout vp
XMN1 x1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=4 nf=1 m=1
XMN2 x2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=4 nf=1 m=1
XMNT tail vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=4 nf=1 m=1
XMP1 x1 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=4 nf=1 m=1
XMP2 x2 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=4 nf=1 m=1

XMN3 vout x2 0 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=4 nf=1 m=1
XMP3 vout vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=96 L=4 nf=1 m=1

RR0 x2 ncomp 3k
CC0 ncomp vout 500f
.ends Opamp_2stg

.subckt dut iref inp inn out
XBIAS iref vbp Bias
XAMP iref vbp inn out inp Opamp_2stg
.ends dut
