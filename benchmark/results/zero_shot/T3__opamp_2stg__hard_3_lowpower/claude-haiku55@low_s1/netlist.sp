.subckt dut iref inp inn out
* ---- Bias generation (cascode bias, reference mirrored via drain of MN3) ----
RR_ref iref vb3 1
XMN1 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
XMN3 vb3 vb3 vb4 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1

* ---- Two-stage Miller opamp ----
CC0 net012 out 500f
RR0 net08 net012 3k
* Output PMOS (ratio 3 to the mirror reference)
XMP2 out net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.5 nf=1 m=3
* Active load mirror
XMP0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.5 nf=1 m=1
XMP1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.5 nf=1 m=1
* Output stage NMOS (cascode MN5 over current source MN4)
XMN5 out vb3 net1 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=3
XMN4 net1 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=3
* Differential pair
XMN2 net9 inn net10 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
XMN1d net08 inp net10 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
* Tail: cascode MN0 over current source MN3d (ratio 2)
XMN0 net10 vb3 net12 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=2
XMN3d net12 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=2
.ends dut
