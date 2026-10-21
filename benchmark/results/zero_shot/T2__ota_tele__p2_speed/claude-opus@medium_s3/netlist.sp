.subckt dut iref inp inn out
* ---- reference and tail mirror (20uA -> 120uA) ----
XMB1 iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=6
* ---- PMOS reference for vcn branch (5uA) ----
XMB4 vpb iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.5 L=0.5 nf=1 m=1
XMB5 vpb vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XMB7 vcn vpb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=1
* ---- vcn generator: diode matched to M3/M4 + 70k -> x ~ 0.35V ----
XMBN vcn vcn nr 0 sky130_fd_pr__nfet_01v8_lvt W=1.67 L=0.3 nf=1 m=1
RN nr 0 70k
* ---- vcp generator: 40k + diode matched to M5/M6 -> y ~ 1.0V ----
RP vdd pr 40k
XMBP vcp vcp pr vdd sky130_fd_pr__pfet_01v8_lvt W=2.5 L=0.35 nf=1 m=1
XMB6 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2.5 L=0.5 nf=1 m=1
* ---- telescopic cascode core ----
XM1 x1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.25 nf=1 m=1
XM2 x2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=30 L=0.25 nf=1 m=1
XM3 d1 vcn x1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
XM4 out vcn x2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
XM5 d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.35 nf=1 m=1
XM6 out vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.35 nf=1 m=1
XM7 y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.35 nf=1 m=1
XM8 y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=30 L=0.35 nf=1 m=1
.ends dut
