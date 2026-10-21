.subckt dut iref inp inn out
* Reference mirror: iref is diode-connected (20 uA in)
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Tail current source: 10 uA
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1

* NMOS cascode gate bias (vcn): single diode-connected device, no stacked Vgs
XMB2 vcn vcn 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.75 L=0.5 nf=1 m=1
XMB4 vcn vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.5 L=0.5 nf=1 m=1
XMB5 vcpref vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.5 L=0.5 nf=1 m=1
XMB6 vcpref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1

* PMOS cascode gate bias (vcp)
XMB7 vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1 L=0.5 nf=1 m=1
XMB8 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1

* Input pair
XM1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XM2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* NMOS cascodes
XM3 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XM4 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1

* PMOS folded load and sources
XM5 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XM6 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XM7 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XM8 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
.ends dut
