.subckt dut iref inp inn out

* Reference-current mirror.
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

* Nominal 30 uA differential-pair tail current.
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1

* PMOS bias reference: nominal 9 uA.
XMB2 pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=1 nf=1 m=1
XMB3 pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=1 nf=1 m=1

* First stage; polarity includes the inversion of the second stage.
XM1 nd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.6 nf=1 m=1
XM2 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.6 nf=1 m=1
XM3 nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.2 nf=1 m=1
XM4 n1 nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.2 nf=1 m=1

* Second stage with nominal 55 uA PMOS current-source load.
XM5 out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.8 nf=1 m=1
XM6 out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=110 L=1 nf=1 m=1

* Series-resistor Miller compensation.
RC n1 nc 1.2k
CC nc out 0.8p

.ends dut
