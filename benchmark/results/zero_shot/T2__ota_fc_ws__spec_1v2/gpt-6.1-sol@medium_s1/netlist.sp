* Two-stage, Miller-compensated OTA.
* Candidate port; specification compliance requires model-based simulation.
* Supply and ground are supplied globally by the testbench.

.subckt dut iref inp inn out

* Reference-current mirror.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.25 nf=1 m=1
XMNB pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.25 nf=1 m=1
XMPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1

* PMOS input pair: nominal 80 uA tail current.
XMPTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=1 nf=1 m=1
XMPINP stage1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=0.6 nf=1 m=1
XMPINN mirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=0.6 nf=1 m=1

* NMOS current-mirror load.
XMNLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.25 nf=1 m=1
XMNLOAD2 stage1 mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.25 nf=1 m=1

* Common-source output stage: nominal 120 uA bias current.
XMNOUT out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.25 nf=1 m=1
XMPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=600 L=1 nf=1 m=1

* Miller compensation with a series zero-nulling resistor.
RNULL stage1 comp 680
CCOMP comp out 2.6p

.ends dut
