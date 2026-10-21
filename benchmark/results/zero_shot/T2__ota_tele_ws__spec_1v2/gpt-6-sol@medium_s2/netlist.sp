.subckt dut iref inp inn out
* A 20 uA diode-connected reference is mirrored into the bias branches.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=45 L=1 nf=1 m=1
XBIASN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1 nf=1 m=1
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=2 nf=1 m=1

* Differential first stage and current-mirror load.
XINP nleft inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=70 L=1 nf=1 m=1
XINN nfirst inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=70 L=1 nf=1 m=1
XPLOAD1 nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=2 nf=1 m=1
XPLOAD2 nfirst nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=2 nf=1 m=1

* Common-source output stage with Miller compensation.
XPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=144 L=2 nf=1 m=1
XNOUT out nfirst 0 0 sky130_fd_pr__nfet_01v8_lvt W=17 L=1 nf=1 m=1
RZ nfirst ncomp 2k
CC ncomp out 1.4p
.ends dut
