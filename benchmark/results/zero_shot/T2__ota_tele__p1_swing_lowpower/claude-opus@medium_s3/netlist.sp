.subckt dut iref inp inn out
* Bias: 20 uA reference diode, mirrored 1:1 to the tail and 1:3 to the output-stage load
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM7  out  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=3
* Stage 1: NMOS input pair (inn on the mirror-diode side, inp on the output side)
XM1  d1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM2  o1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM3  d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1 nf=1 m=1
XM4  o1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1 nf=1 m=1
* Stage 2: PMOS common source, sized 6x XM3 to give 60 uA, matched to XM7
XM6  out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1 nf=1 m=6
* Miller compensation with nulling resistor
Rz   o1 nc 2k
Cc   nc out 1p
.ends dut
