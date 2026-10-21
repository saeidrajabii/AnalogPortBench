.subckt dut iref inp inn out
* ---- bias network (20 uA reference, mirrored) ----
* tail current source, mirror ratio 1 (about 20 uA)
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* PMOS-diode / NMOS-sink pair that sets vcpref
XMB6 vcpref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMB5 vcpref vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* NMGate bias for NMOS folded cascodes (vcn ~ 0.8 V)
XMB4 vcn vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMB2 vcn vcn 0 0 sky130_fd_pr__nfet_01v8_lvt W=3 L=0.5 nf=1 m=1
* PMOS cascode gate bias (vcp)
XMB8 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMB7 vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* ---- signal path (folded cascode) ----
* NMOS input pair, long-ish L and wide W to keep Vgs low at VCM = 0.6 V
XM1  x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
XM2  x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
* NMOS cascodes
XM3  d1  vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM4  out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* PMOS cascodes
XM5  d1  vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XM6  out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
* PMOS current sources (gate at d1, as in the source design)
XM7  y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XM8  y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
.ends dut
