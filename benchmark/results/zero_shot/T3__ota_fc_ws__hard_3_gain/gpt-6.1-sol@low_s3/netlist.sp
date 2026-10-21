* Two-stage, Miller-compensated OTA.
* Candidate port; performance requires verification with the supplied models.
* All transistor dimensions are in micrometres.

.subckt dut iref inp inn out

* Reference-current receiver and 10-uA bias mirror.
* The reference current enters a diode-connected drain, not a source.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1
XBIAS pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=2 nf=1 m=1
XPREF pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* Nominal 40-uA PMOS input-pair tail current.
XTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=1 nf=1 m=1

* PMOS differential input pair.
* Increasing inp lowers nstage; the output stage inverts again.
XINP nstage inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1
XINN ndiode inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1

* First-stage NMOS current-mirror load.
XNLOAD1 ndiode ndiode 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=2 nf=1 m=1
XNLOAD2 nstage ndiode 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=2 nf=1 m=1

* Common-source output stage, nominally biased at 80 uA.
XNOUT out nstage 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1.5 nf=1 m=1
XPOUT out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=1 nf=1 m=1

* Miller compensation with series zero-control resistor.
RCOMP nstage ncomp 1k
CCOMP ncomp out 1.2p

.ends dut
