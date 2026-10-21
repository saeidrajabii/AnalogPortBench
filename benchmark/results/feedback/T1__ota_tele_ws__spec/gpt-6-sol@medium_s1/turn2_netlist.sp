.subckt dut iref inp inn out
* Mirror the 20 uA reference into the differential-pair tail.
XREF iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.8 nf=1 m=1
XTAIL tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=0.8 nf=1 m=1

* Cascode biases.
RNC1 vdd vbn 730k
RNC2 vbn 0 1.07meg
RPC1 vdd vbp 1meg
RPC2 vbp 0 800k

* Differential pair and NMOS cascodes.
XINP nsl inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.6 nf=1 m=1
XINN nsr inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=32 L=0.6 nf=1 m=1
XNC1 nl vbn nsl 0 sky130_fd_pr__nfet_01v8_lvt W=28 L=1.5 nf=1 m=1
XNC2 out vbn nsr 0 sky130_fd_pr__nfet_01v8_lvt W=28 L=1.5 nf=1 m=1

* Cascoded PMOS current-mirror load.
XPL pcl nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=54 L=0.8 nf=1 m=1
XPR pcr nl vdd vdd sky130_fd_pr__pfet_01v8_lvt W=54 L=0.8 nf=1 m=1
XPC1 nl vbp pcl vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1.5 nf=1 m=1
XPC2 out vbp pcr vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1.5 nf=1 m=1
.ends dut
