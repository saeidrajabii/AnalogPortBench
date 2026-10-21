.subckt dut iref inp inn out
* Bias generation
* 20 uA reference mirror (diode at iref)
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=13.32 L=0.5 nf=1 m=1
* Tail mirror, 2x reference (about 40 uA), wider to reduce Vdsat
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=26.6 L=0.5 nf=1 m=1
* PMOS reference diode, wide so that vcpref sits higher and MB4 current is small
XMB5 vcpref vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XMB6 vcpref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=13.32 L=0.5 nf=1 m=1
* vcn generator: small PMOS pull-up into NMOS diode stack, keeps MB4 saturated
XMB4 vcn vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMB2 vcn vcn nb2 0 sky130_fd_pr__nfet_01v8_lvt W=13.32 L=0.5 nf=1 m=1
XMB3 nb2 nb2 0 0 sky130_fd_pr__nfet_01v8_lvt W=13.32 L=0.5 nf=1 m=1
* vcp generator
XMB7 vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMB8 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=13.32 L=0.5 nf=1 m=1

* Input pair, tail at about 40 uA
XM1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XM2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1

* Folded-cascode NMOS branch, L doubled for higher output resistance (W/L unchanged)
XM3 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.0 nf=1 m=1
XM4 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1.0 nf=1 m=1

* PMOS cascodes and top current sources, L doubled (W/L unchanged)
XM5 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=1.0 nf=1 m=1
XM6 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=48 L=1.0 nf=1 m=1
XM7 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.0 nf=1 m=1
XM8 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=1.0 nf=1 m=1
.ends dut
