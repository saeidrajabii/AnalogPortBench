.subckt dut iref inp inn out
* bias: nmos mirror of iref -> pmos diode -> pmos tail (2x)
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMb pb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XPd pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XPt tail pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
* pmos input pair
XM2 net9 inp tail vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
XM1 out inn tail vdd sky130_fd_pr__pfet_01v8_lvt W=80 L=2 nf=1 m=1
* nmos mirror load
XN1 net9 net9 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
XN0 out net9 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
.ends dut
