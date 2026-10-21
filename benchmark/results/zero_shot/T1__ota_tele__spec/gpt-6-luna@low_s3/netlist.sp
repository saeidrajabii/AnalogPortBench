.subckt dut iref inp inn out
* NMOS reference sink and mirrored bias currents
XMNREF nref nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMNTAIL tail nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=2
XMNBIAS nbias nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* PMOS bias reference, biased by the NMOS mirror
XMPBIAS pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMNPSINK pb nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* Differential input stage with PMOS current-mirror load
XMN1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMN2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMP1 x1 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP2 x2 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* Second gain stage and its PMOS bias load
XMNOUT out x2 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XMPLOAD out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Miller compensation
CCOMP x2 out 2p
.ends dut
