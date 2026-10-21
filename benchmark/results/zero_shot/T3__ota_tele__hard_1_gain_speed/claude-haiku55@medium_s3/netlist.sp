.subckt dut iref inp inn out
* Bias: NMOS reference diode (MB1) mirrored to the tail (MT, 3x = 60 uA)
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4.6 L=0.5 nf=1 m=1
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=13.8 L=0.5 nf=1 m=1
* PMOS bias: diode MB5 sets vcpref (20 uA), MB4 copies it into vcn, MB6 sinks it
XMB5 vcpref vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=9 L=0.5 nf=1 m=1
XMB6 vcpref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4.6 L=0.5 nf=1 m=1
XMB4 vcn vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=9 L=0.5 nf=1 m=1
* NMOS cascode bias: diode MB2 sets vcn (about 0.7 V)
XMB2 vcn vcn 0 0 sky130_fd_pr__nfet_01v8_lvt W=1 L=0.5 nf=1 m=1
* PMOS cascode bias: diode MB7 sets vcp (about 0.35 V), MB8 sinks 20 uA
XMB7 vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.5 L=0.5 nf=1 m=1
XMB8 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4.6 L=0.5 nf=1 m=1
* Folded-cascode core
XM1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM3 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM4 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM5 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=13.5 L=0.5 nf=1 m=1
XM6 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=13.5 L=0.5 nf=1 m=1
XM7 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=13.5 L=0.5 nf=1 m=1
XM8 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=13.5 L=0.5 nf=1 m=1
.ends dut
