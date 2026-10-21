.subckt dut iref inp inn out
* Bias: diode-connected reference NMOS sets the mirror gate voltage on iref.
* The 20 uA reference enters the drain of the diode device (not its source).
XMb0 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* Tail current source, 2x reference (about 40 uA)
XMt tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* First stage: NMOS differential pair with PMOS current-mirror load
XMn1 net08 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMn2 net9 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMp1 net9 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMp0 net08 net9 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* Second stage: PMOS common-source gain device with NMOS current sink (3x reference, about 60 uA)
XMp2 out net08 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMo out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.5 nf=1 m=1

* Miller compensation with nulling resistor
RR0 net08 net012 3k
CC0 net012 out 500f
.ends dut
