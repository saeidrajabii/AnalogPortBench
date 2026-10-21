.subckt dut iref inp inn out
* Bias: 20 uA reference mirrored into NMOS cascode bias (vcn) and PMOS bias (vcpref, vcp)
XMB1  iref  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMB3  nb2   nb2   0    0    sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMB2  vcn   vcn   nb2  0    sky130_fd_pr__nfet_01v8_lvt W=1.5 L=0.5 nf=1 m=1
XMB4  vcn   vcpref vdd vdd  sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMB5  vcpref vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMB6  vcpref iref 0  0    sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMB7  vcp   vcp   vdd vdd  sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMB8  vcp   iref  0  0    sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1

* Tail current source (2x mirror of MB1)
XMT   tail  iref  0    0    sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=2

* NMOS input pair
XM1   x1    inp   tail 0    sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2   x2    inn   tail 0    sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* NMOS folded cascode
XM3   d1    vcn   x1   0    sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM4   out   vcn   x2   0    sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1

* PMOS cascode load
XM5   d1    vcp   y1   vdd  sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM6   out   vcp   y2   vdd  sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1

* PMOS current sources
XM7   y1    vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XM8   y2    vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
.ends dut
