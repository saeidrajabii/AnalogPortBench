.subckt Bias iref vbias
XNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=3 nf=1 m=1
.ends Bias

.subckt Opamp_2stg vbias vm vout vp
* Differential input pair and PMOS current-mirror load
XMN1 x1 vp tail 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=3 nf=1 m=1
XMN2 x2 vm tail 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=3 nf=1 m=1
XMNT tail vbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=3 nf=1 m=1
XMP1 x1 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=180 L=3 nf=1 m=1
XMP2 x2 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=180 L=3 nf=1 m=1

* Common-source second stage
XMN3 vout vbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=3 nf=1 m=1
XMP3 vout x2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=150 L=3 nf=1 m=1

* Miller compensation
RR0 x2 ncomp 1k
CC0 ncomp vout 1p
.ends Opamp_2stg

.subckt dut iref inp inn out
XBIAS iref vbias Bias
XAMP vbias inn out inp Opamp_2stg
.ends dut
