.subckt dut iref inp inn out
* Bias mirror: 20 uA reference into an NMOS diode, mirrored 9:20 to the tail (about 9 uA)
XMB  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=1 nf=1 m=20
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=1 nf=1 m=9
* Input pair: wide devices operating in weak inversion for high gm/Id
XM1  n9  inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XM2  out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* PMOS current-mirror load
XM3  n9  n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XM4  out n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
.ends dut
