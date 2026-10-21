.subckt dut iref inp inn out

* Reference-current mirror and first-stage tail bias.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.2 nf=1 m=1
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.2 nf=1 m=3

* Mirrored 10-uA branch establishes the PMOS output-load bias.
XBIASN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1.2 nf=1 m=1
XBIASP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=1.5 nf=1 m=1

* NMOS differential pair and PMOS current-mirror active load.
* The first-stage output rises when inp rises relative to inn.
XINP nmirror inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.2 nf=1 m=1
XINN nstage inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.2 nf=1 m=1
XLOADREF nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=1.2 nf=1 m=1
XLOAD nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=1.2 nf=1 m=1

* Inverting second stage, nominally biased at 140 uA.
XOUTN out nstage 0 0 sky130_fd_pr__nfet_01v8_lvt W=48 L=1.2 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=1.5 nf=1 m=14

* Series-R Miller compensation.
RZ nstage ncomp 1.5k
CC ncomp out 1.1p

.ends dut
