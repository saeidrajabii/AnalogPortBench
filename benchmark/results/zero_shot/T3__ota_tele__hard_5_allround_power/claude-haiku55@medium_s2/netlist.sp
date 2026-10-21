.subckt dut iref inp inn out
* Bias: 20 uA reference diode, 10 uA tail, 80 uA second-stage sink
XMB1  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMT   tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* Stage 1: NMOS differential pair (inn on the mirror-diode side), PMOS mirror load
XM1   na inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
XM2   n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
XM3   na na vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=1 nf=1 m=1
XM4   n1 na vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=1 nf=1 m=1
* Stage 2: PMOS common-source driver with NMOS current-source load
XM6   out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=35 L=1 nf=1 m=2
XM7   out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=4
* Miller compensation
Cc    n1 out 0.4p
.ends dut
