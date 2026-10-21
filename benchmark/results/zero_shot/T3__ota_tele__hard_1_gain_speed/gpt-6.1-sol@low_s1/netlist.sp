.subckt dut iref inp inn out

* Reference current is received by a diode-connected NMOS.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1

* Generate a PMOS mirror reference at approximately 10 uA.
XBN pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XBP pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1

* Approximately 40 uA input-stage tail current.
XTAIL tail pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1

* PMOS differential input pair.
XIP vx inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=1
XIN vn inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2 nf=1 m=1

* NMOS current-mirror load.
XLD vn vn 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=2 nf=1 m=1
XLM vx vn 0 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=2 nf=1 m=1

* Inverting second stage, biased at approximately 80 uA.
XOUT out vx 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=2 nf=1 m=1
XLOAD out pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=2 nf=1 m=1

* Miller compensation with a series zero-control resistor.
RZ vx vc 1k
CC vc out 1p

.ends dut
