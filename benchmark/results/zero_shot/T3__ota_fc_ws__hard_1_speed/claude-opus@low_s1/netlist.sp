.subckt dut iref inp inn out
* ---- bias: NMOS reference, 5 uA per unit device ----
XMR  iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=4
* PMOS bias diode (vbp)
XMB1 vbp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMPD vbp vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
* PMOS cascode bias (vbcp ~0.3 V)
XMB2 vbcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=1
XMPC vbcp vbcp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=0.5 L=0.6 nf=1 m=1
* NMOS cascode bias (vbcn ~0.7 V)
XMB3 vbcn vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMNC vbcn vbcn 0 0 sky130_fd_pr__nfet_01v8_lvt W=0.42 L=1 nf=1 m=1
* ---- OTA: tail 90 uA ----
XMT  tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=18
XM1  fl inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
XM2  fr inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.3 nf=1 m=1
* PMOS folding current sources, 90 uA each
XMP1 fl vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=18
XMP2 fr vbp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=18
* PMOS cascodes
XMP3 x vbcp fl fl sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=9
XMP4 out vbcp fr fr sky130_fd_pr__pfet_01v8_lvt W=4 L=0.5 nf=1 m=9
* NMOS low-voltage cascode mirror load
XMN3 x vbcn sl sl sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=9
XMN4 out vbcn sr sr sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=9
XMN1 sl x 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=9
XMN2 sr x 0 0 sky130_fd_pr__nfet_01v8_lvt W=2 L=0.5 nf=1 m=9
.ends dut
