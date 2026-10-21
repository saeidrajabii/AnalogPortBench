.subckt dut iref inp inn out
* ---------------- bias network (mirrored from iref) ----------------
XMNR  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=11 L=4 nf=1 m=4
XMNB1 vbp  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=11 L=4 nf=1 m=2
XMPB  vbp  vbp  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=5
* NMOS cascode bias: Vcn = Vgs(replica) + 10uA*28k
XMPN  vcn  vbp  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=5
Rn    vcn  ncd  28k
XMNC  ncd  ncd  0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* PMOS cascode bias: Vcp = VDD - Vsg(replica) - 10uA*25k
XMPC  pcd  pcd  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=15 L=0.5 nf=1 m=1
Rp    pcd  vcp  25k
XMNP  vcp  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=11 L=4 nf=1 m=2
* ---------------- first stage: PMOS pair (weak inversion) ----------------
XMT   tail vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=20
XM1   fl inn tail tail sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=20
XM2   fr inp tail tail sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=20
* NMOS low-voltage cascode mirror (folding sinks)
XM3   fl x 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=6
XM4   fr x 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=6
XM5   x  vcn fl 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XM6   y  vcn fr 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* PMOS cascoded current sources (top)
XMT1  tl vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=5
XMT2  tr vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=40 L=0.5 nf=1 m=5
XMC1  x  vcp tl tl sky130_fd_pr__pfet_01v8_lvt W=15 L=0.5 nf=1 m=1
XMC2  y  vcp tr tr sky130_fd_pr__pfet_01v8_lvt W=15 L=0.5 nf=1 m=1
* ---------------- second stage: NMOS CS with replica-biased PMOS load ----------------
XMR   r   x vdd_dummy_unused 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=2
.ends dut
