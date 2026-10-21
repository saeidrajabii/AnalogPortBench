.subckt dut iref inp inn out
* Bias reference: NMOS diode carries iref (20 uA)
XMB iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* Tail current source (mirror x3, 60 uA)
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=3
* NMOS input pair
XM1 n1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 n2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS mirror load
XM3 n1 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XM4 n2 n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
* Second stage: PMOS common source with NMOS current-sink load (mirror x9, 180 uA)
XM5 out n2 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=6
XM6 out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=9
* Miller compensation with nulling resistor
RZ n2 nc 1.5k
CC nc out 0.6p
.ends dut
