.subckt dut iref inp inn out
* bias diode and mirrors
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM7 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=5
* input pair (inn is the diode-side input, inp drives the first-stage output)
XM2 n9 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM1 n8 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
* PMOS mirror load
XP1 n9 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=22 L=1 nf=1 m=1
XP0 n8 n9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=22 L=1 nf=1 m=1
* second stage
XP2 out n8 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=22 L=1 nf=1 m=5
* Miller compensation with nulling resistor
RZ n8 nc 1k
CC nc out 0.6p
.ends dut
