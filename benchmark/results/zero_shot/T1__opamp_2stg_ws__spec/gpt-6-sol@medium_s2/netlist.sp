.subckt dut iref inp inn out
* Reference-current mirror and PMOS bias
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XNB pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XPB pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.65 nf=1 m=1

* Replica stack generates the NMOS cascode bias
XPC casbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.65 nf=1 m=1
XNCB nrep iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XNCT casbias casbias nrep 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* Differential first stage
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XNINM dm inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=26 L=0.65 nf=1 m=1
XNINP dp inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=26 L=0.65 nf=1 m=1
XNC1 pm casbias dm 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=0.5 nf=1 m=1
XNC2 gain casbias dp 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=0.5 nf=1 m=1
XPL1 pm pm vdd vdd sky130_fd_pr__pfet_01v8_lvt W=22 L=0.8 nf=1 m=1
XPL2 gain pm vdd vdd sky130_fd_pr__pfet_01v8_lvt W=22 L=0.8 nf=1 m=1

* Second stage and Miller compensation
XPO out gain vdd vdd sky130_fd_pr__pfet_01v8_lvt W=75 L=0.7 nf=1 m=1
XNS ns iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=22 L=0.5 nf=1 m=1
XNCO out casbias ns 0 sky130_fd_pr__nfet_01v8_lvt W=22 L=0.5 nf=1 m=1
RZ gain comp 1k
CC comp out 1.05p
.ends dut
