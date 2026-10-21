.subckt dut iref inp inn out

* Diode-connected reference; input current is mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1

* Differential-stage tail current.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=84 L=2 nf=1 m=1

* Longer-channel differential pair.
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=72 L=2.4 nf=1 m=1
XINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=72 L=2.4 nf=1 m=1

* Longer-channel current-mirror load.
XLOAD1 mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=2 nf=1 m=1
XLOAD2 stage1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=2 nf=1 m=1

* High-output-resistance second stage.
XOUTP out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=144 L=2.4 nf=1 m=1
XOUTN out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=342 L=6 nf=1 m=1

* Miller compensation with phase-lead resistor.
RCOMP stage1 comp 8.2k
CCOMP comp out 1.2p

.ends dut
