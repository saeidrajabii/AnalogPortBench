.subckt dut iref inp inn out
* 20 uA reference, mirrored to the input-pair tail and output sink
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=2 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=3 nf=1 m=1

* Differential input stage and PMOS current-mirror load
XINM pm_gate inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=90 L=2 nf=1 m=1
XINP first inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=90 L=2 nf=1 m=1
XPDI pm_gate pm_gate vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=3 nf=1 m=1
XPMIR first pm_gate vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=3 nf=1 m=1

* Common-source output stage and Miller compensation
XPOUT out first vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=3 nf=1 m=1
RZERO first comp 2.5k
CCOMP comp out 0.65p
.ends dut
