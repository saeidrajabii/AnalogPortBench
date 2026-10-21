.subckt dut iref inp inn out

* Reference-current sensing and NMOS bias mirrors
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=2
XM2BIAS n2bias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=2
XM3BIAS n3bias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=3

* PMOS bias branch, set by the mirrored NMOS current
XMNBIAS pbiastap iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=2
XMPBIAS pbiastap pbiastap vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* NMOS differential input pair with PMOS current-mirror load
XM1 nleft inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XM2 nright inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP1 nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP2 nright nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* Second gain stage and PMOS current-source load
XMSTAGE out nright 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMPLOAD out pbiastap vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=2

* Miller compensation
CCOMP nright ncomp 300f
RCOMP ncomp out 2k

.ends dut
