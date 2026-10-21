.subckt dut iref inp inn out
* Tail mirror: MB1 diode sets ~20 uA reference (node iref)
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* Tail current source (~20 uA)
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* NMOS input pair (wide, low overdrive for headroom at VCM = 0.6 V)
XM1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* NMOS cascodes, gate vcn
XM3 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM4 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* NMOS cascode bias: ideal resistor divider, vcn ~ 0.75 V
RVCN1 vdd vcn 20k
RVCN2 vcn 0 33k
* PMOS cascodes, gate vcp
XM5 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM6 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* PMOS cascode bias: ideal resistor divider, vcp ~ 0.36 V
RVCP1 vdd vcp 47k
RVCP2 vcp 0 20k
* PMOS loads, gates tied to d1 as in the source design
XM7 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM8 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
.ends dut
