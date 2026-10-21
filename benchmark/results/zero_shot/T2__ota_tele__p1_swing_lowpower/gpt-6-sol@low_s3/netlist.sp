.subckt dut iref inp inn out
* Reference-current mirror and differential-pair tail
XBIAS iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* NMOS differential pair with PMOS current-mirror load
XINP pdiode inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=0.7 nf=1 m=1
XINN n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=0.7 nf=1 m=1
XPD pdiode pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=1.2 nf=1 m=1
XPL n1 pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=1.2 nf=1 m=1

* Common-source output stage and Miller compensation
XPOUT out pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=1.2 nf=1 m=4
XNOUT out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.2 nf=1 m=1
RCOMP n1 ncomp 700
CCOMP ncomp out 1p
.ends dut
