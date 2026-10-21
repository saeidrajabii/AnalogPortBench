.subckt dut iref inp inn out
* ---------------- bias ----------------
* NMOS reference diode (20 uA)
XMNd iref iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* PMOS reference diode, fed by NMOS mirror (20 uA)
XMN1 vp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMPd vp vp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
* PMOS cascode bias: vcp = Vdiode - I*R
XMPb nb nb vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
R1 nb vcp 8k
XMN2 vcp iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* NMOS cascode bias: vcn = Vgs + I*R
XMP1 vcn vp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=1
R2 vcn na 8k
XMNa na na 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
* ---------------- OTA ----------------
* tail (80 uA)
XMNt tail iref 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=4
* input pair
XMin1 f1 inp tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
XMin2 f2 inn tail 0 sky130_fd_pr__nfet_01v8_lvt W=20 L=0.5 nf=1 m=1
* PMOS top current sources (60 uA each)
XMPs1 f1 vp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=3
XMPs2 f2 vp vdd vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=1 nf=1 m=3
* PMOS cascodes
XMPc1 d1 vcp f1 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
XMPc2 out vcp f2 vdd sky130_fd_pr__pfet_01v8_lvt W=10 L=0.5 nf=1 m=1
* NMOS low-voltage cascode mirror
XMNc1 d1 vcn s1 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMNc2 out vcn s2 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=0.5 nf=1 m=1
XMNs1 s1 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
XMNs2 s2 d1 0 0 sky130_fd_pr__nfet_01v8_lvt W=4 L=1 nf=1 m=1
.ends dut
