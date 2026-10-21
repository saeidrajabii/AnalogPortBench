.subckt dut iref inp inn out

* Reference-current mirror.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1

* Output-stage bias.
XBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XPBIAS pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=1 nf=1 m=1

* Separate low-overdrive differential-pair tail bias.
XTBIAS ptbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.8 L=2 nf=1 m=1
XPTBIAS ptbias ptbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=14 L=1 nf=1 m=1
XTAIL tail ptbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=350 L=1 nf=1 m=1

* PMOS differential pair.
XINN nmirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=2 nf=1 m=1
XINP nstage inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=2 nf=1 m=1

* Long-channel current-mirror load.
XLOAD1 nmirror nmirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=2 nf=1 m=1
XLOAD2 nstage nmirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=2 nf=1 m=1

* Common-source output stage.
XOUTN out nstage 0 0 sky130_fd_pr__nfet_01v8_lvt W=160 L=0.8 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=182 L=1 nf=1 m=1

* Series-resistor Miller compensation.
RCOMP nstage ncomp 4k
CCOMP ncomp out 0.4p

.ends dut
