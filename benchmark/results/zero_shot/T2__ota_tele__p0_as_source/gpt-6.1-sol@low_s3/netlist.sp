* Candidate port; performance requires verification with the supplied
* SKY130 models and testbench.
.subckt dut iref inp inn out

* Reference-current mirror.
XBN iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XBP nbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XBD nbp nbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=1 nf=1 m=1

* NMOS differential input stage, nominal 40 uA tail current.
XT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=1 nf=1 m=1
XIP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XIN nd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1

* PMOS current-mirror load.
XLD nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=1 nf=1 m=1
XLM n1 nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=1 nf=1 m=1

* Inverting second stage, nominal 140 uA quiescent current.
XOP out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=240 L=1.2 nf=1 m=1
XON out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=7

* Miller compensation with a series zero-control resistor.
RZ n1 nc 750
CC nc out 0.85p

.ends dut
