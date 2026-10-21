* Folded-cascode OTA, SKY130 port, VDD = 1.2 V, Iref = 20 uA
.subckt dut iref inp inn out
* ---------------- bias generation ----------------
* NMOS reference diode; Rn sets the NMOS cascode gate (vbnc = iref node) ~0.28 V above vbn
Rn    iref vbn 14k
XMR   vbn  vbn  0   0   sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
* 20 uA copy feeds the PMOS diode; Rp sets vbpc ~0.24 V below vbp
XMB1  vbpc vbn  0   0   sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=1
Rp    vbp  vbpc 12k
XMPB  vbp  vbp  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=2
* ---------------- OTA core ----------------
* tail current source (~80 uA, mirror ratio 4)
XMT   tail vbn  0    0    sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=4
* NMOS input pair (bulk tied to the tail node to reduce Vgs)
XM1   fl   inp  tail tail sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=2
XM2   fr   inn  tail tail sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=2
* PMOS folding current sources (~80 uA each)
XMP1  fl   vbp  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=8
XMP2  fr   vbp  vdd  vdd  sky130_fd_pr__pfet_01v8_lvt W=20 L=1 nf=1 m=8
* PMOS cascodes (bulk tied to source in its own n-well)
XMP3  x    vbpc fl   fl   sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=2
XMP4  out  vbpc fr   fr   sky130_fd_pr__pfet_01v8_lvt W=20 L=0.5 nf=1 m=2
* NMOS low-voltage cascode mirror load
XMN3  x    iref nl   0    sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=2
XMN4  out  iref nr   0    sky130_fd_pr__nfet_01v8_lvt W=30 L=0.5 nf=1 m=2
XMN1  nl   x    0    0    sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=2
XMN2  nr   x    0    0    sky130_fd_pr__nfet_01v8_lvt W=12 L=0.5 nf=1 m=2
.ends dut
