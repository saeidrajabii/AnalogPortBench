.subckt dut iref inp inn out
* Bias: diode-connected NMOS reference, drain/gate at iref (20 uA ideal current in)
XMR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* Tail current source, 4x reference = 80 uA
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
* Input differential pair (inp drives the second-stage side, inn drives the diode side)
XM1 n08 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=1
XM2 n9  inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=1.5 nf=1 m=1
* PMOS mirror load (40 uA per side)
XM3 n9  n9  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1.5 nf=1 m=1
XM4 n08 n9  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1.5 nf=1 m=1
* Second stage: PMOS common-source driver and NMOS current sink (140 uA = 7x reference)
XM5 out n08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=50 L=0.5 nf=1 m=1
XM6 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=28 L=1 nf=1 m=1
* Miller compensation with nulling resistor
RR0 n08 n012 3k
CC0 n012 out 600f
.ends dut
