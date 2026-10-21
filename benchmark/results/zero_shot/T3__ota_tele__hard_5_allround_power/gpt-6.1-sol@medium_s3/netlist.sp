.subckt dut iref inp inn out

* Reference-current mirror and PMOS bias generation.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1

* NMOS differential pair with PMOS current-mirror load.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=2
XINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=64 L=0.8 nf=1 m=1
XINN nmirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=64 L=0.8 nf=1 m=1
XPD nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.8 nf=1 m=1
XPM n1 nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.8 nf=1 m=1

* Inverting second stage restores non-inverting input polarity.
XOUTN out n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=96 L=0.8 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=5

* Series-resistor Miller compensation.
RCOMP n1 nc 3k
CCOMP nc out 0.75p

.ends dut
