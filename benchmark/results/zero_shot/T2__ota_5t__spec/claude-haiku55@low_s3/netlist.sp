.subckt dut iref inp inn out
* Reference diode: iref current (20 uA) is sunk by a diode-connected NMOS
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* Tail current source mirrored from iref (1:1, about 20 uA)
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* NMOS differential pair (same topology as source: inp on mirror side, inn on output side)
XMn2 n9 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XMn1 out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
* PMOS active-load current mirror
XMp1 n9 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XMp0 out n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
.ends dut
