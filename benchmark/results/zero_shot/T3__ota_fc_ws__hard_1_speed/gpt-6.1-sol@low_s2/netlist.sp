.subckt dut iref inp inn out

* Reference-current mirror.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMNB biasp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1

* PMOS bias mirror: nominal differential-pair current 160 uA.
XMPREF biasp biasp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.7 nf=1 m=1
XMPTAIL tail biasp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=320 L=0.7 nf=1 m=1

* PMOS differential input pair.
XMPINP mirror inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=0.8 nf=1 m=1
XMPINN out inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=0.8 nf=1 m=1

* NMOS current-mirror load and single-stage output.
XMNLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1 nf=1 m=1
XMNLOAD2 out mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=1 nf=1 m=1

.ends dut
