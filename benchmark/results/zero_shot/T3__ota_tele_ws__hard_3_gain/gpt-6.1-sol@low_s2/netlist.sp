.subckt dut iref inp inn out

* Reference-current mirror.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XMNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XMPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1

* PMOS differential input pair, nominal 60 uA tail current.
XMPTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=3
XMPINP stage1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=1
XMPINN mirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=1

* Long-channel active mirror load.
XMNLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=2 nf=1 m=1
XMNLOAD2 stage1 mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=2 nf=1 m=1

* Common-source output stage, nominal 100 uA bias.
XMNOUT out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=3 nf=1 m=1
XMPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=5

* Miller compensation with a series zero-control resistor.
RZERO stage1 comp 750
CCOMP comp out 1.6p

.ends dut
