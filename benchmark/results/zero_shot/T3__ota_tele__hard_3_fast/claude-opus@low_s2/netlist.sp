.subckt dut iref inp inn out
* reference mirror (20 uA)
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* tail 70 uA
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=14 L=0.5 nf=1 m=1
* vcp generation (5 uA)
XMB8 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1
XMB7 vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=0.42 L=0.63 nf=1 m=1
* vcn generation (5 uA)
XMB6 vcpref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1
XMB5 vcpref vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMB4 vcn vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMB2 vcn vcn 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.42 L=2 nf=1 m=1
* input pair
XM1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.2 nf=1 m=1
XM2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.2 nf=1 m=1
* NMOS cascodes
XM3 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
XM4 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
* PMOS cascodes
XM5 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.35 nf=1 m=1
XM6 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.35 nf=1 m=1
* PMOS mirror load
XM7 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM8 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
.ends dut
