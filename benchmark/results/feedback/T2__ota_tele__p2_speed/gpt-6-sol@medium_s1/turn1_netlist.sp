.subckt dut iref inp inn out
* Reference-current mirror: 20 uA reference, 40 uA input-stage tail,
* and 120 uA output-stage sink.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.8 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.8 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.8 nf=1 m=1

* Differential input stage with a PMOS current-mirror load.
XINN nmirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=56 L=1 nf=1 m=1
XINP nstage inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=56 L=1 nf=1 m=1
XPLOAD1 nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=1 nf=1 m=1
XPLOAD2 nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=1 nf=1 m=1

* Common-source output stage and series-RC Miller compensation.
XPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=130 L=0.7 nf=1 m=1
CCOMP nstage ncomp 0.7p
RNULL ncomp out 3k
.ends dut
