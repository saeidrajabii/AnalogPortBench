.subckt dut iref inp inn out
* The 20 uA reference is diode-connected and mirrored into a 10 uA tail.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1

* Differential pair with a PMOS current-mirror load.
XINP load_gate inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=46 L=0.65 nf=1 m=1
XINN out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=46 L=0.65 nf=1 m=1
XPREF load_gate load_gate vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=0.8 nf=1 m=1
XPOUT out load_gate vdd vdd sky130_fd_pr__pfet_01v8_lvt W=18 L=0.8 nf=1 m=1
.ends dut
