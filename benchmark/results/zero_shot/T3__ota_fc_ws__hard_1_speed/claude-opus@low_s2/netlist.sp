.subckt dut iref inp inn out
* Bias mirror: 20 uA reference -> 100 uA tail current
XMB  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=5
* NMOS input pair
XM1  d1  inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=0.8 nf=1 m=4
XM2  out inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=0.8 nf=1 m=4
* PMOS mirror load
XM3  d1  d1  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.8 nf=1 m=2
XM4  out d1  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.8 nf=1 m=2
.ends dut
