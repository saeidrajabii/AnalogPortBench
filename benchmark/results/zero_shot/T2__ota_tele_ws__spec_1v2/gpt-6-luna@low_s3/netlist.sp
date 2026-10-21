.subckt dut iref inp inn out
* Reference sink and NMOS bias mirror
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMNTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1

* Generate a PMOS bias from the reference current
XMNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1

* Differential input pair and PMOS current-mirror load
XMNI n1 inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMNN n2 inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMPD n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMPM n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Second gain stage and output load device
XMOUT out n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* Miller compensation
CCOMP n2 out 1p
.ends dut
