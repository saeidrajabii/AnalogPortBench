.subckt dut iref inp inn out
* Reference-current mirror: 20 uA reference, nominal 60 uA tail
* and 100 uA second-stage sink.
XBREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XBTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=72 L=0.5 nf=1 m=1
XBOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=0.5 nf=1 m=1

* Differential input stage with PMOS current-mirror load.
* The input assignment gives non-inverting gain from inp to out.
XN1 d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.8 nf=1 m=1
XN2 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.8 nf=1 m=1
XP1 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.8 nf=1 m=1
XP2 n1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.8 nf=1 m=1

* Common-source output stage and series-R Miller compensation.
XP3 out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
RZ n1 nc 900
CC nc out 0.65p
.ends dut
