.subckt dut iref inp inn out
* NMOS reference mirror: 20 uA reference sets a 160 uA differential-pair tail.
XMR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1

* NMOS differential pair and PMOS current-mirror load.
XM1 nd1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM3 nd1 nd1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XM4 out nd1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
.ends dut
