* Candidate port; specifications require verification with the target models.
.subckt dut iref inp inn out

* Reference current sensing and mirroring.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XBIAS pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XPBIAS pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1

* Separate cascode-gate bias branch.
XPCB vbcas pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XNCB vbcas vbcas 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=1 nf=1 m=1

* Differential input stage with mirrored PMOS load.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=2
XINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XPLD mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XPLM stage1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1

* Common-source output stage with cascoded current sink.
XPOUT out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=3
XNSINK sink iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=3
XNCAS out vbcas sink 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=0.5 nf=1 m=1

* Series-R Miller compensation.
RZ stage1 comp 1.5k
CC comp out 500f

.ends dut
