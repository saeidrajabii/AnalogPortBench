.subckt Bias iref vbn pbias
XMREF  iref  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=1
XMNB   vbn   iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=1
XMNBIAS pbias iref 0    0    sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=1
XMPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=2 nf=1 m=1
.ends Bias

.subckt OTA vbn pbias inp inn out
XMNTAIL tail vbn 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=1
XMNI   d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
XMNP   d2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1

XMPD d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1
XMPM d2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1

XMNS out d2 0 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=2 nf=1 m=1
XMPL out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=2 nf=1 m=2

RRZ d2 ncomp 3k
CCOMP ncomp out 1p
.ends OTA

.subckt dut iref inp inn out
XBIAS iref vbn pbias Bias
XOTA vbn pbias inp inn out OTA
.ends dut
