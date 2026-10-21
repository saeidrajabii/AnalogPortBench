.subckt dut iref inp inn out

* Reference-current mirror and PMOS bias generation.
XB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XB2 pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XB3 pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1

* PMOS input pair: nominal total tail current 20 uA.
XT tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
XIP stage1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.6 nf=1 m=1
XIN mirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.6 nf=1 m=1

* NMOS current-mirror load.
XL1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XL2 stage1 mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1

* Common-source output stage: nominal bias current 30 uA.
XO1 out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XO2 out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1 nf=1 m=1

* Miller compensation with series zero-control resistor.
RC stage1 comp 2.5k
CC comp out 0.7p

.ends dut
