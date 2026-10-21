.subckt dut iref inp inn out

* Diode-connected reference; all amplifier bias currents are mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=1

* NMOS differential input stage.
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=4
XINM nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=90 L=1.5 nf=1 m=1
XINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=90 L=1.5 nf=1 m=1

* PMOS current-mirror active load.
XPMREF nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=0.6 nf=1 m=1
XPMLOAD nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=0.6 nf=1 m=1

* Inverting second stage with mirrored output bias.
XPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=168 L=0.7 nf=1 m=1
XNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=11

* Series-R Miller compensation.
RCOMP nstage ncomp 2k
CCOMP ncomp out 700f

.ends dut
