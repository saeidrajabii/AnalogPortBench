.subckt dut iref inp inn out
* Bias: 20 uA reference into NMOS diode, mirrored 1:1 to the tail
XMB  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* Input pair (wide, weak/moderate inversion for high gm/Id)
XM1  n9  inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XM2  out inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=1
* PMOS mirror load (long L for high output resistance)
XM3  n9  n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=3 nf=1 m=1
XM4  out n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=3 nf=1 m=1
.ends dut
