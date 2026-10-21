.subckt dut iref inp inn out
* ---------------- bias generation (iref is mirrored) ----------------
R1   iref nb 12k
XMNR nb   nb   0   0   sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=5
XMNM pc   nb   0   0   sky130_fd_pr__nfet_01v8_lvt W=2 L=1 nf=1 m=1
R2   pb   pc   115k
XMPD pb   pb   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=1
* ---------------- tail current source (6 x 4uA) ----------------
XMPT tail pb   vdd vdd sky130_fd_pr__pfet_01v8_lvt W=8 L=1 nf=1 m=6
* ---------------- PMOS input pair ----------------
XMP1 x1   inp  tail tail sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=4
XMP2 x2   inn  tail tail sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=4
* ---------------- PMOS cascodes ----------------
XMC1 d    pc   x1  x1  sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMC2 out  pc   x2  x2  sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* ---------------- low-voltage cascoded NMOS mirror load ----------------
XNC1 d    iref y1  0   sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
XNC2 out  iref y2  0   sky130_fd_pr__nfet_01v8_lvt W=6 L=1 nf=1 m=1
XNB1 y1   d    0   0   sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XNB2 y2   d    0   0   sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
.ends dut
