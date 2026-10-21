.subckt dut iref inp inn out
* Reference current is converted to a voltage before it is mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XBIASN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1.5 nf=1 m=1

* Differential input stage and current-mirror load.
XINP left inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XINN first inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1 nf=1 m=1
XPLOAD1 left left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.5 nf=1 m=1
XPLOAD2 first left vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.5 nf=1 m=1

* Common-source output stage with series-R Miller compensation.
XOUT out first 0 0 sky130_fd_pr__nfet_01v8_lvt W=45 L=1.5 nf=1 m=1
XPSRC out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=39 L=1.5 nf=1 m=1
RCOMP first comp 300
CCOMP comp out 1.5p
.ends dut
