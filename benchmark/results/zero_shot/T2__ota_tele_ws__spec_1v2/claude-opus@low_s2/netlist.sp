.subckt dut iref inp inn out
* Bias: iref (20uA) into NMOS diode
XMB  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* Tail current source (40uA)
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=2
* NMOS input pair (weak/moderate inversion)
XM1  n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2  nd inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS mirror load (diode on inn side -> non-inverting overall)
XM3  nd nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XM4  n1 nd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
* Second stage: PMOS common source (~150uA) with NMOS current sink
XM6  out n1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=1 nf=1 m=5
XM7  out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=1 nf=1 m=5
* Miller compensation with nulling resistor
Rz   n1 nc 1k
Cc   nc out 1p
.ends dut
