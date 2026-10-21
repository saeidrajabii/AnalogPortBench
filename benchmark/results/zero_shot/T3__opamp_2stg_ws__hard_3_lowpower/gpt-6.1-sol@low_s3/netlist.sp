.subckt dut iref inp inn out

* Diode-connected reference and mirrored input-stage tail current.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1

* NMOS differential pair with PMOS current-mirror load.
XINP nstage inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
XINN nmirror inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
XPLREF nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1.5 nf=1 m=1
XPLMIR nstage nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1.5 nf=1 m=1

* Replica bias for the output current-sink cascode.
RBIAS vdd ncasbias 20k
XBIASCAS ncasbias ncasbias nbias 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=0.5 nf=1 m=1
XBIASSINK nbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1

* Common-source second stage with a cascoded mirrored current sink.
XPOUT out nstage vdd vdd sky130_fd_pr__pfet_01v8_lvt W=160 L=1 nf=1 m=1
XNCAS out ncasbias nsink 0 sky130_fd_pr__nfet_01v8_lvt W=480 L=0.5 nf=1 m=1
XNSINK nsink iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=120 L=1 nf=1 m=1

* Series-resistor Miller compensation.
RCOMP nstage ncomp 1k
CCOMP ncomp out 800f

.ends dut
