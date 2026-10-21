.subckt dut iref inp inn out

* Reference-current mirror.
XBR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1

* PMOS bias generation: nominally 10 uA.
XBN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XBP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=3 nf=1 m=1

* Differential input stage: nominally 40 uA tail current.
XT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=2 nf=1 m=1
XIP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=1
XIN nd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2 nf=1 m=1

* Long-channel PMOS current-mirror load.
XLD nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=3 nf=1 m=1
XLM n1 nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=3 nf=1 m=1

* Common-source output stage: nominally 80 uA.
XON out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=240 L=3 nf=1 m=1
XOP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=480 L=3 nf=1 m=1

* Series-resistor Miller compensation.
RC n1 nc 820
CC nc out 1.2p

.ends dut
