.subckt dut iref inp inn out

* Reference-current mirror.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.25 nf=1 m=1
XMNB pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.25 nf=1 m=1
XMPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1

* Input-stage bias and differential pair.
XMPTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=135 L=1 nf=1 m=4
XMPINP stage1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=180 L=1 nf=1 m=2
XMPINN mirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=180 L=1 nf=1 m=2

* Long-channel current-mirror load.
XMNLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=51.84 L=2.4 nf=1 m=1
XMNLOAD2 stage1 mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=51.84 L=2.4 nf=1 m=1

* Common-source output stage.
XMNOUT out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=64.8 L=2 nf=1 m=2
XMPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=270 L=2 nf=1 m=6

* Miller compensation.
RNULL stage1 comp 1.5k
CCOMP comp out 1.7p

.ends dut
