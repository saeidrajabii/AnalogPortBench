.subckt CM_N_wsc in out
* bias resistor: sets cascode gate IR = 150 mV above bottom-device gate
R1 in a 7.5k
* reference branch
XM3 a in n1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM1 n1 a 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
* output branch
XM4 out in n2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM2 n2 a 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=2 nf=1 m=1
.ends CM_N_wsc

.subckt dut in out
XI0 in out CM_N_wsc
.ends dut
