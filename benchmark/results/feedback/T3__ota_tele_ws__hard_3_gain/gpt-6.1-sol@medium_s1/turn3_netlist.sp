.subckt dut iref inp inn out

* Reference-current mirror.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=3 nf=1 m=1
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=3 nf=1 m=2
XOSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=6 nf=1 m=8

* Long-channel differential input pair.
XMIN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=360 L=6 nf=1 m=1
XMIP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=360 L=6 nf=1 m=1

* PMOS mirror with a separately biased output cascode.
* The reference branch does not contain a diode-connected stack.
XPLREF nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XPLMIR npout nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XPCAS nstage iref npout vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.6 nf=1 m=1

* Inverting second stage.
XPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=240 L=1.5 nf=1 m=1

* Series-resistor Miller compensation.
RCOMP nstage ncomp 2.5k
CCOMP ncomp out 2.1p

.ends dut
