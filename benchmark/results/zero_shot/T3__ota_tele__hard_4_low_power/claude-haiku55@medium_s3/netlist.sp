.subckt dut iref inp inn out
* Bias: 20 uA reference (MB1, W/L = 40); tail mirror ratio 0.5 gives ~10 uA
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.15 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* PMOS bias chain (~1 uA)
XMB6 vcpref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.42 L=0.2 nf=1 m=1
XMB5 vcpref vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.35 nf=1 m=1
XMB4 vcn vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.35 nf=1 m=1
* NMOS cascode bias chain (~1 uA)
XMB2 vcn vcn nb2 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.15 nf=1 m=1
XMB3 nb2 nb2 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.15 nf=1 m=1
* PMOS cascode gate bias (~1 uA)
XMB8 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.42 L=0.2 nf=1 m=1
XMB7 vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.35 nf=1 m=1
* Input pair (~5 uA per side)
XM1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XM2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
* NMOS cascodes
XM3 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.35 nf=1 m=1
XM4 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.35 nf=1 m=1
* PMOS folded cascodes and top sources
XM5 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.35 nf=1 m=1
XM6 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.35 nf=1 m=1
XM7 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XM8 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
.ends dut
