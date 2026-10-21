.subckt dut iref inp inn out
* Reference sink
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.5 nf=1 m=1

* Differential-pair tail and output sink, mirrored from iref
XMNT nsrc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1
XMNSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.5 nf=1 m=1

* Differential input pair and PMOS mirror load
XMNINL nl inn nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1.5 nf=1 m=1
XMNINR n1 inp nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1.5 nf=1 m=1
XMPD nl nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XMPM n1 nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1.5 nf=1 m=1

* Common-source output stage
XMPS2 out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1.5 nf=1 m=1

* Miller compensation with series nulling resistor
RZ n1 ncomp 2.7k
CC ncomp out 1.5p
.ends dut
