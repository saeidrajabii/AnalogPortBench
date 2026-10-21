.subckt dut iref inp inn out
* Reference-current sink and NMOS bias mirror
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1

* NMOS differential pair and mirrored tail current
XMNT inp nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMNI inn nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMTAIL ntail nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=2
XMN1 n1 inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMN2 n2 inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1

* PMOS current-mirror load for the differential pair
XMP1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XMP2 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1.5 nf=1 m=1

* Second gain stage: PMOS common-source device and NMOS current sink
XMP3 out n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1.5 nf=1 m=1
XMNS out nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=2

* Miller compensation
RCOMP n2 ncomp 2k
CCOMP ncomp out 2p
.ends dut
