.subckt dut iref inp inn out
* NMOS reference and mirrored tail/output sink currents
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XMNTail ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
XMNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=1

* PMOS reference branch for the output-stage source current
XMNPMREF pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XMPPMREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1
XMPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=2 nf=1 m=1

* Differential input pair; the PMOS mirror provides the first-stage load.
XMNINL nleft inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=2 nf=1 m=1
XMNINR n1 inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=2 nf=1 m=1
XMPLOADL nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=2 nf=1 m=1
XMPLOADR n1 nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=2 nf=1 m=1

* Miller compensation
Rcomp n1 ncomp 1k
Ccomp ncomp out 1p
.ends dut
