.subckt dut iref inp inn out
* ---------------- Bias generation ----------------
* reference diode (20 uA)
XMB1  iref iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=4
* Branch B: PMOS current-source gate vbp (low-voltage cascode replica, 10 uA)
XMNB  vbp  iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=2
XMPCB vbp  vbpc npb  vdd sky130_fd_pr__pfet_01v8_lvt W=4.5 L=0.35 nf=1 m=1
XMPTB npb  vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=5.6 L=0.35 nf=1 m=1
* Branch C: PMOS cascode gate vbpc = VDD - Vsg - I*R (10 uA)
XMPDC pdc  pdc  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=4.5 L=0.35 nf=1 m=1
RC    pdc  vbpc 27k
XMNC  vbpc iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=2
* Branch A: NMOS cascode gate vbnc = Vgs + I*R (10 uA)
XMPTA npa  vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=5.6 L=0.35 nf=1 m=1
XMPCA vbnc vbpc npa  vdd sky130_fd_pr__pfet_01v8_lvt W=4.5 L=0.35 nf=1 m=1
RA    vbnc nda  22k
XMNDA nda  nda  0    0   sky130_fd_pr__nfet_01v8_lvt W=2.25 L=0.25 nf=1 m=1
* ---------------- Folded-cascode OTA ----------------
* tail (100 uA)
XMT   tail iref 0    0   sky130_fd_pr__nfet_01v8_lvt W=5 L=0.5 nf=1 m=20
* input pair (inp -> mirror side, inn -> output side)
XM1   fl   inp  tail 0   sky130_fd_pr__nfet_01v8_lvt W=4 L=0.18 nf=1 m=6
XM2   fr   inn  tail 0   sky130_fd_pr__nfet_01v8_lvt W=4 L=0.18 nf=1 m=6
* PMOS current sources (~86 uA each)
XMP1  fl   vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.35 nf=1 m=12
XMP2  fr   vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.35 nf=1 m=12
* PMOS cascodes
XMPC1 x    vbpc fl   vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.35 nf=1 m=4
XMPC2 out  vbpc fr   vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.35 nf=1 m=4
* NMOS wide-swing cascode mirror
XMNC1 x    vbnc sl   0   sky130_fd_pr__nfet_01v8_lvt W=4 L=0.25 nf=1 m=2
XMNC2 out  vbnc sr   0   sky130_fd_pr__nfet_01v8_lvt W=4 L=0.25 nf=1 m=2
XMNB1 sl   x    0    0   sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=3
XMNB2 sr   x    0    0   sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=3
.ends dut
