.subckt dut iref inp inn out
* Bias: reference diode (20 uA set by iref)
XMref iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* Tail current source, 5x mirror (~100 uA)
XMtail tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* Second-stage sink, 7.5x mirror (~150 uA)
XMsink out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=15 L=0.5 nf=1 m=1
* NMOS input differential pair
XMinn da inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMinp d1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS active load mirror
XMLa da da vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMLb d1 da vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* Second stage PMOS common-source
XMo out d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=0.5 nf=1 m=1
* Miller compensation with nulling resistor
CC d1 cz 1p
RZ cz out 1.5k
.ends dut
