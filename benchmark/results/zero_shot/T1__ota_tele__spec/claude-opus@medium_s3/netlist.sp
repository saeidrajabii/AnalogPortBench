.subckt dut iref inp inn out
* ---------------- bias network ----------------
* reference diode (20 uA)
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.5 L=1 nf=1 m=2
* tail current source: 3x reference = 60 uA
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.5 L=1 nf=1 m=6
* 10 uA sink -> PMOS diode MB5, mirrored by MB4 into the vcn generator
XMB6 vcpref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.5 L=1 nf=1 m=1
XMB5 vcpref vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
XMB4 vcn vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=1 nf=1 m=1
* vcn generator: stacked diodes (MB2 matches M3/M4 current density)
XMB2 vcn vcn nb2 0 sky130_fd_pr__nfet_01v8_lvt W=6.67 L=0.5 nf=1 m=1
XMB3 nb2 nb2 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.5 L=1 nf=1 m=1
* vcp generator: 10 uA into a high-density PMOS diode (~9x density of M5/M6)
XMB8 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.5 L=1 nf=1 m=1
XMB7 vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2.2 L=1 nf=1 m=1
* ---------------- telescopic OTA ----------------
XM1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XM2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XM3 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM4 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM5 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1
XM6 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=60 L=1 nf=1 m=1
XM7 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XM8 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
.ends dut
