.subckt dut iref inp inn out
* Reference sink; mirrored currents are 7.5 times the reference current.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1.5 nf=1 m=1
XMTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1.5 nf=1 m=1
XMNSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1.5 nf=1 m=1

* NMOS differential pair and PMOS mirror load.
* The input assignment gives the first stage non-inverting polarity.
XMNIN x inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMNFB y inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMPDIODE x x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMPMIRROR y x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1

* Second gain stage and Miller compensation.
XMP2 out y vdd vdd sky130_fd_pr__pfet_01v8_lvt W=35 L=1.5 nf=1 m=1
RZ y ncomp 1.2k
CC ncomp out 1.2p
.ends dut
