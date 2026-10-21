.subckt dut iref inp inn out
* Bias: diode-connected reference driven by the 20 uA iref current (I_ref = 20 uA)
XMR iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* Tail current source, mirror ratio 2 -> 40 uA
XMT tl iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Input differential pair (inn drives the mirror-diode side, inp drives the stage-1 output side)
XM1 d1 inn tl 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.3 nf=1 m=1
XM2 o1 inp tl 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.3 nf=1 m=1
* PMOS mirror load of first stage
XM3 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.35 nf=1 m=1
XM4 o1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.35 nf=1 m=1
* Second stage: PMOS common-source driver and NMOS current sink (mirror ratio 6 -> 120 uA)
XM6 out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.35 nf=1 m=1
XM7 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
* Miller compensation with nulling resistor
RZ o1 cx 2k
CC cx out 500f
.ends dut
