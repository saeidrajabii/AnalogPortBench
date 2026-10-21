.subckt dut iref inp inn out
* The 20 uA reference is converted to a gate bias and mirrored.
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=1.2 nf=1 m=1
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=54 L=1.2 nf=1 m=1
XNSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=90 L=1.2 nf=1 m=1

* Differential input stage with a PMOS current-mirror load.
XNINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.2 nf=1 m=1
XNINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.2 nf=1 m=1
XPLOAD1 nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=1.2 nf=1 m=1
XPLOAD2 nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=1.2 nf=1 m=1

* Inverting second stage and series-RC Miller compensation.
XPDRIVE out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1.2 nf=1 m=1
RCOMP nstage ncomp 2k
CCOMP ncomp out 1.2p
.ends dut
