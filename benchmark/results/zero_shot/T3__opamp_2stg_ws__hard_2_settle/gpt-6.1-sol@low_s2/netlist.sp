.subckt dut iref inp inn out

* Reference-current sensing and mirroring
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.2 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1.2 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=110 L=1.2 nf=1 m=1

* NMOS differential input stage
XINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.8 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.8 nf=1 m=1

* PMOS current-mirror load
XPD mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XPM stage1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* Common-source output stage
XOUT out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=88 L=1 nf=1 m=1

* Series-R Miller compensation
RZ stage1 comp 650
CC comp out 1.3p

.ends dut
