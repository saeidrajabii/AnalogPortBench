.subckt dut iref inp inn out
* ---------------- bias network ----------------
XMNR  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=4
XMT   tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=24
XMNB1 vbp  iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
XMNB2 vbpc iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=10 L=1 nf=1 m=1
* wide-swing PMOS current-source bias (vbp)
XMPB  nq  vbp  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3.5 L=0.5 nf=1 m=1
XMPBC vbp vbpc nq  vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.35 nf=1 m=1
* PMOS cascode bias (vbpc): Vds(current sources) ~ 5uA*50k
Rp    vdd ps 50k
XMPD  vbpc vbpc ps vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.35 nf=1 m=1
* NMOS cascode bias (vbn): Vds(bottom mirror) ~ 5uA*40k
XMPN1 x1  vbp  vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3.5 L=0.5 nf=1 m=1
XMPN2 vbn vbpc x1  vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.35 nf=1 m=1
XMND  vbn vbn  rn  0   sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
Rn    rn 0 40k
* ---------------- folded-cascode OTA ----------------
XM1   f1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XM2   f2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=60 L=0.5 nf=1 m=1
XMP1  f1 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3.5 L=0.5 nf=1 m=18
XMP2  f2 vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=3.5 L=0.5 nf=1 m=18
XMC1  d1  vbpc f1 vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.35 nf=1 m=6
XMC2  out vbpc f2 vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.35 nf=1 m=6
XMNC1 d1  vbn s1 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=6
XMNC2 out vbn s2 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=6
XMNM1 s1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=6
XMNM2 s2 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=6
.ends dut
