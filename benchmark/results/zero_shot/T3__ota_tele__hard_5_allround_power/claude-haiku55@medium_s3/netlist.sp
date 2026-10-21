.subckt dut iref inp inn out
* ---- bias generation (all from iref, 20 uA reference) ----
* PMOS diode at vcp, 20 uA from ideal mirror sink
XMBpS vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMBnS vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
* NMOS cascode bias vcn: 20 uA from PMOS source, NMOS diode
XMBpcn vcn vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMBcn vcn vcn 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.5 L=0.5 nf=1 m=1
* PMOS cascode bias vpc: 20 uA PMOS diode, NMOS sink
XMBp5 vpc vpc vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMBn5 vpc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=1
* tail current source, about 50 uA
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1

* ---- signal path (folded cascode, NMOS input) ----
XM1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.5 nf=1 m=1
XM2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=50 L=0.5 nf=1 m=1
XM3 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM4 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XM5 d1 vpc y1 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM6 out vpc y2 vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM7 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XM8 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
.ends dut
