.subckt dut iref inp inn out

* Reference-current sink and scaled tail-current mirror
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1

* NMOS differential input pair
XMN1 d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XMN2 x inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.7 nf=1 m=1

* PMOS current-mirror load
XMP1 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.7 nf=1 m=1
XMP2 x d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.7 nf=1 m=1

* Complementary common-source output stage
XMNO out x 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.7 nf=1 m=1
XMPO out x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.7 nf=1 m=1

* Miller compensation with series nulling resistor
CCOMP x ncomp 300f
RCOMP ncomp out 1k

.ends dut
