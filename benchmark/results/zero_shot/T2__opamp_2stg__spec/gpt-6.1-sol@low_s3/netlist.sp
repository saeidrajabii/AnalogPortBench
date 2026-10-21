* Two-stage, Miller-compensated SKY130 candidate.
* Performance must be verified with the supplied testbench and models.
* Supply and model definitions are provided externally.

.subckt dut iref inp inn out

* Diode-connected reference device; reference current is mirrored.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1

* Differential-pair tail current: nominally 40 uA.
XMNTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=2

* NMOS input pair.
XMNINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMNINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1

* PMOS current-mirror first-stage load.
XMPDIO nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XMPLOAD nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* Common-source output stage with mirrored nominal 140 uA sink.
XMPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=0.7 nf=1 m=1
XMNSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=7

* Series-resistor Miller compensation.
RZERO nstage ncomp 820
CCOMP ncomp out 650f

.ends dut
