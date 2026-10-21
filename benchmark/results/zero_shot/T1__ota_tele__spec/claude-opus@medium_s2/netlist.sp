.subckt dut iref inp inn out
* ---- bias generation (all branches 20 uA) ----
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
XMB6 vcpref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
XMB5 vcpref vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1 nf=1 m=2
XMB4 vcn vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=1 nf=1 m=2
XMB2 vcn vcn nb2 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=4
XMB3 nb2 nb2 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
XMB8 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
XMB7 vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2.4 L=0.8 nf=1 m=1
* ---- tail current source (60 uA) ----
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=3
* ---- input pair ----
XM1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.8 nf=1 m=8
XM2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=6 L=0.8 nf=1 m=8
* ---- NMOS cascodes ----
XM3 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.8 nf=1 m=6
XM4 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=0.8 nf=1 m=6
* ---- PMOS cascode mirror load ----
XM5 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.8 nf=1 m=6
XM6 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.8 nf=1 m=6
XM7 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.8 nf=1 m=6
XM8 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.8 nf=1 m=6
.ends dut
