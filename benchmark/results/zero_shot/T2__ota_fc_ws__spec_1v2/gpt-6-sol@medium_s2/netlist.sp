.subckt dut iref inp inn out
* The 20-uA reference is converted to a voltage before it is mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* 100-uA tail current and nominal 150-uA output-stage sink.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=75 L=1 nf=1 m=1

* First stage: NMOS differential pair with PMOS current-mirror load.
XINM nleft inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=0.7 nf=1 m=1
XINP nfirst inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=0.7 nf=1 m=1
XPMD nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XPMM nfirst nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1

* Second stage and series-RC Miller compensation.
XOUT out nfirst vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1 nf=1 m=1
RZ nfirst ncomp 900
CC ncomp out 1.5p
.ends dut
