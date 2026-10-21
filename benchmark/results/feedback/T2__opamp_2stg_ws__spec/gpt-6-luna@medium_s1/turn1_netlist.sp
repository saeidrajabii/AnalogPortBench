.subckt dut iref inp inn out
* PMOS reference mirror and NMOS bias reference
XPREF  iref  iref  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XPBIAS nbias iref  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XNREF  nbias nbias 0    0     sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1

* Differential input stage; tail current is 4x the NMOS reference
XTAIL tail nbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XINP  x1   inp   tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.6 nf=1 m=1
XINN  xref inn   tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.6 nf=1 m=1

* PMOS current-mirror load for the differential stage
XPLOADREF xref xref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XPLOAD    x1   xref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1

* Second stage and its PMOS current-source load
XSECOND out x1 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.6 nf=1 m=1
XPSECOND out iref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* Miller compensation
RZ x1 ncomp 1.5k
CC ncomp out 1p
.ends dut
