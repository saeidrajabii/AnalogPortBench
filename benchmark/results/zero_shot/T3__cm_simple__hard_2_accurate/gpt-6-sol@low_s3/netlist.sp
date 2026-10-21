.subckt dut in out
* Reference current develops a sense voltage across RREF.
RREF ref 0 2k
XREF in in ref 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1

* Generate amplifier bias from a mirrored reference current.
XBN nb in 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XBP nb nb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1
XTAIL tail nb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1

* Differential amplifier and second gain stage.
XP1 d1 sense tail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=5 nf=1 m=1
XP2 d2 ref tail vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=5 nf=1 m=1
XN1 d1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=5 nf=1 m=1
XN2 d2 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=5 nf=1 m=1
XLOAD ctrl nb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1
XGAIN ctrl d2 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=3 nf=1 m=1
CCOMP ctrl d2 2p

* Output current is set by feedback around the source-sense resistor.
XOUT out ctrl sense 0 sky130_fd_pr__nfet_01v8_lvt W=1000 L=1 nf=1 m=1
RSENSE sense 0 2k
.ends dut
