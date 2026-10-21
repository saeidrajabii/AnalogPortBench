.subckt dut iref inp inn out
* Reference and bias-current mirrors
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMNTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=5

* First stage: differential pair and PMOS mirror load
XMNINP n1 inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=2 nf=1 m=1
XMNINN nd inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=2 nf=1 m=1
XMPD nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=2 nf=1 m=1
XMPM n1 nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=2 nf=1 m=1

* Second-stage bias and output devices
XMNBIAS pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMPBIAS pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XMPLOAD out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=5
XMNOUT out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.8 nf=1 m=1

* Miller compensation and zero-nulling resistor
RZ n1 ncomp 1k
CC ncomp out 1.2p
.ends dut
