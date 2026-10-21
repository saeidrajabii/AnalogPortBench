.subckt dut iref inp inn out
* Bias reference: 20 uA diode, unit device W=6 L=1, m=5 (about 4 uA per unit)
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=5
* Tail current source: 2 units = 8 uA
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=2
* NMOS input pair (weak inversion, high gm/Id)
XM1  o1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2  x1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS current-mirror load (diode on the inn side)
XM3  x1 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
XM4  o1 x1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
* Second stage: PMOS common source, 16 uA
XM5  out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=16 L=0.5 nf=1 m=1
* NMOS current-sink load: 4 units = 16 uA
XM6  out iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=4
* Miller compensation with nulling resistor
Rz   o1 nz 6k
Cc   nz out 0.7p
.ends dut
