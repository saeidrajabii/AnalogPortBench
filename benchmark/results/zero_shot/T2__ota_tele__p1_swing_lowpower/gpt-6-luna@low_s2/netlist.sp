.subckt dut iref inp inn out
* NMOS reference and mirrored differential-pair tail current
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* NMOS differential pair
XINP dleft inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XINN out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* PMOS current-mirror load
XPL dleft dleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1
XPR out dleft vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.7 nf=1 m=1
.ends dut
