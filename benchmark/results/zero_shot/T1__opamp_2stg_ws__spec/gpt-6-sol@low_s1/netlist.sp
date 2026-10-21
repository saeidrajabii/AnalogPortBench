.subckt dut iref inp inn out
* Reference current is converted to a gate bias by a diode-connected NMOS.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1

* First stage: NMOS differential pair with a PMOS current-mirror load.
XTAIL ntail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=4
XINP n1 inp ntail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XINN nd inn ntail 0 sky130_fd_pr__nfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XPDI nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=0.8 nf=1 m=1
XPMI n1 nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=0.8 nf=1 m=1

* Second stage and Miller compensation.
XPOUT out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=90 L=0.7 nf=1 m=1
XLOAD out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=5
RZ n1 nc 700
CC nc out 650f
.ends dut
