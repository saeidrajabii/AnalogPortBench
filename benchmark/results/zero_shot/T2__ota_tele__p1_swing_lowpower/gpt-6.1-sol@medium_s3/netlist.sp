.subckt dut iref inp inn out

* Reference-current mirror and PMOS bias generation.
XBR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XBN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XBP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1 nf=1 m=1

* PMOS differential pair with NMOS current-mirror load.
XTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1 nf=1 m=1
XIP n1 inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
XIN n2 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1
XL1 n1 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XL2 n2 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1

* Common-source output stage.
XOP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1 nf=1 m=3
XON out n2 0 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=1 nf=1 m=1

* Miller compensation with a series zero-setting resistor.
RZ n2 nc 5k
CC nc out 1p

.ends dut
