.subckt dut iref inp inn out
* Diode-connected reference and current mirrors.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.8 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=33 L=1.6 nf=1 m=1

* Differential input stage with longer-channel gain devices.
XINP first inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=78 L=1.8 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=78 L=1.8 nf=1 m=1
XLOADREF mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=96 L=3.2 nf=1 m=1
XLOADOUT first mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=96 L=3.2 nf=1 m=1

* Second gain stage and Miller compensation.
XGAIN out first vdd vdd sky130_fd_pr__pfet_01v8_lvt W=240 L=3 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=75 L=3 nf=1 m=1
RNULL first comp 4k
CCOMP comp out 1.3p
.ends dut
