.subckt dut iref inp inn out

* Reference-current mirror.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1

* Differential-pair tail: nominally 50 uA.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=1 nf=1 m=1

* NMOS differential pair and PMOS current-mirror load.
XINN nmir inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2.5 nf=1 m=1
XINP n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=100 L=2.5 nf=1 m=1
XPL1 nmir nmir vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.5 nf=1 m=1
XPL2 n1 nmir vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.5 nf=1 m=1

* PMOS common-source output stage.
XPOUT out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=120 L=1 nf=1 m=1

* Output-stage current sink: nominally 70 uA.
XNOUT out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=210 L=1.5 nf=1 m=1

* Series-R Miller compensation.
RCOMP n1 nc 3.3k
CCOMP nc out 1.2p

.ends dut
