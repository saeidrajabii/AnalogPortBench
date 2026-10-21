* Two-stage, Miller-compensated port.
* Candidate sizing; specification compliance requires model-based simulation.
.subckt dut iref inp inn out

* Reference-current mirror and differential-pair tail.
XBREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=3 nf=1 m=1
XBTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=3 nf=1 m=1

* Differential input stage with PMOS current-mirror load.
* The first-stage output falls when inp rises.
XMIN inn_d inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=3 nf=1 m=1
XMIP gain inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=3 nf=1 m=1
XMPREF inn_d inn_d vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=3 nf=1 m=1
XMPLOAD gain inn_d vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=3 nf=1 m=1

* Inverting second stage; nominal mirrored sink current is 100 uA.
XMOUT out gain vdd vdd sky130_fd_pr__pfet_01v8_lvt W=300 L=3 nf=1 m=1
XMSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=3 nf=1 m=5

* Miller compensation with series zero-control resistance.
RZ gain comp 1k
CC comp out 0.6p

.ends dut
