.subckt dut iref inp inn out
* ---------------- bias ----------------
* iref -> RB -> diode MB1 (mirror reference nb); node iref doubles as NMOS cascode bias
RB   iref nb 22k
XMB1 nb nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* PMOS cascode bias: diode MB7 + resistor drop sets VSD of M7/M8 ~0.2 V
XMB8 vcp nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=1
RP   pd vcp 24k
XMB7 pd pd vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=0.5 nf=1 m=1
* ---------------- stage 1: telescopic cascode ----------------
XMT  tail nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=1 nf=1 m=1
XM1  x1 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM2  x2 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=40 L=0.5 nf=1 m=1
XM3  d1 iref x1 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM4  o1 iref x2 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XM5  d1 vcp y1 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XM6  o1 vcp y2 vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XM7  y1 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
XM8  y2 d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=1
* ---------------- stage 2: PMOS common source ----------------
XM9  out o1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=12 L=0.5 nf=1 m=5
XM10 out nb 0 0 sky130_fd_pr__nfet_01v8_lvt W=37.5 L=1 nf=1 m=4
* ---------------- Miller compensation with nulling resistor ----------------
RZ   o1 nc 1.5k
CC   nc out 0.9p
.ends dut
