.subckt dut iref inp inn out
* Bias: 20 uA reference into NMOS diode, mirrored 1:4 to 5 uA
XMB0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=4
XMB1 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* PMOS diode (5 uA) mirrored 1:6 to the tail (about 30 uA)
XMB2 vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMT  tail vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=6
* PMOS input pair, longer channel for higher ro
XM1 nd  inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=2 nf=1 m=1
XM2 out inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=2 nf=1 m=1
* NMOS mirror load, longer channel for higher ro
XM3 nd  nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1
XM4 out nd 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1
.ends dut
