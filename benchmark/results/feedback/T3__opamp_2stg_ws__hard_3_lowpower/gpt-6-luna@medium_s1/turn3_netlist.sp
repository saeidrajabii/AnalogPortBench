.subckt Bias iref vbn vbp
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XMNMIR nref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XMPREF nref nref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1
XMNBP vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XMPBP vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1
.ends Bias

.subckt OTA vbn vbp inp inn out
XMTAIL tail vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XMNI d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XMNP d2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1

XMPLD d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1
XMPLM d2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1

XMNS out d2 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XMPS out vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=2 nf=1 m=1

RRZ d2 ncomp 3k
CCOMP ncomp out 500f
.ends OTA

.subckt dut iref inp inn out
XBIAS iref vbn vbp Bias
XOTA vbn vbp inp inn out OTA
.ends dut
