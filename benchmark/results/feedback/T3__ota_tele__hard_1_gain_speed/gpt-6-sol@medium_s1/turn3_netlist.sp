.subckt dut iref inp inn out
* Mirror the 20 uA reference; reduce tail current for headroom.
XBN iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1
XBT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=1

* Bias the second-stage PMOS current source.
XBPNS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1
XBPP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=3 nf=1 m=1

* Differential input stage with a current-mirror load.
XIN1 nd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=140 L=1.2 nf=1 m=1
XIN2 x inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=140 L=1.2 nf=1 m=1
XPL1 nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=5 nf=1 m=1
XPL2 x nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=45 L=5 nf=1 m=1

* High-output-resistance second stage with lead-compensated Miller feedback.
XOUTN out x 0 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=3 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=6 nf=1 m=1
RCOMP x xc 1.2k
CCOMP xc out 0.65p
.ends dut
