.subckt dut iref inp inn out
* ---- bias network (20 uA reference into iref) ----
* NMOS tail / reference mirror
XMB1  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* vbp: PMOS current-source gate (~10 uA)
XMB8  vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMB7  vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* vcpref: 5 uA PMOS diode / sink
XMB6  vcpref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1
XMB5  vcpref vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* vcn: NMOS cascode bias (~0.9 V)
XMB4  vcn vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMB2  vcn vcn nb2 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMB3  nb2 nb2 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* vcp: PMOS cascode bias (~0.45 V)
XMB9  vcp vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMB10 vcp vcp 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* ---- signal path: NMOS-input folded cascode ----
* tail current source, 40 uA
XMT   tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=2
* input pair, 20 uA each
XM1   x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM2   x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
* NMOS cascodes
XM3   d1  vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM4   out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS cascodes
XM5   d1  vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XM6   out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
* PMOS current sources, 20 uA each
XM7   y1  vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XM8   y2  vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
.ends dut
