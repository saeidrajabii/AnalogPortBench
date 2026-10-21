.subckt dut iref inp inn out
* Reference-current diode and NMOS bias mirrors
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1

* Differential first stage with PMOS current-mirror load
XINP pdiode inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.7 nf=1 m=1
XINN first inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.7 nf=1 m=1
XPDI pdiode pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1.2 nf=1 m=1
XPMI first pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1.2 nf=1 m=1

* Common-source output stage and Miller compensation
XPOUT out first vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=0.7 nf=1 m=1
RZ first comp 1.2k
CC comp out 700f
.ends dut
