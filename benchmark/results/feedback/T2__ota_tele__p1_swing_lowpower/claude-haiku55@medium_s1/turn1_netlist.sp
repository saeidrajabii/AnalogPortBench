.subckt dut iref inp inn out
* Bias generation (same topology as source, L=0.5 for sky130 matching)
* Reference mirror: 20 uA reference, diode-connected at iref
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
* Tail mirror: 2x reference (W ratio 2), about 40 uA
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=13.32 L=0.5 nf=1 m=1
* PMOS-side reference chain for vcpref
XMB5 vcpref vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMB6 vcpref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
* Cascode-NMOS bias vcn (diode-connected stack with PMOS pull-up)
XMB4 vcn vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMB2 vcn vcn nb2 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
XMB3 nb2 nb2 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
* PMOS-cascode bias vcp
XMB7 vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMB8 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1

* Input pair (NMOS), tail at 40 uA
XM1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1

* Folded-cascode NMOS branch
XM3 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM4 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* PMOS cascodes and top current sources
XM5 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XM6 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XM7 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XM8 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
.ends dut
