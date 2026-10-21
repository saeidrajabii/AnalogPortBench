* Two-stage OTA with mirrored reference bias and Miller compensation.
* Candidate sizing; specification compliance requires model-based simulation.
* W and L are in micrometres.

.subckt dut iref inp inn out

* Reference-current receiver and NMOS bias mirrors.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1

* PMOS reference branch: nominally 5 uA.
XPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=2 nf=1 m=1

* NMOS differential input pair: nominally 10 uA total.
* Positive input drives the first-stage single-ended output downward.
XINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1.5 nf=1 m=1

* First-stage PMOS current-mirror load.
XLOAD1 nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1
XLOAD2 nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1

* Common-source second stage, nominally biased at 35 uA.
XOUTN out nstage 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1.5 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=210 L=2 nf=1 m=1

* Series-resistor Miller compensation.
RCOMP nstage ncomp 2k
CCOMP ncomp out 0.6p

.ends dut
