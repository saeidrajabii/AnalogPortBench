.subckt dut iref inp inn out
* Reference current is converted to a gate bias before it is mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1

* Differential-pair tail current and second-stage PMOS-bias current.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XPBIAS_SINK pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=1 nf=1 m=1

* First stage: NMOS differential pair and PMOS current-mirror load.
* The input assignment makes the overall gain from inp to out non-inverting.
XINN pdiode inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XLOAD_D pdiode pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=1 nf=1 m=1
XLOAD_M n1 pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=1 nf=1 m=1

* Second gain stage and series-RC Miller compensation.
XOUT_N out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XOUT_P out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
RZ n1 comp 4k
CC comp out 0.65p
.ends dut
