.subckt dut iref inp inn out
* Bias: 20 uA reference mirrored to tail (2x) and to cascode-bias generators
XMB1  iref iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMT   tail iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=2
* NMOS cascode gate bias (vcn)
XMB4  vcn  vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8  L=0.5 nf=1 m=1
XMB2  vcn  vcn  0   0   sky130_fd_pr__nfet_01v8_lvt W=1  L=0.5 nf=1 m=1
* PMOS cascode gate bias (vcpref, vcp)
XMB5  vcpref vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8  L=0.5 nf=1 m=1
XMB6  vcpref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMB7  vcp  vcp  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XMB8  vcp  iref 0   0   sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
* Input differential pair (wide, low overdrive for CM 0.6 V headroom)
XM1   x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.3 nf=1 m=1
XM2   x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.3 nf=1 m=1
* NMOS folded cascode
XM3   d1  vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
XM4   out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
* PMOS cascode and load
XM5   d1  vcp y1  vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XM6   out vcp y2  vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.5 nf=1 m=1
XM7   y1  d1  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XM8   y2  d1  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
.ends dut
