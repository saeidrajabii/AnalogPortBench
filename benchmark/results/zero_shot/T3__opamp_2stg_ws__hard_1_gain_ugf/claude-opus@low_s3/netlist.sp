.subckt dut iref inp inn out
* bias: diode-connected NMOS takes the 20 uA reference, mirrors set tail and sink currents
XN0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* tail current ~80 uA
XNT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=4
* input pair
XN1 n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XN2 n2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS mirror load
XP1 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XP2 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
* second stage: PMOS common source, NMOS current sink ~200 uA
XP3 out n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=5
XN3 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=10
* Miller compensation with nulling resistor
RZ n2 nc 1k
CC nc out 0.6p
.ends dut
