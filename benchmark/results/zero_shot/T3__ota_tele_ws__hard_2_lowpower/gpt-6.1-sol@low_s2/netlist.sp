* Two-stage, Miller-compensated OTA candidate.
* Performance requires verification with the supplied SKY130 models.
* All device dimensions are in micrometres.

.subckt dut iref inp inn out

* Diode-connected reference and mirrored bias currents.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=2 nf=1 m=1
XBIAS out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=2 nf=1 m=1

* Differential input stage with PMOS current-mirror load.
* The second stage inverts, giving overall non-inverting inp polarity.
XINP stage1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XINN mirror inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XPL1 mirror mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XPL2 stage1 mirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1

* Common-source output stage.
XPOUT out stage1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1 nf=1 m=1

* Miller compensation with series zero-nulling resistor.
RCOMP stage1 comp 1.8k
CCOMP comp out 1.2p

.ends dut
