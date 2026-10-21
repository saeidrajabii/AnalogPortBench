.subckt dut iref inp inn out
* NMOS reference and mirrored differential-pair tail current
XMREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1

* NMOS differential pair
XMN1 x inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1
XMN2 out inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1.5 nf=1 m=1

* PMOS current-mirror active load
XMP1 x x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1.5 nf=1 m=1
XMP2 out x vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=1.5 nf=1 m=1
.ends dut
