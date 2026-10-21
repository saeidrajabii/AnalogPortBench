.subckt dut iref inp inn out
* ---------------- bias network ----------------
* reference diode, 20 uA
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
* tail current source, 4x mirror -> 80 uA
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=4
* PMOS cascode bias vcp: 10 uA into a narrow PMOS diode
XMB8 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMB7 vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.9 L=1 nf=1 m=1
* NMOS cascode bias vcn: 10 uA from a copy of MB7 into a two-diode stack
XMB4 vcn vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.9 L=1 nf=1 m=1
XMB2 vcn vcn nb2 0 sky130_fd_pr__nfet_01v8_lvt W=5 L=1 nf=1 m=1
XMB3 nb2 nb2 0 0 sky130_fd_pr__nfet_01v8_lvt W=1.5 L=1 nf=1 m=1
* ---------------- telescopic cascode OTA ----------------
XM1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XM2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XM3 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM4 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
XM5 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XM6 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XM7 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
XM8 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.5 nf=1 m=1
.ends dut
