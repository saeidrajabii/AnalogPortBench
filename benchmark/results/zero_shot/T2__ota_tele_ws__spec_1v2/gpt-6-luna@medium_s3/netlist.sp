.subckt dut iref inp inn out
* NMOS reference and mirrored tail current
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.5 nf=1 m=1

* PMOS reference branch
XMPREF vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMNPSINK vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1

* First stage: NMOS differential pair with PMOS current-mirror load
XMNP x1 inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XMNN x2 inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XMP1 x1 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XMP2 x2 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1

* Second stage and PMOS current-source load
XMN2 out x2 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1.0 nf=1 m=1
XMP2LOAD out vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=150 L=1.5 nf=1 m=1

* Miller compensation
CCOMP x2 ncomp 1p
RZ ncomp out 1k
.ends dut
