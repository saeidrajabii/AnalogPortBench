.subckt dut iref inp inn out
* Reference current is diode-connected and mirrored into both bias branches.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=28 L=1.5 nf=1 m=1

* NMOS differential pair and PMOS current-mirror load.
XINP nleft inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.7 nf=1 m=1
XINN nstage inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.7 nf=1 m=1
XLOAD1 nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1
XLOAD2 nstage nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1

* Common-source output stage with Miller compensation.
XOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=1 nf=1 m=1
RZ nstage ncomp 1.3k
CC ncomp out 650f
.ends dut
