.subckt dut iref inp inn out
* 20 uA reference current is converted to a voltage by a diode-connected
* NMOS, then mirrored into the differential pair and output stage.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1.2 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12.8 L=1.2 nf=1 m=1
XOUTBIAS out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=27 L=2 nf=1 m=1

* Differential input stage with a PMOS current-mirror load.
XINP pdiode inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.6 nf=1 m=1
XINN first inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.6 nf=1 m=1
XPDIOD pdiode pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=1.5 nf=1 m=1
XPMIR first pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=1.5 nf=1 m=1

* Common-source output stage and Miller compensation.
XPOUT out first vdd vdd sky130_fd_pr__pfet_01v8_lvt W=62.5 L=1.5 nf=1 m=1
RZERO first comp 1.2k
CCOMP comp out 1p
.ends dut
