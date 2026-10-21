.subckt dut iref inp inn out

* Reference-current mirror and PMOS tail-bias generation
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XBN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XBP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1 nf=1 m=1

* PMOS differential pair with NMOS current-mirror load
XTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1
XIP vx inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.7 nf=1 m=1
XIN vm inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.7 nf=1 m=1
XND vm vm 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1 nf=1 m=1
XNM vx vm 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1 nf=1 m=1

* Common-source output stage with mirrored current sink
XOP out vx vdd vdd sky130_fd_pr__pfet_01v8_lvt W=240 L=1 nf=1 m=1
XON out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=66 L=1 nf=1 m=1

* Miller compensation with series zero-control resistor
RZ vx vc 2k
CC vc out 0.9p

.ends dut
