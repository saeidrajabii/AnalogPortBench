.subckt dut iref inp inn out
* The reference current is sunk by a diode-connected NMOS, not by a source terminal.
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=1

* Four-to-one mirrored tail current.
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=2 nf=1 m=4

* NMOS differential input pair.
XMN1 nleft inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XMN2 out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1

* PMOS current-mirror active load.
XMP1 nleft nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1
XMP2 out nleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=2 nf=1 m=1
.ends dut
