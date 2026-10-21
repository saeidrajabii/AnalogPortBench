.subckt dut iref inp inn out

* Reference mirror and input-stage tail current.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=3 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=3 nf=1 m=2

* Cascode bias voltages.
RPH vdd bp 800k
RPL bp 0 400k
RNH vdd bn 300k
RNL bn 0 900k
CPB bp 0 2p
CNB bn 0 2p

* Long-channel differential pair.
XINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=53.33 L=4 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=53.33 L=4 nf=1 m=1

* Wide-swing cascoded PMOS mirror load.
XPMREF pm mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.8 nf=1 m=1
XPMOUT po mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.8 nf=1 m=1
XPCREF mirror bp pm vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1
XPCOUT stage1 bp po vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=0.5 nf=1 m=1

* Output-stage common-source amplifier and cascoded sink.
XPOUT out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=144 L=1.2 nf=1 m=1
XSINK ns iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=3 nf=1 m=5
XNSCAS out bn ns 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1

* Miller compensation and phase-lead zero.
RCOMP stage1 comp 13k
CCOMP comp out 470f

.ends dut
