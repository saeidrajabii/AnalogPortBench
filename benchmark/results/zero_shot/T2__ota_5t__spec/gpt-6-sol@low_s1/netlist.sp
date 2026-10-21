.subckt dut iref inp inn out
* Mirror the 20 uA reference into a nominal 40 uA tail current.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=2

* Differential pair and PMOS current-mirror load.
XINP pdiode inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XINN out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XPDI pdiode pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
XPOUT out pdiode vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=1 nf=1 m=1
.ends dut
