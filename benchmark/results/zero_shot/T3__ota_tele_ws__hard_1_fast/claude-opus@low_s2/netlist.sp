.subckt dut iref inp inn out
* bias: 20uA reference mirrored
XMB0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=2
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=3
* input pair
XM1 n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.3 nf=1 m=2
XM2 n2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.3 nf=1 m=2
* PMOS mirror load
XM3 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=2
XM4 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=2
* second stage
XM5 out n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=13
XM6 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=10
* Miller compensation with nulling resistor
Rz n2 nz 2k
Cc nz out 0.25p
.ends dut
