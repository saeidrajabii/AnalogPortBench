* Two-stage, Miller-compensated port.
* Candidate sizing: performance requires verification with the supplied
* SKY130 TT models; the specifications are not simulation-certified.
* Nominal mirrored currents:
* bias conversion 5 uA, input pair 15 uA, output stage 30 uA.
* Including the 20 uA reference, nominal supply power is 84 uW.

.subckt dut iref inp inn out

* Reference current enters a diode-connected NMOS drain/gate.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

* Mirror the reference to generate the PMOS bias.
XBIASN pbias iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XBIASP pbias pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1 nf=1 m=1

* PMOS differential input stage, with NMOS current-mirror load.
XTAIL tail pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=1 nf=1 m=1
XINP stage1 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1
XINN mirror inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1

XLOAD1 mirror mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1
XLOAD2 stage1 mirror 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1 nf=1 m=1

* Inverting second stage restores non-inverting inp-to-out polarity.
XOUTN out stage1 0 0 sky130_fd_pr__nfet_01v8_lvt W=80 L=1 nf=1 m=1
XOUTP out pbias vdd vdd sky130_fd_pr__pfet_01v8_lvt W=180 L=1 nf=1 m=1

* Series-resistor Miller compensation.
RZERO stage1 comp 3k
CCOMP comp out 0.8p

.ends dut
