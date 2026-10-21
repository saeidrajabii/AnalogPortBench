.subckt dut iref inp inn out
* The 20 uA reference is converted to a voltage before it is mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XBIASN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=3 nf=1 m=1

* Differential input stage and PMOS current-mirror load.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=0.5 nf=1 m=1
XINP left inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=3 nf=1 m=1
XINN first inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=3 nf=1 m=1
XLOAD1 left left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=140 L=3 nf=1 m=1
XLOAD2 first left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=140 L=3 nf=1 m=1

* Common-source output stage with Miller compensation.
XOUT out first 0 0 sky130_fd_pr__nfet_01v8_lvt W=150 L=3 nf=1 m=1
XPULL out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=240 L=3 nf=1 m=1
RZ first comp 300
CC comp out 0.7p
.ends dut
