.subckt dut iref inp inn out
* Reference current is received at the drain of a diode-connected NMOS
* and mirrored to the amplifier bias branches.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.2 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1.2 nf=1 m=1
XSINK out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=75 L=1.2 nf=1 m=1

* NMOS differential pair and PMOS current-mirror load.
XINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=22 L=0.8 nf=1 m=1
XINN n2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=22 L=0.8 nf=1 m=1
XPDI n2 n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=1.2 nf=1 m=1
XPMI n1 n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=1.2 nf=1 m=1

* Common-source output stage and Miller compensation.
XPOUT out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=140 L=0.8 nf=1 m=1
RNULL n1 nc 800
CCOMP nc out 850f
.ends dut
