.subckt dut iref inp inn out
* Reference-current sink and mirrored bias currents
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XNT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=1 nf=1 m=1
XNB pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XPB pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=2 nf=1 m=1

* Differential input stage with a current-mirror load
XNI mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
XNP gain inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
XPM mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=35 L=3 nf=1 m=1
XPL gain mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=35 L=3 nf=1 m=1

* Common-source output stage
XPO out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=3 nf=1 m=1
XNO out gain 0 0 sky130_fd_pr__nfet_01v8_lvt W=25 L=2 nf=1 m=1

* Miller compensation
RZ gain comp 500
CC comp out 1p
.ends dut
