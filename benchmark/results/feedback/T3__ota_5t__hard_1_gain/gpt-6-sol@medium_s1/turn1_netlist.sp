.subckt dut iref inp inn out
* 20 uA reference converted to an NMOS mirror bias
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.7 nf=1 m=1

* Differential first stage: 10 uA tail current
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.7 nf=1 m=1
XN1 pgate inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.65 nf=1 m=1
XN2 first inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.65 nf=1 m=1
XP1 pgate pgate vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.7 nf=1 m=1
XP2 first pgate vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.7 nf=1 m=1

* Common-source second stage: nominal 24 uA
XP3 out first vdd vdd sky130_fd_pr__pfet_01v8_lvt W=19.2 L=0.7 nf=1 m=1
XN3 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4.8 L=0.7 nf=1 m=1

* Miller compensation with a series nulling resistor
RZ first comp 3.3k
CC comp out 0.75p
.ends dut
