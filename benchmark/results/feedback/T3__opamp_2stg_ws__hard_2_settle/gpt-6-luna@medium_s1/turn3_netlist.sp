.subckt dut iref inp inn out
* Reference and mirrored NMOS bias currents
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XMTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XMNSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=90 L=1.5 nf=1 m=1

* Differential input stage with PMOS mirror load
XMNIN x inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2.5 nf=1 m=1
XMNFB y inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2.5 nf=1 m=1
XMPDIODE x x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2.5 nf=1 m=1
XMPMIRROR y x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2.5 nf=1 m=1

* Second gain stage
XMP2 out y vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=2.5 nf=1 m=1

* Miller compensation
RZ y ncomp 1k
CC ncomp out 500f
.ends dut
