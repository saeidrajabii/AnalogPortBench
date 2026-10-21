.subckt dut iref inp inn out
* ---- bias network (all currents derived by mirroring from iref) ----
* Reference diode: carries the 20 uA from the ideal source
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1
* Tail current source (mirror ratio 1 -> ~20 uA)
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1
* PMOS-bias leg: ~10 uA copy, PMOS diode, and PMOS mirror into vcn
XMB6 vcpref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.5 L=0.5 nf=1 m=1
XMB5 vcpref vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1 L=0.5 nf=1 m=1
XMB4 vcn vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1 L=0.5 nf=1 m=1
* NMOS cascode bias diode (sets vcn ~ 0.75 V)
XMB2 vcn vcn 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.6 L=0.5 nf=1 m=1
* PMOS cascode bias (sets vcp ~ 0.3 V)
XMB8 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.5 L=0.5 nf=1 m=1
XMB7 vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=0.42 L=0.35 nf=1 m=1

* ---- signal path: folded cascode ----
* NMOS input pair
XM1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* NMOS cascodes (d1 = mirror-side node, out = output node)
XM3 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XM4 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* PMOS cascodes
XM5 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XM6 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* PMOS current sources, self-biased from d1 (as in the source design)
XM7 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XM8 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
.ends dut
