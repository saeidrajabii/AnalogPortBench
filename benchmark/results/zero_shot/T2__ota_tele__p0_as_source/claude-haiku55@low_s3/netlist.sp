.subckt dut iref inp inn out
* ---- Bias network (iref = 20 uA) ----
* Tail mirror: 2x of reference -> 40 uA
XMB1  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
XMT   tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=13.32 L=0.5 nf=1 m=1
* Mirror source for cascode-bias branch
XMB6  vcpref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
XMB5  vcpref vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.5 nf=1 m=1
XMB4  vcn vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.5 nf=1 m=1
* NMOS cascode gate bias: diode-connected, small W so Vgs is about 0.8 V
XMBc  vcn vcn 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.2 L=0.5 nf=1 m=1
* PMOS cascode gate bias: diode-connected PMOS sourced from a 20 uA NMOS sink
XMB8  vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
XMB7  vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.2 L=0.35 nf=1 m=1

* ---- Signal path ----
* NMOS input pair
XM1   x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2   x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* NMOS cascodes
XM3   d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM4   out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* PMOS cascodes
XM5   d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.5 nf=1 m=1
XM6   out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.5 nf=1 m=1
* PMOS current sources
XM7   y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.5 nf=1 m=1
XM8   y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.195 L=0.5 nf=1 m=1
.ends dut
