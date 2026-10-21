.subckt dut iref inp inn out
* PMOS reference mirror and NMOS bias generator
XPR  iref iref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1.5 nf=1 m=1
XBP  nbias iref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1.5 nf=1 m=1
XND  nbias nbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1

* Differential input stage with PMOS current-mirror load
XTAIL ntail nbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=1
XNL   nleft inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=1
XNR   v1 inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1.5 nf=1 m=1
XPL   nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XPRL  v1 nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1

* Second gain stage
XPOUT out iref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.5 nf=1 m=1
XNM2  out v1 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.0 nf=1 m=1

* Miller compensation with series nulling resistor
RC v1 ncomp 2k
CC ncomp out 500f
.ends dut
