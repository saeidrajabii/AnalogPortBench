.subckt dut in out
* NMOS cascode mirror: sinks Iref from 'in'
XMn3 in in n1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMn1 n1 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMn2 pg in n2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMn0 n2 n1 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* PMOS diode and output mirror
XMp1 pg pg vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1
XMp0 out pg vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=1
.ends dut
