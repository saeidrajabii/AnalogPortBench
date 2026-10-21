.subckt dut iref inp inn out

* Reference-current mirror, differential-pair tail, and output sink.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=1 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=200 L=1 nf=1 m=1

* NMOS differential input stage with PMOS current-mirror load.
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XLOAD1 mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=0.5 nf=1 m=1
XLOAD2 stage1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=0.5 nf=1 m=1

* Inverting second stage; overall inp-to-out polarity is positive.
XOUT out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1

* Series-R Miller compensation.
RCOMP stage1 comp 1.8k
CCOMP comp out 1.5p

.ends dut
