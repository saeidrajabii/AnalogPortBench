.subckt dut iref inp inn out

* Reference-current mirror and PMOS bias generation.
XB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XB2 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XB3 vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.8 nf=1 m=1

* PMOS differential input stage with NMOS mirror load.
XT tail vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=0.8 nf=1 m=1
XIP n1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XIN nd inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XL1 nd nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.8 nf=1 m=1
XL2 n1 nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.8 nf=1 m=1

* Common-source output stage.
XO1 out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=70 L=0.6 nf=1 m=1
XO2 out vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=420 L=0.8 nf=1 m=1

* Series-R Miller compensation.
RC n1 nc 1.8k
CC nc out 0.42p

.ends dut
