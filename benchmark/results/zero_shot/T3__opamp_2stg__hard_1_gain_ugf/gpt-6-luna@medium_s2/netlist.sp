.subckt dut iref inp inn out
* PMOS reference mirror and NMOS bias reference
XMPREF iref iref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMPBIAS nref iref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMNREF nref nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

* First stage: NMOS differential pair with PMOS current-mirror load
XMTAIL ns nref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
XMND x inn ns 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XMNO n2 inp ns 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XMPD x x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XMPM n2 x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1.5 nf=1 m=1

* Second stage
XMNS out n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1
XMPL out iref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1

* Miller compensation
RZ n2 ncomp 2k
CC ncomp out 1.5p
.ends dut
