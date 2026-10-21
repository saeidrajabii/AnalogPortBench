.subckt dut iref inp inn out

* Reference mirror: 20 uA reference, 40 uA tail, 60 uA output sink.
XBREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XBTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=2
XBSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=3

* Differential input stage with PMOS current-mirror load.
XMINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMINN n2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XMPREF n2 n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.7 nf=1 m=1
XMPLOAD n1 n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.7 nf=1 m=1

* Common-source output stage.
XMOUT out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.35 nf=1 m=1

* Series-R Miller compensation.
RZ n1 nc 4k
CC nc out 0.35p

.ends dut
