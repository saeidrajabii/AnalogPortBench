.subckt dut iref inp inn out

* Reference-current mirror and PMOS bias generation.
XB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XB2 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XB3 vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1

* PMOS differential input stage, nominal 20 uA tail current.
XT tail vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1 nf=1 m=1
XIP n1 inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=0.6 nf=1 m=1
XIN n2 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=0.6 nf=1 m=1

* NMOS current-mirror active load.
XL1 n1 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XL2 n2 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1

* Common-source output stage, nominal 30 uA quiescent current.
XO1 out n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XO2 out vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=180 L=1 nf=1 m=1

* Miller compensation with series zero-control resistor.
RC n2 nc 2.7k
CC nc out 0.8p

.ends dut
