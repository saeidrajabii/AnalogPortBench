.subckt dut iref inp inn out
* Reference-current conversion and mirrored bias currents
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XNT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1 nf=1 m=1
XNB pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XPR pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=2 nf=1 m=1

* Differential input stage and current-mirror load
XNI mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XNP gain inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.5 nf=1 m=1
XPM mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=2 nf=1 m=1
XPL gain mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=2 nf=1 m=1

* Common-source output stage
XPO out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=150 L=2 nf=1 m=1
XNO out gain 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=0.5 nf=1 m=1

* Miller compensation
RZ gain comp 250
CC comp out 1.1p
.ends dut
