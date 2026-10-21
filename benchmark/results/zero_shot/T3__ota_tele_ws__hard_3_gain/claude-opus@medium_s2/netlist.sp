.subckt dut iref inp inn out
* ---------------- bias ----------------
* iref (20uA) -> stacked NMOS diodes: nb = Vgs (mirror ref), iref node = NMOS cascode bias
XMbA iref iref nb 0   sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=5
XMbB nb   nb   0  0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=2
* 10uA branch: low-W/L PMOS diode sets the PMOS cascode bias vb2
XMb2 vb2  nb   0  0   sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMd  vb2  vb2  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=2 L=1 nf=1 m=1
* ---------------- stage 1: telescopic cascode ----------------
XMt  tail nb   0    0    sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XM1  c1   inn  tail tail sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=4
XM2  c2   inp  tail tail sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=4
XM3  nd   iref c1   0    sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=2
XM4  o1   iref c2   0    sky130_fd_pr__nfet_01v8_lvt W=10 L=0.5 nf=1 m=2
XM5  a1   nd   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=21 L=0.35 nf=1 m=1
XM6  a2   nd   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=21 L=0.35 nf=1 m=1
XM7  nd   vb2  a1   vdd  sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=2
XM8  o1   vb2  a2   vdd  sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=2
* ---------------- stage 2: PMOS common source ----------------
XM9  out  o1   vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=21 L=0.35 nf=1 m=6
XM10 out  nb   0    0    sky130_fd_pr__nfet_01v8_lvt W=10.4 L=1 nf=1 m=12
* ---------------- Miller compensation with nulling resistor ----------------
Rz   o1   xc   1.2k
Cc   xc   out  1.2p
.ends dut
