.subckt Bias iref vbias_n vbias_p vbias_c
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMNBIAS vbias_p iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMPBIAS vbias_p vbias_p vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1.5 nf=1 m=1
RBC1 vbias_c vdd 180k
RBC2 vbias_c 0 1Meg
.ends Bias

.subckt Opamp vbias_n vbias_p vbias_c inp inn out
* Differential input pair and NMOS cascodes
XMN1 n1 inp ns 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.5 nf=1 m=1
XMN2 n2 inn ns 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.5 nf=1 m=1
XMNC1 n1 vbias_c nc1 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=1
XMNC2 n2 vbias_c nc2 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=1
XMNT ns vbias_n 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1

* PMOS current-mirror load
XMP1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1.5 nf=1 m=1
XMP2 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1.5 nf=1 m=1

* Second gain stage
XMN3 out n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
XMP3 out vbias_p vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1.5 nf=1 m=3

* Miller compensation
CCOMP nc out 900f
RCOMP n2 nc 2k
.ends Opamp

.subckt dut iref inp inn out
XBIAS iref vbias_n vbias_p vbias_c Bias
XAMP vbias_n vbias_p vbias_c inp inn out Opamp
.ends dut
