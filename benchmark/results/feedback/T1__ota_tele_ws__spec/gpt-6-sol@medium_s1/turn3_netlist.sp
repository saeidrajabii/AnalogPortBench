.subckt dut iref inp inn out
* Mirror the reference current into the differential-pair tail.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.8 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=0.8 nf=1 m=1

* Cascode biases.
RNC1 vdd vbn 730k
RNC2 vbn 0 1.07meg
RPC1 vdd vbp 1meg
RPC2 vbp 0 800k

* Differential pair and longer-channel NMOS cascodes.
XINP nsl inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.6 nf=1 m=1
XINN nsr inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.6 nf=1 m=1
XNC1 nl vbn nsl 0 sky130_fd_pr__nfet_01v8_lvt W=56 L=3 nf=1 m=1
XNC2 out vbn nsr 0 sky130_fd_pr__nfet_01v8_lvt W=56 L=3 nf=1 m=1

* Longer-channel cascoded PMOS current-mirror load.
XPL pcl nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=81 L=1.2 nf=1 m=1
XPR pcr nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=81 L=1.2 nf=1 m=1
XPC1 nl vbp pcl vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2.5 nf=1 m=1
XPC2 out vbp pcr vdd sky130_fd_pr__pfet_01v8_lvt W=100 L=2.5 nf=1 m=1

COUT out 0 0.12p
.ends dut
