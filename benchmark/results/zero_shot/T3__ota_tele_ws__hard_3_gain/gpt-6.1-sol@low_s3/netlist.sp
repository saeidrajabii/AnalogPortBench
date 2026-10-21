* Two-stage, Miller-compensated candidate for SKY130 at VDD=1.2 V.
* Specification compliance requires simulation with the supplied models;
* the provided information alone does not establish device performance.
* All transistor dimensions are in micrometres.

.subckt dut iref inp inn out

* Reference-current sensing and mirrored bias branch.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XMNBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=2 nf=1 m=1
XMPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1

* PMOS differential pair: nominal total bias current 80 uA.
XMPTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=2 nf=1 m=1
XMPINN mirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=1
XMPINP stage1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=1

* Long-channel NMOS current-mirror load.
XMNLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=3 nf=1 m=1
XMNLOAD2 stage1 mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=3 nf=1 m=1

* Common-source output stage: nominal bias current 120 uA.
XMNOUT out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=3 nf=1 m=1
XMPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=240 L=2 nf=1 m=1

* Miller compensation with a series zero-nulling resistor.
RCOMP stage1 comp 700
CCOMP comp out 2.2p

.ends dut
