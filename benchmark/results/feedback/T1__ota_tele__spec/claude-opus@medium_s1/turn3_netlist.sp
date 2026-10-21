.subckt dut iref inp inn out
* ---------------- bias network ----------------
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=36 L=1 nf=1 m=1
* vcp: narrow PMOS diode at 10 uA
XMB8 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMB7 vcp vcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=1.5 L=1 nf=1 m=1
* low-Vov PMOS mirror feeding the vcn stack (10 uA)
XMB6 vpb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=1 nf=1 m=1
XMB5 vpb vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XMB4 vcn vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
XMB2 vcn vcn nb2 0 sky130_fd_pr__nfet_01v8_lvt W=8 L=2 nf=1 m=1
XMB3 nb2 nb2 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* ---------------- telescopic cascode OTA ----------------
XM1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=45 L=1.5 nf=1 m=1
XM2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=45 L=1.5 nf=1 m=1
XM3 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=2 nf=1 m=1
XM4 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=18 L=2 nf=1 m=1
XM5 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=1.25 nf=1 m=1
XM6 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=1.25 nf=1 m=1
XM7 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=1 nf=1 m=1
XM8 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=25 L=1 nf=1 m=1
.ends dut
