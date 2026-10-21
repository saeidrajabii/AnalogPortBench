.subckt dut iref inp inn out
* Reference-current sink and mirrored tail-current source
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMNTAIL net10 iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* Differential input pair
XMNN inn inn net10 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1
XMNP net9 inp net10 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1

* PMOS current-mirror active load
XMPREF net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1.5 nf=1 m=1
XMPLOAD out net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1.5 nf=1 m=1
.ends dut
