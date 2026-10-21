.subckt dut iref inp inn out
* Reference-current mirror
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* NMOS differential pair and PMOS current-mirror load
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=2
XINN load_d inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XPL load_d load_d vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XPR stage1 load_d vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1

* PMOS output-stage bias
XNB pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XPB pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.7 nf=1 m=1

* Common-source output stage
XPO out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=72 L=0.7 nf=1 m=1
XNO out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=3

* Miller compensation with a series nulling resistor
RCOMP stage1 comp 250
CCOMP comp out 1.1p
.ends dut
