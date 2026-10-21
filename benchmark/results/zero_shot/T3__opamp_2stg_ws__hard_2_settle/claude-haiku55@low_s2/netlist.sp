.subckt dut iref inp inn out
* Bias: 20 uA reference diode (XMB0), tail mirror 2x (XMB1), second-stage sink 8x (XMB2)
XMB0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
XMB1 tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMB2 out  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1

* First stage: NMOS differential pair with PMOS mirror load
XM1  d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XM2  n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMP1 d1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMP2 n1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1

* Second stage: PMOS common-source driven from n1, NMOS sink XMB2
XMP3 out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* Miller compensation with nulling resistor
RZ n1 nz 1k
CC nz out 600f
.ends dut
