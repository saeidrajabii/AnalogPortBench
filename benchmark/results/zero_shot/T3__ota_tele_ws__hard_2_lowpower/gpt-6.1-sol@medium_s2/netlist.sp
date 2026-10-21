.subckt dut iref inp inn out

* Reference-current mirror: nominal 24 uA input-stage tail current.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=1.5 nf=1 m=1
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.5 nf=1 m=1

* NMOS differential input stage.
* The first-stage output is inverted relative to inp.
XINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.2 nf=1 m=1
XINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=1.2 nf=1 m=1

* PMOS active-load mirror.
XLOADREF nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1.2 nf=1 m=1
XLOADOUT nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1.2 nf=1 m=1

* Replica-biased second stage.
* With equal inputs, nstage = nmirror and out = pbias form
* a symmetric DC operating point for the output and replica branches.
XREPN pbias nmirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=1
XREPP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1 L=2 nf=1 m=1

* Inverting common-source output stage.
XOUTN out nstage 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=2 nf=1 m=10
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1 L=2 nf=1 m=10

* Miller compensation with a series zero-setting resistor.
RZERO nstage ncomp 6.8k
CCOMP ncomp out 1.2p

.ends dut
