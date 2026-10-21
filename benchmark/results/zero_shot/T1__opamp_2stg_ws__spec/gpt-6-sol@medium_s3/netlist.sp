.subckt dut iref inp inn out
* Reference current is converted to a gate bias, then mirrored.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=3.6 L=0.5 nf=1 m=1
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=7.2 L=0.5 nf=1 m=1

* Cascode bias for the second-stage current sink.
RBC vdd ncas 90k
XBC1 nmid nmid 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XBC2 ncas ncas nmid 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1

* First stage: NMOS differential pair and PMOS current-mirror load.
XINP nx inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.65 nf=1 m=1
XINN ny inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.65 nf=1 m=1
XPL nx nx vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=3 nf=1 m=1
XPR ny nx vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=3 nf=1 m=1

* Second stage and Miller compensation.
XPO out ny vdd vdd sky130_fd_pr__pfet_01v8_lvt W=110 L=1.5 nf=1 m=1
XNS nsink iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=0.5 nf=1 m=1
XNC out ncas nsink 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.5 nf=1 m=1
RZ ny ncomp 650
CC ncomp out 0.7p
.ends dut
