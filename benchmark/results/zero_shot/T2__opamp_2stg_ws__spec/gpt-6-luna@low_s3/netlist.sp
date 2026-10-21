.subckt Bias iref vbias_n vbias_p
* Reference-current sink and NMOS bias
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
* NMOS current mirror establishes the PMOS bias current
XMNPM vbias_p iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMPREF vbias_p vbias_p vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
* Additional mirror output for the second-stage load
.ends Bias

.subckt Opamp vbias_n vbias_p vm out vp
* NMOS differential pair, PMOS current-mirror load
XMN1 nleft vp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMN2 nright vm ntail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMNTAIL ntail vbias_n 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=2
XMP1 nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP2 nright nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* Second gain stage and Miller compensation
XMNOUT out vbias_n 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=2
XMPOUT out vbias_p vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=2
CCOMP nright out 500f
RCOMP nright nc 3k
.ends Opamp

.subckt dut iref inp inn out
XBIAS iref vbias_n vbias_p Bias
XAMP vbias_n vbias_p inn out inp Opamp
.ends dut
