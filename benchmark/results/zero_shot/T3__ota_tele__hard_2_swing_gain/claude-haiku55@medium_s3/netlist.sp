.subckt dut iref inp inn out
* ---------------- Bias network ----------------
* Reference diode: 20 uA from iref
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* Tail mirror: 20 uA
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* PMOS bias diode vcpref, sinks 10 uA (ratio 0.5 of MB1)
XMB6 vcpref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMB5 vcpref vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
* NMOS cascode bias vcn: 10 uA stacked diodes
XMB4 vcn vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XMB2 vcn vcn nb2 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMB3 nb2 nb2 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* PMOS cascode bias vcp: PMOS diode sunk by 10 uA NMOS
XMB7 vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3 L=0.5 nf=1 m=1
XMB8 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1

* ---------------- Signal path ----------------
* NMOS input pair (10 uA per side)
XM1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
* NMOS cascodes
XM3 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM4 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* PMOS cascodes
XM5 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XM6 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
* PMOS top current sources (10 uA each)
XM7 y1 vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
XM8 y2 vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=6 L=0.5 nf=1 m=1
.ends dut
