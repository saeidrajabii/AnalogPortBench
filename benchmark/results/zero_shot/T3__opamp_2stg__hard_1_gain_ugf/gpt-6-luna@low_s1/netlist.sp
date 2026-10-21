.subckt dut iref inp inn out
* Reference sink and NMOS current mirrors
XMREF iref nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMTAIL ntail nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMBIAS nbias nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1.5 nf=1 m=1

* PMOS bias branch for the second-stage current source
XMPB pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1.5 nf=1 m=1
XMNBIAS pb nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1.5 nf=1 m=1

* First stage: NMOS differential pair with PMOS current-mirror load
XMNI ntail inn nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.0 nf=1 m=1
XMNP ntail inp nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.0 nf=1 m=1
XMP1 nsrc nsrc vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.0 nf=1 m=1
XMP2 x nsrc vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.0 nf=1 m=1

* Second stage and Miller compensation
XMP3 out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1.0 nf=1 m=1
XMN3 out x 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.0 nf=1 m=1
RCOMP x ncomp 3k
CCOMP ncomp out 500f
.ends dut
