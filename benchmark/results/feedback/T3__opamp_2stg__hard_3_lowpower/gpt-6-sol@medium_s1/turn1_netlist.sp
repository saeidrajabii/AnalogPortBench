.subckt dut iref inp inn out
* Reference current is diode-connected and mirrored into the amplifier.
XREF  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1 nf=1 m=1
XSINK out  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1

* NMOS differential pair with a PMOS current-mirror load.
XINP  n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.8 nf=1 m=1
XINN  n2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=0.8 nf=1 m=1
XPREF n2 n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.2 nf=1 m=1
XPLOAD n1 n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.2 nf=1 m=1

* PMOS common-source output stage and series-RC compensation.
XPOUT out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=75 L=0.8 nf=1 m=1
RZERO n1 nc 2.7k
CCOMP nc out 650f
.ends dut
