.subckt bias iref vbiasp
XNR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1.5 nf=1 m=1
XNB netb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1.5 nf=1 m=1
XPB netb netb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.5 nf=1 m=1
XPT nsrc netb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=27 L=1.5 nf=1 m=1
.ends bias

.subckt OTA_5T vbiasp inp inn out
XP1 netx inp nsrc vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XP2 out inn nsrc vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XN1 netx netx 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1
XN2 out netx 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1.5 nf=1 m=1
.ends OTA_5T

.subckt dut iref inp inn out
XI0 iref vbiasp bias
XI1 vbiasp inp inn out OTA_5T
.ends dut
