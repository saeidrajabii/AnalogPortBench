.subckt Cascode_Bias iref vb3 vb4
* The reference current flows through two diode-connected NMOS devices.
XNREF0 vb4 vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=0.55 nf=1 m=1
XNREF1 iref iref vb4 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=0.55 nf=1 m=1
RBIAS iref vb3 1

* A mirrored cascode branch establishes the PMOS bias current.
XNMIR0 ncas vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=0.55 nf=1 m=1
XNMIR1 pbias vb3 ncas 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=0.55 nf=1 m=1
XPBIAS0 pstack pstack vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=0.6 nf=1 m=1
XPBIAS1 pbias pbias pstack vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=0.6 nf=1 m=1
.ends Cascode_Bias

.subckt Opamp_2stg vb3 vb4 inn out inp
* First stage: NMOS differential pair with a PMOS mirror load.
XNTAIL0 ntail vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=0.55 nf=1 m=2
XNTAIL1 nsrc vb3 ntail 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=0.55 nf=1 m=2
XINP nfirst inp nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.8 nf=1 m=1
XINN nmirror inn nsrc 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.8 nf=1 m=1
XPMIR0 nmirror nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=26 L=0.8 nf=1 m=1
XPMIR1 nfirst nmirror vdd vdd sky130_fd_pr__pfet_01v8_lvt W=26 L=0.8 nf=1 m=1

* Second stage and Miller compensation.
XPOUT out nfirst vdd vdd sky130_fd_pr__pfet_01v8_lvt W=37 L=1.15 nf=1 m=3
XNOUT0 noutcas vb4 0 0 sky130_fd_pr__nfet_01v8_lvt W=7 L=0.55 nf=1 m=3
XNOUT1 out vb3 noutcas 0 sky130_fd_pr__nfet_01v8_lvt W=9 L=0.55 nf=1 m=3
RZ nfirst ncomp 3k
CC ncomp out 550f
.ends Opamp_2stg

.subckt dut iref inp inn out
XBIAS iref vb3 vb4 Cascode_Bias
XAMP vb3 vb4 inn out inp Opamp_2stg
.ends dut
