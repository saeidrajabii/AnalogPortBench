.subckt dut iref inp inn out

* Reference current enters the drain of a diode-connected NMOS.
* All amplifier bias currents are mirrored from this reference.
XMNREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1

* Differential-stage tail current: nominally 40 uA.
XMTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1

* NMOS differential input pair.
XMINM nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1.5 nf=1 m=1
XMINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1.5 nf=1 m=1

* Long-channel PMOS current-mirror active load.
XMPD nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=2 nf=1 m=1
XMPL nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=2 nf=1 m=1

* Common-source second stage with mirrored NMOS current sink.
* Nominal output-stage bias: 140 uA.
XMPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=420 L=2 nf=1 m=1
XMNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=140 L=2 nf=1 m=1

* Series-R Miller compensation.
RCOMP nstage ncomp 650
CCOMP ncomp out 650f

.ends dut
