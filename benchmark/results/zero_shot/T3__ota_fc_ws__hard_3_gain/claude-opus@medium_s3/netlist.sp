.subckt dut iref inp inn out
* ---------------- bias generation ----------------
* iref -> Rn -> diode MB1 : vbn = VGS(20uA), iref node = vbn + 0.16 V (NMOS cascode bias)
XMB1  vbn  vbn  0    0   sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
Rn    iref vbn  8k
* PMOS bias branch: diode MPB1 (vbp) -> Rp -> vbpc, sunk by 20 uA mirror MB2
XMB2  vbpc vbn  0    0   sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
Rp    vbp  vbpc 11k
XMPB1 vbp  vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=4
* ---------------- folded-cascode OTA ----------------
* tail (40 uA) and NMOS input pair (weak/moderate inversion for low VGS)
XMT   tail vbn  0    0   sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=2
XM1   fa   inp  tail 0   sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=4
XM2   fb   inn  tail 0   sky130_fd_pr__nfet_01v8_lvt W=20 L=1 nf=1 m=4
* PMOS folding current sources (40 uA each, long L for high fold-node resistance)
XMP1  fa   vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=8
XMP2  fb   vbp  vdd  vdd sky130_fd_pr__pfet_01v8_lvt W=20 L=2 nf=1 m=8
* PMOS cascodes
XMP3  net1 vbpc fa   vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=0.7 nf=1 m=1
XMP4  out  vbpc fb   vdd sky130_fd_pr__pfet_01v8_lvt W=28 L=0.7 nf=1 m=1
* wide-swing cascoded NMOS mirror load (self-biased from net1)
XMN3  net1 iref sa   0   sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMN4  out  iref sb   0   sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMN5  sa   net1 0    0   sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
XMN6  sb   net1 0    0   sky130_fd_pr__nfet_01v8_lvt W=40 L=1 nf=1 m=1
* compensation (sets UGB ~30-35 MHz for phase margin)
Cc    out  0    0.8p
.ends dut
