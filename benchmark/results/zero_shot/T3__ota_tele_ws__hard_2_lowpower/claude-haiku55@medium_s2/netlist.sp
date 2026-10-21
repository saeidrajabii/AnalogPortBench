.subckt dut iref inp inn out
* Bias reference and tail current source (20 uA mirrored from iref)
XMref  iref iref 0    0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMtail tail iref 0    0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1

* NMOS input pair (inp = non-inverting, inn = inverting)
XM1 n1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XM2 n2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1

* NMOS cascodes, gate at vcn
XMc1 nd1 vcn n1  0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XMc2 out vcn n2  0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1

* PMOS mirror load (left side diode-connected) with PMOS cascodes, gate at vbpc
XPm1 nx nx vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XPm2 ny nx vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XPc1 nd1 vbpc nx vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1
XPc2 out vbpc ny vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=1

* Cascode gate biases from resistive dividers (about 0.2 V for PMOS, 0.75 V for NMOS)
Rb1 vdd vbpc 2Meg
Rb2 vbpc 0 400k
Cb1 vbpc 0 5p
Rc1 vdd vcn 600k
Rc2 vcn 0 1Meg
Cc1 vcn 0 5p
.ends dut
