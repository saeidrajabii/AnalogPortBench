.subckt dut iref inp inn out
* bias reference (mirrored)
XMR  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=2
* first stage: NMOS diff pair, PMOS mirror load
XM1  n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM2  o1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM3  n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XM4  o1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
* second stage: PMOS common source, NMOS current sink
XM7  out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=7
XM8  out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=7
* Miller compensation with nulling resistor
Rz   o1 cz 1.5k
Cc   cz out 1p
.ends dut
