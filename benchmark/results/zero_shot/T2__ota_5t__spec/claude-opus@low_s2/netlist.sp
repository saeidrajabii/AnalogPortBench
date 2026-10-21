.subckt dut iref inp inn out
* bias mirror (reference into drain of diode device)
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=2
* input pair
XM1 net9 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XM2 out inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
* PMOS mirror load
XM3 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM4 out net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
.ends dut
