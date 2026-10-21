.subckt dut iref inp inn out
* ---------------- bias network (all mirrored from iref) ----------------
XMNR  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=11 L=4 nf=1 m=4
XMNB1 vbp  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=11 L=4 nf=1 m=4
XMPB  vbp  vbp  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=4
* NMOS cascode bias: Vcn = Vgs(replica) + 10uA*27k
XMPN  vcn  vbp  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=2
Rn    vcn  ncd  27k
XMNC  ncd  ncd  0 0 sky130_fd_pr__nfet_01v8_lvt W=5.5 L=1 nf=1 m=1
* PMOS cascode bias: Vcp = VDD - Vsg(replica) - 10uA*27k
XMPC  pcd  pcd  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=7.5 L=0.75 nf=1 m=1
Rp    pcd  vcp  27k
XMNP  vcp  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=11 L=4 nf=1 m=2
* ---------------- degenerated PMOS input pair ----------------
XMT1  s1 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=5
XMT2  s2 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=5
Rdeg  s1 s2 1.6k
XM1   fl inp s1 s1 sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=10
XM2   fr inn s2 s2 sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=10
* ---------------- folding current sinks ----------------
XM3   fl iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=11 L=4 nf=1 m=7
XM4   fr iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=11 L=4 nf=1 m=7
* ---------------- NMOS cascodes ----------------
XM5   x   vcn fl 0 sky130_fd_pr__nfet_01v8_lvt W=5.5 L=1 nf=1 m=1
XM6   out vcn fr 0 sky130_fd_pr__nfet_01v8_lvt W=5.5 L=1 nf=1 m=1
* ---------------- low-voltage PMOS cascode mirror load ----------------
XM9   x   vcp pl pl sky130_fd_pr__pfet_01v8_lvt W=7.5 L=0.75 nf=1 m=1
XM10  out vcp pr pr sky130_fd_pr__pfet_01v8_lvt W=7.5 L=0.75 nf=1 m=1
XM7   pl  x  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=1
XM8   pr  x  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=5 L=0.5 nf=1 m=1
.ends dut
