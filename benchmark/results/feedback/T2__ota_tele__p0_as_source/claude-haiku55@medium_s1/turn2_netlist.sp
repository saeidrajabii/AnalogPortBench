.subckt dut iref inp inn out
* Bias: 20 uA reference mirrors (MB1 W=18 sets the 20 uA scale)
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=0.5 nf=1 m=1
XMB2 vcn vcn 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1
XMB4 vcn vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.5 nf=1 m=1
XMB5 vcpref vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.5 nf=1 m=1
XMB6 vcpref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=0.5 nf=1 m=1
XMB7 vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.2 L=0.5 nf=1 m=1
XMB8 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=0.5 nf=1 m=1

* Tail: 2 x 20/18 of iref, about 44 uA, low Vdsat
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=2

* Folded-cascode input pair (wide, low Vov) and nfet cascodes
XM1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XM2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XM3 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM4 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* PMOS fold and cascode sources (unchanged from attempt 1)
XM5 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.5 nf=1 m=1
XM6 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.5 nf=1 m=1
XM7 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.5 nf=1 m=1
XM8 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.5 nf=1 m=1
.ends dut
