.subckt dut iref inp inn out

* Reference-current mirror.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=4
XOUTBIAS out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=10

* Differential input stage and current-mirror load.
XINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=180 L=3 nf=1 m=1
XINN nm inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=180 L=3 nf=1 m=1
XPMREF nm nm vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=3 nf=1 m=1
XPMLOAD n1 nm vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=3 nf=1 m=1

* Common-source output stage.
XOUTPUT out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=0.8 nf=1 m=1

* Series-resistor Miller compensation.
RZERO n1 nc 2k
CCOMP nc out 800f

.ends dut
