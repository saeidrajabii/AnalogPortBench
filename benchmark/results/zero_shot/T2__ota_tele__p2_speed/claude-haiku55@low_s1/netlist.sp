.subckt dut iref inp inn out
* ---------- bias generation ----------
* iref: diode-connected reference, 20 uA ideal into drain
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
* NMOS cascode bias (vcn): diode-connected stack
XMB2 vcn vcn nb2 0 sky130_fd_pr__nfet_01v8_lvt W=1.5 L=0.5 nf=1 m=1
XMB3 nb2 nb2 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
* PMOS cascode bias (vcn pull-up from vcpref)
XMB4 vcn vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.2 L=0.35 nf=1 m=1
XMB5 vcpref vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.2 L=0.35 nf=1 m=1
XMB6 vcpref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1
* PMOS cascode gate bias vcp
XMB7 vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.2 L=0.35 nf=1 m=1
XMB8 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=1

* ---------- tail current source (2x unit, 40 uA) ----------
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6.66 L=0.5 nf=1 m=2

* ---------- NMOS input pair (wide to reduce Vgs) ----------
XM1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* ---------- NMOS cascodes ----------
XM3 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM4 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* ---------- PMOS cascodes ----------
XM5 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=12.2 L=0.5 nf=1 m=1
XM6 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=12.2 L=0.5 nf=1 m=1

* ---------- PMOS load current sources ----------
XM7 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.2 L=0.5 nf=1 m=1
XM8 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12.2 L=0.5 nf=1 m=1
.ends dut
