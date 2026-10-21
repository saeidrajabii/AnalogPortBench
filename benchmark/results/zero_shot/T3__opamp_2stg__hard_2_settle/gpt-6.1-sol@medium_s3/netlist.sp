.subckt dut iref inp inn out

* Stacked diode reference; the reference current enters a drain.
XREF0 nbias nbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=1
XREF1 iref iref nbias 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* Differential input stage with mirrored 60-uA nominal tail current.
XTAIL ntail nbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=3
XINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.5 nf=1 m=1
XINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.5 nf=1 m=1

* PMOS current-mirror active load.
XLOAD0 nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1
XLOAD1 nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=1 nf=1 m=1

* Common-source output stage.
XOUTP out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=0.7 nf=1 m=1

* Cascoded, mirrored 140-uA nominal output sink.
XOUTN0 nsink nbias 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.5 nf=1 m=7
XOUTN1 out iref nsink 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=7

* Series-R Miller compensation.
RCOMP nstage ncomp 1.5k
CCOMP ncomp out 900f

.ends dut
