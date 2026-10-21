.subckt dut iref inp inn out

* Reference-current mirror.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.25 nf=1 m=1
XMNB pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.25 nf=1 m=1
XMPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1

* Increased input-stage bias and longer input devices.
XMPTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=540 L=1 nf=1 m=1
XMPINP stage1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=360 L=1 nf=1 m=1
XMPINN mirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=360 L=1 nf=1 m=1

* Long-channel current-mirror load.
XMNLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=51.84 L=2.4 nf=1 m=1
XMNLOAD2 stage1 mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=51.84 L=2.4 nf=1 m=1

* Higher-gain, increased-current output stage.
XMNOUT out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=129.6 L=2 nf=1 m=1
XMPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1620 L=2 nf=1 m=1

* Revised Miller compensation.
RNULL stage1 comp 1.5k
CCOMP comp out 1.7p

.ends dut
