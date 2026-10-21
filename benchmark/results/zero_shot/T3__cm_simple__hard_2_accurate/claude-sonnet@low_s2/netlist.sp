.subckt dut in out
* bottom diode device
XM1 a a 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* top diode device (cascode bias)
XM3 in in a 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* bottom output device
XM2 b a 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* top output device
XM4 out in b 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
.ends dut
