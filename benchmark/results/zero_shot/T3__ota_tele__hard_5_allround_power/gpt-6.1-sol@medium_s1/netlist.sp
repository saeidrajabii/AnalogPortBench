.subckt dut iref inp inn out

* Reference-current mirror: nominal 20 uA reference, 5 uA bias branch.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=1 nf=1 m=1

* PMOS differential pair with nominal 25 uA tail current.
XTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=70 L=1 nf=1 m=1
XINN nmirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1.5 nf=1 m=1
XINP nstage inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1.5 nf=1 m=1

* Long-channel NMOS current-mirror load.
XLOAD1 nmirror nmirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.5 nf=1 m=1
XLOAD2 nstage nmirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.5 nf=1 m=1

* Common-source output stage with nominal 65 uA bias.
XOUTN out nstage 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=182 L=1 nf=1 m=1

* Series-R Miller compensation.
RCOMP nstage ncomp 3k
CCOMP ncomp out 0.9p

.ends dut
