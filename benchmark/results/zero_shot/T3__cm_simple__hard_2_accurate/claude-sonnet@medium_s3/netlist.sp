.subckt dut in out
* reference diode and output bottom device
XMa in in 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM1 x in 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* regulated cascode
XM2 out g2 x 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM3 g2 x 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* bias for amplifier: 1/10 mirror copy -> PMOS mirror
XMb pd in 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMpd pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMp1 g2 pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=1
.ends dut
