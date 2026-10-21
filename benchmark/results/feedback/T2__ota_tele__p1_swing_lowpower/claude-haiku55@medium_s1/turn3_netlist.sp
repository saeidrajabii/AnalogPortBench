.subckt dut iref inp inn out
* Bias generation
* 20 uA reference mirror (diode at iref)
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=13.32 L=0.5 nf=1 m=1
* Tail mirror, 2x reference (about 40 uA)
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=26.6 L=0.5 nf=1 m=1
* PMOS reference diode, sets vcpref
XMB5 vcpref vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMB6 vcpref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=13.32 L=0.5 nf=1 m=1
* vcn generator: PMOS pull-up (about 14 uA) into a single minimum-width NMOS diode
* This sets vcn lower than the previous diode stack, which lowers the output's lower limit
XMB4 vcn vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=0.5 nf=1 m=1
XMB2 vcn vcn 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.42 L=0.5 nf=1 m=1
* vcp generator
XMB7 vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMB8 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=13.32 L=0.5 nf=1 m=1

* Input pair, tail at about 40 uA
XM1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XM2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1

* Folded-cascode NMOS branch, L increased to 1.5 with W/L unchanged (raises output resistance)
XM3 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=1
XM4 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1.5 nf=1 m=1

* PMOS cascodes and top current sources, L increased to 1.5 with W/L unchanged
XM5 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=72 L=1.5 nf=1 m=1
XM6 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=72 L=1.5 nf=1 m=1
XM7 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=1.5 nf=1 m=1
XM8 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=36 L=1.5 nf=1 m=1
.ends dut
