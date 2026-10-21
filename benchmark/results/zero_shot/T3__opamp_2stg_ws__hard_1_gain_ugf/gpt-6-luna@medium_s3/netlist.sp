.subckt dut iref inp inn out
* Reference and mirrored NMOS bias currents
XMREF   iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
XMITAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=2 nf=1 m=1
XMISINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1

* NMOS input differential pair
XMNINP x inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=5 nf=1 m=1
XMNINN y inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=5 nf=1 m=1

* PMOS mirror load and second-stage current source
XMPD    y y vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=5 nf=1 m=1
XMPMIR  x y vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=5 nf=1 m=1
XMPLOAD out y vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=5 nf=1 m=1

* Miller compensation
RRZ x ncomp 1.5k
CCOMP ncomp out 600f
.ends dut
