.subckt dut iref inp inn out
* Reference current is converted to a gate bias before being mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.8 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.8 nf=1 m=2
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=32.5 L=1.2 nf=1 m=1

* NMOS differential pair and PMOS current-mirror load.
XINP nleft inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=35 L=0.7 nf=1 m=1
XINN nstage inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=35 L=0.7 nf=1 m=1
XPMD nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=35 L=1.0 nf=1 m=1
XPMM nstage nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=35 L=1.0 nf=1 m=1

* Common-source output stage with series-R Miller compensation.
XOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=150 L=1.0 nf=1 m=1
RNULL nstage ncomp 2k
CCOMP ncomp out 850f
.ends dut
