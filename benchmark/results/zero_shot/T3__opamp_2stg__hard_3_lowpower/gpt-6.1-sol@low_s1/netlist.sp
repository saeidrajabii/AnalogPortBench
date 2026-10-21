.subckt dut iref inp inn out
* Reference-current mirror: 20 uA reference, 40 uA tail,
* and nominally 80 uA second-stage sink.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=2
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=4

* Differential input stage with PMOS current-mirror load.
XINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.2 nf=1 m=1
XINN n2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.2 nf=1 m=1
XLOAD1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=2 nf=1 m=1
XLOAD2 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=2 nf=1 m=1

* Common-source output stage.
XOUT out n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1.5 nf=1 m=1

* Series-R Miller compensation.
RZERO n2 nc 2k
CCOMP nc out 700f
.ends dut
