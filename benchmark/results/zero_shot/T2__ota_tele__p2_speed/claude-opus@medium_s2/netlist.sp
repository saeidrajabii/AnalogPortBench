.subckt dut iref inp inn out
* ---------------- bias ----------------
* reference diode (20 uA)
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* PMOS reference branch (20 uA) -> MB4 feeds the tracking cascode-bias diode
XMB6 vcpref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMB5 vcpref vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
XMB4 vcn vcpref vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* NMOS cascode bias: diode referenced to the tail node (tracks input CM)
XMB2 vcn vcn tail tail sky130_fd_pr__nfet_01v8_lvt W=1.6 L=0.8 nf=1 m=1
* PMOS cascode bias (20 uA)
XMB8 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMB7 vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=0.5 nf=1 m=1
* tail: 6x unit = 120 uA (100 uA pair + 20 uA from MB2)
XMT tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=6
* ---------------- telescopic OTA ----------------
XM1 x1 inp tail tail sky130_fd_pr__nfet_01v8_lvt W=40 L=0.3 nf=1 m=1
XM2 x2 inn tail tail sky130_fd_pr__nfet_01v8_lvt W=40 L=0.3 nf=1 m=1
XM3 d1 vcn x1 x1 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
XM4 out vcn x2 x2 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
XM5 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.35 nf=1 m=1
XM6 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.35 nf=1 m=1
XM7 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.35 nf=1 m=1
XM8 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=24 L=0.35 nf=1 m=1
.ends dut
