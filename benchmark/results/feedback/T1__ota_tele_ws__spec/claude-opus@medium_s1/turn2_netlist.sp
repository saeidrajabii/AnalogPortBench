.subckt dut iref inp inn out
* ---------------- reference mirror (unit: W=4/L=1 -> 10 uA) ----------------
XMR   iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=2
XMT   tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=6
XMS1  vb2  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMS2  vpe  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMS3  vxr  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=2
* ---------------- PMOS cascode bias: vb2 = VDD - I*Rp - Vgs ----------------
Rp1   vdd sd 30k
XMPD  vb2 vb2 sd vdd sky130_fd_pr__pfet_01v8_lvt W=10.7 L=1 nf=1 m=1
* ---------------- PMOS current-source bias for the replica ----------------
XMPE  vpe vpe vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMPX  vb5 vpe vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* ---------------- CM replica: vb5 = (VCM - Vgs_in) + I*Rrep + Vgs_casc ----------------
Rcm1  vdd vcm 5meg
Rcm2  vcm 0 5meg
XMN8  vdd vcm vxr 0 sky130_fd_pr__nfet_01v8_lvt W=5.3 L=1 nf=1 m=1
Rrep  sr vxr 22k
XMN11 vb5 vb5 sr 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* ---------------- telescopic core ----------------
XM1   n1  inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XM3   n2  inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=16 L=1 nf=1 m=1
XM0   d1  vb5 n1   0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XM2   out vb5 n2   0 sky130_fd_pr__nfet_01v8_lvt W=30 L=1 nf=1 m=1
XP1   d1  vb2 p1 vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1 nf=1 m=1
XP3   out vb2 p2 vdd sky130_fd_pr__pfet_01v8_lvt W=32 L=1 nf=1 m=1
XP0   p1  d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
XP2   p2  d1 vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=1 nf=1 m=1
.ends dut
