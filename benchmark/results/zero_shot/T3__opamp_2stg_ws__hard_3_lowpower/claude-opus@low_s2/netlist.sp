.subckt dut iref inp inn out
* bias: NMOS diode, 20uA (m=2 units)
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=2
* tail ~30uA (m=3 units)
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=3
* input pair
XM1 n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM2 n2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* PMOS mirror load
XM3 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XM4 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* second stage
XM5 out n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=7
XM6 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=10
* compensation
RZ n2 nc 2k
CC nc out 0.55p
.ends dut
