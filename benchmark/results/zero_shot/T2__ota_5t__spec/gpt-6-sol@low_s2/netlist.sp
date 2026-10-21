.subckt dut iref inp inn out
* The 20 uA reference is converted to a gate bias and mirrored
* into the differential-pair tail; it does not feed a source terminal.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

XINP load inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XINN out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1

XLOAD_REF load load vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
XLOAD_OUT out load vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
.ends dut
