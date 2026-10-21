.subckt dut iref inp inn out
* Reference-current mirror: 20 uA reference, nominal 20 uA input-stage
* tail current, and nominal 30 uA output-stage sink current.
XREF  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1 nf=1 m=1
XSINK out  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4.5 L=1 nf=1 m=1

* Differential input stage and PMOS current-mirror load.
XINN  pdi inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XINP  n1  inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XPDI  pdi pdi vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1.5 nf=1 m=1
XPMIR n1  pdi vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1.5 nf=1 m=1

* Common-source output stage and Miller compensation.
XPOUT out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=0.65 nf=1 m=1
RZ n1 nc 3k
CC nc out 0.65p
.ends dut
