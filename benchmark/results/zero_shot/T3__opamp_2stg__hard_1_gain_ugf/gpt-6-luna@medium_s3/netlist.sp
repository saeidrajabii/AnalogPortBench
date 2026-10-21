.subckt Bias iref pbias
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XMBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1
XMPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1
.ends Bias

.subckt OTA inp inn out pbias nref
XMN1 nd inn ns 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.0 nf=1 m=1
XMN2 n1 inp ns 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.0 nf=1 m=1
XMNT ns nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=2
XMP1 nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMP2 n1 nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1

XMNS out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.5 nf=1 m=6
XMPL out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=6

RZ n1 ncomp 1.5k
CC ncomp out 500f
.ends OTA

.subckt dut iref inp inn out
XBIAS iref pbias Bias
XOTA inp inn out pbias iref OTA
.ends dut
