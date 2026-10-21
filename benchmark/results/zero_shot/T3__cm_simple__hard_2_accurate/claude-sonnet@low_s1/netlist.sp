.subckt dut in out
* reference diode and mirror
XM1r in in 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XM1 x in 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* cascode device
XM2 out ga x 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* regulation amplifier (common source), sensing x
XM3 ga x 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
* bias for amplifier load: ~2uA
XM4 pb in 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=1 nf=1 m=1
XMp0 pb pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMp1 ga pb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
.ends dut
