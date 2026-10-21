* Two-stage OTA with mirrored reference current and Miller compensation.
* Candidate sizing; performance requires verification with the target models.

.subckt dut iref inp inn out

* Reference-current mirror.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1

* PMOS bias reference: nominally 10 uA.
XPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.7 nf=1 m=1

* Differential-pair tail source: nominally 60 uA.
XTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=0.7 nf=1 m=1

* PMOS differential input pair.
* inp drives the high-impedance branch, giving positive overall gain.
XINM mirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XINP stage1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1

* NMOS current-mirror load.
XNLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=0.7 nf=1 m=1
XNLOAD2 stage1 mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=0.7 nf=1 m=1

* Common-source output stage: nominally 140 uA.
XNOUT out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=224 L=0.7 nf=1 m=1
XPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=112 L=0.7 nf=1 m=1

* Series-null-resistor Miller compensation.
RZERO stage1 comp 700
CCOMP comp out 0.55p

.ends dut
