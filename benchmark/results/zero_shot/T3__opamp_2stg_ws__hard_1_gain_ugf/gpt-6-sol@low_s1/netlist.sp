.subckt dut iref inp inn out
* Mirror the 20 uA reference into the bias branches.
XBNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XBPTOP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1.2 nf=1 m=1
XBNP pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1

* NMOS differential input stage with a PMOS current-mirror load.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=2
XINN pdiode inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=0.7 nf=1 m=1
XINP first inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=0.7 nf=1 m=1
XPLD pdiode pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.2 nf=1 m=1
XPLM first pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.2 nf=1 m=1

* Common-source output stage and Miller compensation.
XPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=128 L=1.2 nf=1 m=1
XNOUT out first 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=0.7 nf=1 m=1
RZ first comp 800
CC comp out 650f
.ends dut
