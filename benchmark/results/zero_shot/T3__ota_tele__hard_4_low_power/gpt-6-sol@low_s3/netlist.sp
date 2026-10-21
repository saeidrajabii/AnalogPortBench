.subckt dut iref inp inn out
* Reference current is diode-connected, then mirrored into the bias branches.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XBIASN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.2 L=1 nf=1 m=1
XBIASP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4.5 L=2 nf=1 m=1

* Differential input stage and PMOS current-mirror load.
XINN nleft inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XINP gain inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XPDIOD nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=2 nf=1 m=1
XPMIR gain nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=2 nf=1 m=1

* Common-source output stage with series Miller compensation.
XOUTN out gain 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=2 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=2 nf=1 m=1
RNULL gain comp 3k
CCOMP comp out 1.5p
.ends dut
