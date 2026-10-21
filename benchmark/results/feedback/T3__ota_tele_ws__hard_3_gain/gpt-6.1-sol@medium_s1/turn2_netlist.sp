.subckt dut iref inp inn out

* Reference mirror; nominal currents: 20 uA reference,
* 50 uA differential-pair tail, and 160 uA output sink.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=3 nf=1 m=1
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=3 nf=1 m=2
XOSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=4.5 nf=1 m=8

* Differential input pair.
XMIN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=180 L=3 nf=1 m=1
XMIP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=180 L=3 nf=1 m=1

* Self-biased cascoded PMOS current-mirror load.
XPLREF npbias npbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.8 nf=1 m=1
XPCREF nmirror nmirror npbias vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.8 nf=1 m=1
XPLMIR npout npbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.8 nf=1 m=1
XPCMIR nstage nmirror npout vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.8 nf=1 m=1

* Common-source output stage.
XPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=400 L=2.5 nf=1 m=1

* Series-resistor Miller compensation.
RCOMP nstage ncomp 700
CCOMP ncomp out 4.2p

.ends dut
