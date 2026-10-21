* Candidate design; specifications require verification with the
* supplied SKY130 models and testbench.

.subckt dut iref inp inn out

* Reference-current mirror: 20 uA reference, 40 uA tail,
* and approximately 100 uA output-stage sink.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=2
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=5

* NMOS differential input stage with PMOS mirror load.
XINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XPDIO mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.8 nf=1 m=1
XPLOAD stage1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.8 nf=1 m=1

* Common-source second stage.
XPOUT out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.5 nf=1 m=1

* Series-resistor Miller compensation.
RCOMP stage1 comp 3.3k
CCOMP comp out 600f

.ends dut
