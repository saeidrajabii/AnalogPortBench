.subckt dut iref inp inn out

* Reference current is mirrored into the differential-stage tail.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=2 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=84 L=2 nf=1 m=1

* Long-channel differential input pair.
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=72 L=2.4 nf=1 m=1
XINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=72 L=2.4 nf=1 m=1

* Matched PMOS current-mirror load.
XLOAD1 mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=2 nf=1 m=1
XLOAD2 stage1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=2 nf=1 m=1

* Replica bias tracks the quiescent output-stage PMOS current.
XREPP biasout mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=23.32 L=2 nf=1 m=1
XREPN biasout biasout 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=4 nf=1 m=1

* Output devices are five times their corresponding replicas.
XOUTP out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=116.6 L=2 nf=1 m=1
XOUTN out biasout 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=4 nf=1 m=1

* Series-resistor Miller compensation.
RCOMP stage1 comp 8.2k
CCOMP comp out 1p

.ends dut
