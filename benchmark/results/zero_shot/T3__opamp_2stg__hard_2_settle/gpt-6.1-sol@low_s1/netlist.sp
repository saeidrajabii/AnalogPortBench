* SKY130 1.2 V two-stage amplifier candidate.
* Specification compliance requires verification with the supplied models
* and testbench.

.subckt dut iref inp inn out

* Diode-connected reference; reference current enters the drain.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.2 nf=1 m=1

* Mirrored 40 uA differential-pair tail current.
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.2 nf=1 m=2

* NMOS differential input pair.
XINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.6 nf=1 m=1
XINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.6 nf=1 m=1

* PMOS current-mirror active load.
XPD nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.8 nf=1 m=1
XPM nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.8 nf=1 m=1

* Common-source second stage with mirrored 140 uA current sink.
XOUTP out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=200 L=0.8 nf=1 m=1
XOUTN out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.2 nf=1 m=7

* Series-resistor Miller compensation.
RCOMP nstage ncomp 500
CCOMP ncomp out 650f

.ends dut
