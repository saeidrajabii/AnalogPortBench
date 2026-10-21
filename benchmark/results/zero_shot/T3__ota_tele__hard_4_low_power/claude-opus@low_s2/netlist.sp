.subckt dut iref inp inn out
* bias mirror (unit nfet W=0.8 L=1)
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.8 L=1 nf=1 m=5
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.8 L=1 nf=1 m=2
* input stage: NMOS pair, PMOS mirror load
XM1 d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=1
XM4 x2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=1
* second stage: PMOS common source, NMOS current-sink load
XM5 out x2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=4
XM6 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.8 L=1 nf=1 m=4
* Miller compensation with nulling resistor
Rz x2 nz 4k
Cc nz out 1p
.ends dut
