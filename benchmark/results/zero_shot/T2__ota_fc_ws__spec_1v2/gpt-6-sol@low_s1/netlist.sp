.subckt dut iref inp inn out
* Reference current is received by a diode-connected NMOS and mirrored.
XBREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XBTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XBPULL pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1

* PMOS current-source bias and second-stage load.
XPDIO pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.7 nf=1 m=1
XPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=0.7 nf=1 m=1

* NMOS differential input pair with PMOS current-mirror load.
XNINP nd inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=0.5 nf=1 m=1
XNINN first inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=0.5 nf=1 m=1
XPLD nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XPLM first nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1

* Common-source output stage with Miller compensation.
XNOUT out first 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.7 nf=1 m=1
RZ first comp 1.5k
CC comp out 0.55p
.ends dut
